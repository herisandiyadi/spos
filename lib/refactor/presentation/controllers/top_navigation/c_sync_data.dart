import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/category/m_category.dart';
import 'package:squadra_pos/refactor/data/models/city/m_city.dart';
import 'package:squadra_pos/refactor/data/models/customer/m_customer.dart';
import 'package:squadra_pos/refactor/data/models/discount/m_discount.dart';
import 'package:squadra_pos/refactor/data/models/location/m_location.dart';
import 'package:squadra_pos/refactor/data/models/menu/m_menu.dart';
import 'package:squadra_pos/refactor/data/models/payment_method/m_payment_method.dart';
import 'package:squadra_pos/refactor/data/models/province/m_province.dart';
import 'package:squadra_pos/refactor/data/models/station/m_station.dart';
import 'package:squadra_pos/refactor/data/models/tax/m_tax.dart';
import 'package:squadra_pos/refactor/data/models/table/m_table.dart';
import 'package:squadra_pos/refactor/data/models/transaction_type/m_transaction_type.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_exception.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/domain/repositories/r_download_image.dart';
import 'package:squadra_pos/refactor/domain/repositories/r_sync_data.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/sync_data.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

enum SyncProcessState { idle, loading, success, failure }

enum SyncStatus {
  location,
  station,
  table,
  paymentMethod,
  transactionTypeJuncLite,
  category,
  menu,
  discount,
  province,
  city,
  customer,
  tax
}

class SyncDataController extends GetxController {
  SyncDataController(this.localStorage, this.downloadImageRepository,
      this.synchronizedRepository);

  final LocalStorage localStorage;
  final DownloadImageRepository downloadImageRepository;
  final SyncDataRepository synchronizedRepository;

  final dbHelper = DatabaseHelper();

  RxString syncInformation = ''.obs;

  var statusSync = RxStatus.empty().obs;

  final RxMap<SyncStatus, SyncProcessState> syncState =
      {for (var status in SyncStatus.values) status: SyncProcessState.idle}.obs;

  void _resetAllSyncStatus() {
    syncState.updateAll((key, value) => SyncProcessState.idle);
  }

  void _updateSyncStatus(SyncStatus status, SyncProcessState state) {
    syncState[status] = state;
  }

  Future<void> resetMasterData() async {
    await dbHelper.deleteMenu();
    await dbHelper.deleteCity();
    await dbHelper.deleteTable();
    await dbHelper.deleteStation();
    await dbHelper.deleteDiscount();
    await dbHelper.deleteLocation();
    await dbHelper.deleteCategory();
    await dbHelper.deleteProvince();
    await dbHelper.deleteCustomer();
    await dbHelper.deletePaymentMethodLite();
    await dbHelper.deleteTransactionTypeJuncLite();
    await dbHelper.deleteTax();
  }

  SyncProcessState getStatus(SyncStatus status) {
    return syncState[status] ?? SyncProcessState.idle;
  }

  Future<void> initializeData({int data = 0, String type = allData}) async {
    _resetAllSyncStatus();

    final bool init = await localStorage.getFirstSync();

    if (!init) {
      await resetMasterData();
      syncSection(firstSync: init);
    }

    final sync = <String, Future<void> Function()>{
      'getLocation': () async => await _getLocation(data),
      'getStation': () async => await _getStation(data),
      'getTable': () async => await _getTable(data),
      'getCategory': () async => await _getCategory(data),
      'getMenu': () async => await _getMenu(data),
      'getDiscount': () async => await _getDiscount(data),
      'getPaymentMethod': () async => await _getPaymentMethod(data),
      'getProvince': () async => await _getProvince(data),
      'getCity': () async => await _getCity(data),
      'getCustomer': () async => await _getCustomer(data),
      'getTransactionTypeJuncLite': () async =>
          await _getTransactionTypeJuncLite(data),
      'getTax': () async => await _getTax(data),
    };

    try {
      if (sync.containsKey(type)) {
        await sync[type]?.call();
      } else {
        await rebuild(data);
      }
    } catch (e, stack) {
      throw Exception("Error during sync [$type]: $e, $stack");
    }
  }

  Future<void> _getLocation(syncData) async {
    var locationLite = await dbHelper.getLocation();

    if (locationLite.isNotEmpty) {
      if (syncData == 0) return;
      if (syncData == 1) await dbHelper.deleteLocation();
    }

    _updateSyncStatus(SyncStatus.location, SyncProcessState.loading);

    final result = await synchronizedRepository.getLocation();

    result.when(
      success: (data, url, headers, statusCode) async {
        final parsed = locationFromJson(data);

        if (parsed.status == 'success') {
          final data = parsed.data;

          late int status;
          bool success = true;

          if (data.isNotEmpty) {
            for (var items in data) {
              status = await dbHelper.insertLocation(
                locationID: int.tryParse(items.locationID ?? '0') ?? 0,
                outletID: int.tryParse(items.outletID ?? '0') ?? 0,
                locationCode: items.locationCode ?? '',
                locationLabel: items.locationLabel ?? '',
              );

              if (status == 0) success = false;

              syncInformation.value =
                  'Insert Location Data ${items.locationLabel ?? 'Location label not found!'}';
            }
            _updateSyncStatus(SyncStatus.location,
                success ? SyncProcessState.success : SyncProcessState.failure);
          } else {
            _updateSyncStatus(SyncStatus.location, SyncProcessState.success);
          }
        } else {
          statusSync.value = RxStatus.error(parsed.message ?? '');
          _updateSyncStatus(SyncStatus.location, SyncProcessState.failure);
        }
      },
      error: (data, url, headers, statusCode) {
        final parsed = locationFromJson(data);

        statusSync.value = RxStatus.error(parsed.message ?? '');
        _updateSyncStatus(SyncStatus.location, SyncProcessState.failure);
      },
      failure: (exception) {
        final response = getContentErrorHTTP(exception);

        statusSync.value = RxStatus.error(response["error_messsage"]);
        _updateSyncStatus(SyncStatus.location, SyncProcessState.failure);
      },
    );
  }

  Future<void> _getStation(syncData) async {
    var stationLite = await dbHelper.getStation();

    if (stationLite.isNotEmpty) {
      if (syncData == 0) return;
      if (syncData == 1) await dbHelper.deleteStation();
    }

    _updateSyncStatus(SyncStatus.station, SyncProcessState.loading);

    final result = await synchronizedRepository.getStation();

    result.when(
      success: (data, url, headers, statusCode) async {
        final parsed = stationFromJson(data);

        if (parsed.status == 'success') {
          final data = parsed.data;

          late int status;
          bool success = true;

          if (data.isNotEmpty) {
            for (var items in data) {
              status = await dbHelper.insertStation(
                stationID: int.tryParse(items.stationID ?? '0') ?? 0,
                stationName: items.stationName ?? '',
                outletID: int.tryParse(items.outletID ?? '0') ?? 0,
              );

              if (status == 0) success = false;

              syncInformation.value =
                  'Insert Location Data ${items.stationName ?? 'Location label not found!'}';
            }
            _updateSyncStatus(SyncStatus.station,
                success ? SyncProcessState.success : SyncProcessState.failure);
          } else {
            _updateSyncStatus(SyncStatus.station, SyncProcessState.success);
          }
        } else {
          statusSync.value = RxStatus.error(parsed.message ?? '');
          _updateSyncStatus(SyncStatus.station, SyncProcessState.failure);
        }
      },
      error: (data, url, headers, statusCode) {
        final parsed = stationFromJson(data);

        statusSync.value = RxStatus.error(parsed.message ?? '');
        _updateSyncStatus(SyncStatus.station, SyncProcessState.failure);
      },
      failure: (exception) {
        final response = getContentErrorHTTP(exception);

        statusSync.value = RxStatus.error(response["error_messsage"]);
        _updateSyncStatus(SyncStatus.station, SyncProcessState.failure);
      },
    );
  }

  Future<void> _getTax(syncData) async {
    var taxLite = await dbHelper.getTax();

    if (taxLite.isNotEmpty) {
      if (syncData == 0) return;
      if (syncData == 1) await dbHelper.deleteTax();
    }

    _updateSyncStatus(SyncStatus.tax, SyncProcessState.loading);

    final result = await synchronizedRepository.getTax();

    result.when(
      success: (data, url, headers, statusCode) async {
        final parsed = taxFromJson(data);

        if (parsed.status == 'success') {
          final data = parsed.data;

          late int status;
          bool success = true;

          if (data.isNotEmpty) {
            for (var items in data) {
              status = await dbHelper.insertTax(
                taxID: int.tryParse(items.taxID ?? '0') ?? 0,
                taxName: items.taxName ?? '',
                taxPercent: double.tryParse(items.taxPercent ?? '0') ?? 0,
              );

              if (status == 0) success = false;

              syncInformation.value =
                  'Insert tax Data ${items.taxName ?? 'tax label not found!'}';
            }
            _updateSyncStatus(SyncStatus.tax,
                success ? SyncProcessState.success : SyncProcessState.failure);
          } else {
            _updateSyncStatus(SyncStatus.tax, SyncProcessState.success);
          }
        } else {
          statusSync.value = RxStatus.error(parsed.message ?? '');
          _updateSyncStatus(SyncStatus.tax, SyncProcessState.failure);
        }
      },
      error: (data, url, headers, statusCode) {
        final parsed = taxFromJson(data);

        statusSync.value = RxStatus.error(parsed.message ?? '');
        _updateSyncStatus(SyncStatus.tax, SyncProcessState.failure);
      },
      failure: (exception) {
        final response = getContentErrorHTTP(exception);

        statusSync.value = RxStatus.error(response["error_messsage"]);
        _updateSyncStatus(SyncStatus.tax, SyncProcessState.failure);
      },
    );
  }

  Future<void> _getTable(syncData) async {
    var tableLite = await dbHelper.getTable();

    if (tableLite.isNotEmpty) {
      if (syncData == 0) return;
      if (syncData == 1) await dbHelper.deleteTable();
    }

    _updateSyncStatus(SyncStatus.table, SyncProcessState.loading);

    final result = await synchronizedRepository.getTable();

    result.when(
      success: (data, url, headers, statusCode) async {
        final parsed = tableFromJson(data);

        if (parsed.status == 'success') {
          final data = parsed.data;

          late int status;
          bool success = true;

          if (data.isNotEmpty) {
            for (var items in data) {
              status = await dbHelper.insertTable(
                tableID: int.tryParse(items.tableID ?? '0') ?? 0,
                locationID: int.tryParse(items.locationID ?? '0') ?? 0,
                tableNumber: int.tryParse(items.tableNumber ?? '0') ?? 0,
                tableLabel: items.tableLabel ?? '',
                seat: int.tryParse(items.seat ?? '0') ?? 0,
                outletID: int.tryParse(items.outletID ?? '0') ?? 0,
                tableStatus: 'available',
                uniqueNumberSM: 0,
              );

              if (status == 0) success = false;

              syncInformation.value =
                  'Insert Location Data ${items.tableNumber ?? 'Location label not found!'}';
            }
            _updateSyncStatus(SyncStatus.table,
                success ? SyncProcessState.success : SyncProcessState.failure);
          } else {
            _updateSyncStatus(SyncStatus.table, SyncProcessState.success);
          }
        } else {
          statusSync.value = RxStatus.error(parsed.message ?? '');
          _updateSyncStatus(SyncStatus.table, SyncProcessState.failure);
        }
      },
      error: (data, url, headers, statusCode) {
        final parsed = tableFromJson(data);

        statusSync.value = RxStatus.error(parsed.message ?? '');
        _updateSyncStatus(SyncStatus.table, SyncProcessState.failure);
      },
      failure: (exception) {
        final response = getContentErrorHTTP(exception);

        statusSync.value = RxStatus.error(response["error_messsage"]);
        _updateSyncStatus(SyncStatus.table, SyncProcessState.failure);
      },
    );
  }

  Future<void> _getPaymentMethod(syncData) async {
    var paymentMethodLite = await dbHelper.getPaymentMethodLite();

    if (paymentMethodLite.isNotEmpty) {
      if (syncData == 0) return;
      if (syncData == 1) await dbHelper.deletePaymentMethodLite();
    }

    _updateSyncStatus(SyncStatus.paymentMethod, SyncProcessState.loading);

    final result = await synchronizedRepository.getPaymentMethod();

    result.when(
      success: (data, url, headers, statusCode) async {
        final parsed = paymentMethodFromJson(data);

        if (parsed.status == 'success') {
          final data = parsed.data;

          late int status;
          bool success = true;

          if (data.isNotEmpty) {
            for (var items in data) {
              status = await dbHelper.insertPaymentMethodLite(
                paymentMethodID:
                    int.tryParse(items.paymentMethodID ?? '0') ?? 0,
                paymentMethodName: items.paymentMethodName ?? '',
                paymentFee: double.tryParse(items.paymentFee ?? '0.0') ?? 0.0,
              );

              if (status == 0) success = false;

              syncInformation.value =
                  'Insert Location Data ${items.paymentMethodName ?? 'Location label not found!'}';
            }
            _updateSyncStatus(SyncStatus.paymentMethod,
                success ? SyncProcessState.success : SyncProcessState.failure);
          } else {
            _updateSyncStatus(
                SyncStatus.paymentMethod, SyncProcessState.success);
          }
        } else {
          statusSync.value = RxStatus.error(parsed.message ?? '');
          _updateSyncStatus(SyncStatus.paymentMethod, SyncProcessState.failure);
        }
      },
      error: (data, url, headers, statusCode) {
        final parsed = paymentMethodFromJson(data);

        statusSync.value = RxStatus.error(parsed.message ?? '');
        _updateSyncStatus(SyncStatus.paymentMethod, SyncProcessState.failure);
      },
      failure: (exception) {
        final response = getContentErrorHTTP(exception);

        statusSync.value = RxStatus.error(response["error_messsage"]);
        _updateSyncStatus(SyncStatus.paymentMethod, SyncProcessState.failure);
      },
    );
  }

  Future<void> _getTransactionTypeJuncLite(syncData) async {
    var transactionTypeJuncLite = await dbHelper.getTransactionTypeJuncLite();

    if (transactionTypeJuncLite.isNotEmpty) {
      if (syncData == 0) return;
      if (syncData == 1) await dbHelper.deleteTransactionTypeJuncLite();
    }

    _updateSyncStatus(
        SyncStatus.transactionTypeJuncLite, SyncProcessState.loading);

    final result = await synchronizedRepository.getTransactionType();

    result.when(
      success: (data, url, headers, statusCode) async {
        final parsed = transactionTypeFromJson(data);

        if (parsed.status == 'success') {
          final data = parsed.data;

          late int status;
          bool success = true;

          if (data.isNotEmpty) {
            for (var items in data) {
              status = await dbHelper.insertTransactionTypeJuncLite(
                transactionTypeJuncID:
                    int.tryParse(items.transactionTypeJuncID ?? '0') ?? 0,
                transJuncName: items.transJuncName ?? '',
                transTypeID: int.tryParse(items.transTypeID ?? '0') ?? 0,
                chargeType: items.chargeType ?? '',
                chargeValue: int.tryParse(items.chargeValue ?? '0') ?? 0,
                outletID: int.tryParse(items.outletID ?? '0') ?? 0,
              );

              if (status == 0) success = false;

              syncInformation.value =
                  'Insert Location Data ${items.transJuncName ?? 'Location label not found!'}';
            }
            _updateSyncStatus(SyncStatus.transactionTypeJuncLite,
                success ? SyncProcessState.success : SyncProcessState.failure);
          } else {
            _updateSyncStatus(
                SyncStatus.transactionTypeJuncLite, SyncProcessState.success);
          }
        } else {
          statusSync.value = RxStatus.error(parsed.message ?? '');
          _updateSyncStatus(
              SyncStatus.transactionTypeJuncLite, SyncProcessState.failure);
        }
      },
      error: (data, url, headers, statusCode) {
        final parsed = transactionTypeFromJson(data);

        statusSync.value = RxStatus.error(parsed.message ?? '');
        _updateSyncStatus(
            SyncStatus.transactionTypeJuncLite, SyncProcessState.failure);
      },
      failure: (exception) {
        final response = getContentErrorHTTP(exception);

        statusSync.value = RxStatus.error(response["error_messsage"]);
        _updateSyncStatus(
            SyncStatus.transactionTypeJuncLite, SyncProcessState.failure);
      },
    );
  }

  Future<void> _getCategory(syncData) async {
    var categoryLite = await dbHelper.getCategory();

    if (categoryLite.isNotEmpty) {
      if (syncData == 0) return;
      if (syncData == 1) {
        await dbHelper.deleteCategory();

        Directory? directory;

        if (Platform.isAndroid) directory = await getExternalStorageDirectory();
        if (Platform.isIOS)
          directory = await getApplicationDocumentsDirectory();

        if (directory != null) {
          try {
            final dir = Directory(directory.path);

            if (await dir.exists()) {
              for (var file in dir.listSync()) {
                if (file is File &&
                    (file.path.endsWith('.png') ||
                        file.path.endsWith('.jpg') ||
                        file.path.endsWith('.jpeg'))) {
                  await file.delete();
                }
              }
            }
          } catch (e, stacktrace) {
            throw Exception("Failed remove image category: $e, $stacktrace");
          }
        }
      }
    }

    _updateSyncStatus(SyncStatus.category, SyncProcessState.loading);

    final result = await synchronizedRepository.getCategory();

    result.when(
      success: (data, url, headers, statusCode) async {
        final parsed = categoryModelFromJson(data);

        if (parsed.status == 'success') {
          final data = parsed.data;

          late int status;
          bool success = true;

          if (data.isNotEmpty) {
            int batchSizeCat = 10;
            List<Future<void>> downloadTasksCat = [];

            for (var items in data) {
              status = await dbHelper.insertCategory(
                categoryID: int.tryParse(items.categoryID ?? '0') ?? 0,
                categoryName: items.categoryName ?? '',
                categoryImage: items.categoryImage ?? '',
              );

              downloadTasksCat.add(
                _downloadImage(
                  id: int.tryParse(items.categoryID ?? '0') ?? 0,
                  url: items.categoryImage ?? '',
                  filename:
                      'category_image_${int.tryParse(items.categoryID ?? '0') ?? 0}',
                ),
              );

              if (downloadTasksCat.length >= batchSizeCat) {
                await Future.wait(downloadTasksCat);
                downloadTasksCat.clear();
              }

              if (status == 0) success = false;

              syncInformation.value =
                  'Insert Location Data ${items.categoryName ?? 'Location label not found!'}';
            }
            _updateSyncStatus(SyncStatus.category,
                success ? SyncProcessState.success : SyncProcessState.failure);
          } else {
            _updateSyncStatus(SyncStatus.category, SyncProcessState.success);
          }
        } else {
          statusSync.value = RxStatus.error(parsed.message ?? '');
          _updateSyncStatus(SyncStatus.category, SyncProcessState.failure);
        }
      },
      error: (data, url, headers, statusCode) {
        final parsed = categoryModelFromJson(data);

        statusSync.value = RxStatus.error(parsed.message ?? '');
        _updateSyncStatus(SyncStatus.category, SyncProcessState.failure);
      },
      failure: (exception) {
        final response = getContentErrorHTTP(exception);

        statusSync.value = RxStatus.error(response["error_messsage"]);
        _updateSyncStatus(SyncStatus.category, SyncProcessState.failure);
      },
    );
  }

  Future<void> _getMenu(syncData) async {
    var menuLite = await dbHelper.getMenu();

    if (menuLite.isNotEmpty) {
      if (syncData == 0) return;
      if (syncData == 1) {
        await dbHelper.deleteMenu();

        Directory? directory;

        if (Platform.isAndroid) directory = await getExternalStorageDirectory();
        if (Platform.isIOS)
          directory = await getApplicationDocumentsDirectory();

        if (directory != null) {
          try {
            final dir = Directory(directory.path);

            if (await dir.exists()) {
              for (var file in dir.listSync()) {
                if (file is File &&
                    (file.path.endsWith('.png') ||
                        file.path.endsWith('.jpg') ||
                        file.path.endsWith('.jpeg'))) {
                  await file.delete();
                }
              }
            }
          } catch (e, stacktrace) {
            throw Exception("Failed remove image menu: $e, $stacktrace");
          }
        }
      }
    }

    _updateSyncStatus(SyncStatus.menu, SyncProcessState.loading);

    final result = await synchronizedRepository.getMenu();

    result.when(
      success: (data, url, headers, statusCode) async {
        final parsed = menuModelFromJson(data);

        if (parsed.status == 'success') {
          final data = parsed.data;

          late int status;
          bool success = true;

          if (data.isNotEmpty) {
            int batchSizeCat = 10;
            List<Future<void>> downloadTasksMenu = [];

            for (var items in data) {
              String addOn = jsonEncode(items.addOn);
              String noteOption = jsonEncode(items.noteOption);

              status = await dbHelper.insertMenu(
                menuID: int.tryParse(items.menuID ?? '0') ?? 0,
                menuCode: items.menuCode ?? '',
                menuImage: items.menuImage ?? '',
                categoryID: int.tryParse(items.categoryID ?? '0') ?? 0,
                stationID: int.tryParse(items.stationID ?? '0') ?? 0,
                menuName: items.menuName ?? '',
                menuDesc: items.menuDesc ?? '',
                menuPrice: int.tryParse(items.menuPrice ?? '0') ?? 0,
                menuDiscount: int.tryParse(items.menuDiscount ?? '0') ?? 0,
                menuType: items.menuType ?? '',
                addOn: addOn,
                noteOption: noteOption,
                arrange: items.arrange,
              );

              downloadTasksMenu.add(
                _downloadImage(
                  id: int.tryParse(items.menuID ?? '0') ?? 0,
                  url: items.menuImage ?? '',
                  filename:
                      'menu_image_${int.tryParse(items.menuID ?? '0') ?? 0}',
                ),
              );

              if (downloadTasksMenu.length >= batchSizeCat) {
                await Future.wait(downloadTasksMenu);
                downloadTasksMenu.clear();
              }

              if (status == 0) success = false;

              syncInformation.value =
                  'Insert menu Data ${items.menuName ?? 'Menu name not found!'}';
            }

            if (downloadTasksMenu.isNotEmpty)
              await Future.wait(downloadTasksMenu);

            _updateSyncStatus(SyncStatus.menu,
                success ? SyncProcessState.success : SyncProcessState.failure);
          } else {
            _updateSyncStatus(SyncStatus.menu, SyncProcessState.success);
          }
        } else {
          statusSync.value = RxStatus.error(parsed.message ?? '');
          _updateSyncStatus(SyncStatus.menu, SyncProcessState.failure);
        }
      },
      error: (data, url, headers, statusCode) {
        final parsed = menuModelFromJson(data);

        statusSync.value = RxStatus.error(parsed.message ?? '');
        _updateSyncStatus(SyncStatus.menu, SyncProcessState.failure);
      },
      failure: (exception) {
        final response = getContentErrorHTTP(exception);

        statusSync.value = RxStatus.error(response["error_messsage"]);
        _updateSyncStatus(SyncStatus.menu, SyncProcessState.failure);
      },
    );
  }

  Future<void> _getDiscount(syncData) async {
    var discountLite = await dbHelper.getDiscount();

    if (discountLite.isNotEmpty) {
      if (syncData == 0) return;
      if (syncData == 1) await dbHelper.deleteDiscount();
    }

    _updateSyncStatus(SyncStatus.discount, SyncProcessState.loading);

    final result = await synchronizedRepository.getDiscount();

    result.when(
      success: (data, url, headers, statusCode) async {
        final parsed = discountModelFromJson(data);

        if (parsed.status == 'success') {
          final data = parsed.data;

          late int status;
          bool success = true;

          if (data.isNotEmpty) {
            for (var items in data) {
              String availDay = jsonEncode(items.availableDay);
              status = await dbHelper.insertDiscount(
                  masterDiscountID:
                      int.tryParse(items.masterDiscountID ?? '0') ?? 0,
                  masterDiscountName: items.masterDiscountName ?? '',
                  discountType: int.tryParse(items.discountType ?? '0') ?? 0,
                  valueType: items.valueType ?? '',
                  discountValue: int.tryParse(items.discountValue ?? '0') ?? 0,
                  spesificMenuID: jsonEncode(items.spesificMenu),
                  discountValidFrom: items.discountValidFrom ?? '',
                  discountValidUntil: items.discountValidUntil ?? '',
                  minTransDiscount:
                      int.tryParse(items.minTransDiscount ?? '0') ?? 0,
                  outletID: int.tryParse(items.outletId ?? '0') ?? 0,
                  maxDiscount: int.tryParse(items.maxDiscount ?? '0') ?? 0,
                  qtyDiscount: int.tryParse(items.qtyDiscount ?? '0') ?? 0,
                  availableDay: availDay);

              if (status == 0) success = false;

              syncInformation.value =
                  'Insert Location Data ${items.masterDiscountName ?? 'Location label not found!'}';
            }
            _updateSyncStatus(SyncStatus.discount,
                success ? SyncProcessState.success : SyncProcessState.failure);
          } else {
            _updateSyncStatus(SyncStatus.discount, SyncProcessState.success);
          }
        } else {
          statusSync.value = RxStatus.error(parsed.message ?? '');
          _updateSyncStatus(SyncStatus.discount, SyncProcessState.failure);
        }
      },
      error: (data, url, headers, statusCode) {
        final parsed = discountModelFromJson(data);

        statusSync.value = RxStatus.error(parsed.message ?? '');
        _updateSyncStatus(SyncStatus.discount, SyncProcessState.failure);
      },
      failure: (exception) {
        final response = getContentErrorHTTP(exception);

        statusSync.value = RxStatus.error(response["error_messsage"]);
        _updateSyncStatus(SyncStatus.discount, SyncProcessState.failure);
      },
    );
  }

  Future<void> _getProvince(syncData) async {
    var provinceLite = await dbHelper.getProvince();

    if (provinceLite.isNotEmpty) {
      if (syncData == 0) return;
      if (syncData == 1) await dbHelper.deleteProvince();
    }

    _updateSyncStatus(SyncStatus.province, SyncProcessState.loading);

    final result = await synchronizedRepository.getProvince();

    result.when(
      success: (data, url, headers, statusCode) async {
        final parsed = provinceModelFromJson(data);

        if (parsed.status == 'success') {
          final data = parsed.data;

          late int status;
          bool success = true;

          if (data.isNotEmpty) {
            for (var items in data) {
              status = await dbHelper.insertProvince(
                provinceID: int.tryParse(items.provinceId ?? '0') ?? 0,
                provinceName: items.provinceName ?? '',
              );

              if (status == 0) success = false;

              syncInformation.value =
                  'Insert Location Data ${items.provinceName ?? 'Location label not found!'}';
            }
            _updateSyncStatus(SyncStatus.province,
                success ? SyncProcessState.success : SyncProcessState.failure);
          } else {
            _updateSyncStatus(SyncStatus.province, SyncProcessState.success);
          }
        } else {
          statusSync.value = RxStatus.error(parsed.message ?? '');
          _updateSyncStatus(SyncStatus.province, SyncProcessState.failure);
        }
      },
      error: (data, url, headers, statusCode) {
        final parsed = provinceModelFromJson(data);

        statusSync.value = RxStatus.error(parsed.message ?? '');
        _updateSyncStatus(SyncStatus.province, SyncProcessState.failure);
      },
      failure: (exception) {
        final response = getContentErrorHTTP(exception);

        statusSync.value = RxStatus.error(response["error_messsage"]);
        _updateSyncStatus(SyncStatus.province, SyncProcessState.failure);
      },
    );
  }

  Future<void> _getCity(syncData) async {
    var cityLite = await dbHelper.getCity();

    if (cityLite.isNotEmpty) {
      if (syncData == 0) return;
      if (syncData == 1) await dbHelper.deleteCity();
    }

    _updateSyncStatus(SyncStatus.city, SyncProcessState.loading);

    final result = await synchronizedRepository.getCity();

    result.when(
      success: (data, url, headers, statusCode) async {
        final parsed = cityModelFromJson(data);

        if (parsed.status == 'success') {
          final data = parsed.data;

          late int status;
          bool success = true;

          if (data.isNotEmpty) {
            for (var items in data) {
              status = await dbHelper.insertCity(
                cityID: int.tryParse(items.cityId ?? '0') ?? 0,
                provinceID: int.tryParse(items.provinceId ?? '0') ?? 0,
                cityName: items.cityName ?? '',
              );

              if (status == 0) success = false;

              syncInformation.value =
                  'Insert Location Data ${items.cityName ?? 'Location label not found!'}';
            }
            _updateSyncStatus(SyncStatus.city,
                success ? SyncProcessState.success : SyncProcessState.failure);
          } else {
            _updateSyncStatus(SyncStatus.city, SyncProcessState.success);
          }
        } else {
          statusSync.value = RxStatus.error(parsed.message ?? '');
          _updateSyncStatus(SyncStatus.city, SyncProcessState.failure);
        }
      },
      error: (data, url, headers, statusCode) {
        final parsed = cityModelFromJson(data);

        statusSync.value = RxStatus.error(parsed.message ?? '');
        _updateSyncStatus(SyncStatus.city, SyncProcessState.failure);
      },
      failure: (exception) {
        final response = getContentErrorHTTP(exception);

        statusSync.value = RxStatus.error(response["error_messsage"]);
        _updateSyncStatus(SyncStatus.city, SyncProcessState.failure);
      },
    );
  }

  Future<void> _getCustomer(syncData) async {
    var customerLite = await dbHelper.getCustomer();

    if (customerLite.isNotEmpty) {
      if (syncData == 0) return;
      if (syncData == 1) await dbHelper.deleteCustomer();
    }

    _updateSyncStatus(SyncStatus.customer, SyncProcessState.loading);

    final result = await synchronizedRepository.getCustomer();

    result.when(
      success: (data, url, headers, statusCode) async {
        final parsed = customerModelFromJson(data);

        if (parsed.status == 'success') {
          final data = parsed.data;

          late int status;
          bool success = true;

          if (data.isNotEmpty) {
            for (var items in data) {
              status = await dbHelper.insertCustomer(
                customerCode: items.customerCode ?? '',
                fullname: items.fullname ?? '',
                email: items.email ?? '',
                mobileNo: int.tryParse(items.mobileNo ?? '0') ?? 0,
                birthDate: items.birthDate ?? '0000-00-00',
                provinceID: int.tryParse(items.provinceId ?? '0') ?? 0,
                cityID: int.tryParse(items.cityId ?? '0') ?? 0,
                address: items.address ?? '',
                outletID: int.tryParse(items.outletId ?? '0') ?? 0,
              );

              if (status == 0) success = false;

              syncInformation.value =
                  'Insert Location Data ${items.fullname ?? 'Location label not found!'}';
            }
            _updateSyncStatus(SyncStatus.customer,
                success ? SyncProcessState.success : SyncProcessState.failure);
          } else {
            _updateSyncStatus(SyncStatus.customer, SyncProcessState.success);
          }
        } else {
          statusSync.value = RxStatus.error(parsed.message ?? '');
          _updateSyncStatus(SyncStatus.customer, SyncProcessState.failure);
        }
      },
      error: (data, url, headers, statusCode) {
        final parsed = customerModelFromJson(data);

        statusSync.value = RxStatus.error(parsed.message ?? '');
        _updateSyncStatus(SyncStatus.customer, SyncProcessState.failure);
      },
      failure: (exception) {
        final response = getContentErrorHTTP(exception);

        statusSync.value = RxStatus.error(response["error_messsage"]);
        _updateSyncStatus(SyncStatus.customer, SyncProcessState.failure);
      },
    );
  }

  Future<void> _downloadImage(
      {required int id, required String url, required String filename}) async {
    if (url.isEmpty) return;

    final result = await downloadImageRepository.getDownloadImage(url: url);

    result.when(
      success: (data, url, headers, statusCode) async {
        final bytes = Uint8List.fromList(data.codeUnits);

        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/$filename';
        final file = File(filePath);

        await file.writeAsBytes(bytes);

        debugPrint('Saving image $filename');
      },
      error: (data, url, headers, statusCode) {
        debugPrint('Saving image $filename failed: $statusCode');
      },
      failure: (exception) {
        final response = getContentErrorHTTP(exception);
        debugPrint(
            'Saving image $filename failed: ${response["error_message"]}');
      },
    );
  }

  Future<void> rebuild(data) async {
    await _getLocation(data);
    await _getStation(data);
    await _getTable(data);
    await _getCategory(data);
    await _getMenu(data);
    await _getDiscount(data);
    await _getPaymentMethod(data);
    await _getProvince(data);
    await _getCity(data);
    await _getCustomer(data);
    await _getTransactionTypeJuncLite(data);
    await _getTax(data);

    await localStorage.saveFirstSync(true);

    refresh();
  }

  void syncSection({required bool firstSync}) async {
    return showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SyncData(firstSync: firstSync);
      },
    );
  }

  @override
  void onInit() {
    super.onInit();

    Future.microtask(() async {
      await initializeData();
    });
  }
}
