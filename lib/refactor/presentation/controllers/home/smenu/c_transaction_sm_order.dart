import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_category/g_category.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_menu/g_menu.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_station/g_station.dart';
import 'package:squadra_pos/refactor/data/models/transaction_smenu_detail/m_transaction_sm_detail.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/domain/repositories/transactions/smenu/r_smenu.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_detail.dart';
// import 'package:squadra_pos/refactor/presentation/screens/smenu/component_smenu_order/smenu_reprint_bill.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';

class TransactionOrderSMController extends GetxController {
  TransactionOrderSMController(this.localStorage, this.sMenuRepository,
      this.transactionDetailSMController);

  final LocalStorage localStorage;
  final SMenuRepository sMenuRepository;
  final TransactionDetailSMController transactionDetailSMController;

  final dbHelper = DatabaseHelper();
  final pageController = PageController();

  final menuList = <MenuLiteModel>[].obs;
  final menuFilter = <MenuLiteModel>[].obs;
  final categoriesList = <CategoryLiteModel>[].obs;

  final menuImagePath = <int, String>{}.obs;
  final categoryImagePath = <int, String>{}.obs;

  final notesFocusNode = FocusNode();
  final notesController = TextEditingController();

  final RxMap<String, Set<int>> selectedAddonPerCategory =
      <String, Set<int>>{}.obs;

  final selectedNoteIndex = RxInt(-1);
  final printedIds = <String>{};

  RxInt qtyItemDetail = 1.obs;

  RxString isStaffName = ''.obs;
  RxString isOutletName = ''.obs;

  RxInt isOutletId = 0.obs;
  RxInt isCurrentIndex = 0.obs;
  RxInt isSelectCategory = 0.obs;
  RxBool isWaiters = false.obs;
  final printedIdsChecker = <String>{}.obs;
  final printedIdsStation = <String>{}.obs;

  var status = RxStatus.empty().obs;

  void createIncrementQty() {
    qtyItemDetail.value++;
  }

  void createDecrementQtyItem() {
    if (qtyItemDetail.value > 1) {
      qtyItemDetail.value--;
    }
  }

  void updateIncrementQty(
      {required int cartDetailId,
      required int uniqueNumber,
      String? notes}) async {
    qtyItemDetail.value++;
    int total = qtyItemDetail.value;

    await updateItemCall(
        cartDetailId: cartDetailId, uniqueNumber: uniqueNumber, qty: total);
  }

  void updateDecrementQtyItem(
      {required int cartDetailId, required uniqueNumber, String? notes}) async {
    if (qtyItemDetail.value > 1) {
      qtyItemDetail.value--;
      int total = qtyItemDetail.value;

      await updateItemCall(
          cartDetailId: cartDetailId, uniqueNumber: uniqueNumber, qty: total);
    }
  }

  bool isAddonSelected(String key, int id) {
    return selectedAddonPerCategory[key]?.contains(id) ?? false;
  }

  void toggleAddon(String key, int id, bool isChecked) {
    selectedAddonPerCategory.update(
      key,
      (set) {
        final newSet = Set<int>.from(set);

        if (isChecked) {
          newSet.add(id);
        } else {
          newSet.remove(id);
        }
        return newSet;
      },
      ifAbsent: () => isChecked ? {id} : <int>{},
    );
  }

  void selectSingleAddon(String key, int id) {
    selectedAddonPerCategory[key] = {id};
  }

  void updateSelectedNoteIndex(int value) {
    selectedNoteIndex.value = value;
  }

  void resetItems() {
    qtyItemDetail.value = 1;
    notesController.clear();
    selectedNoteIndex.value = -1;
    status.value = RxStatus.empty();
    selectedAddonPerCategory.clear();
  }

  void getDataOutlet() async {
    isStaffName.value = await localStorage.getStaffName();
    isOutletId.value = await localStorage.getOutletID();
    isOutletName.value = await localStorage.getOutletName();
  }

  void getMenuLite() async {
    try {
      final results = await dbHelper.getMenu();

      menuList.assignAll(results);
      menuFilter.assignAll(results);

      for (var data in results) {
        getPathMenuImage(id: data.menuID);
      }
    } catch (e, stackTrace) {
      throw Exception("Error fetching get menu lite: $e, $stackTrace");
    }
  }

  void getCategoryLite() async {
    final result = await dbHelper.getCategory();

    categoriesList.assignAll(result);

    for (var cat in result) {
      getPathCategoryImage(id: cat.categoryID);
    }
  }

  void getMenuFiltered({String? value}) {
    menuFilter.value = menuList
        .where((response) =>
            response.menuName.toLowerCase().contains(value ?? ''.toLowerCase()))
        .toList();
  }

  void getPathCategoryImage({required int id}) async {
    String? path;

    if (Platform.isAndroid) {
      path =
          '/data/user/0/com.squadra.squadra_pos/app_flutter/category_image_$id';
    } else if (Platform.isIOS) {
      final directory = await getApplicationDocumentsDirectory();

      path = '${directory.path}/category_image_$id';
    }

    if (path != null) {
      categoryImagePath[id] = path;
    }
  }

  void getPathMenuImage({required int id}) async {
    String? path;

    if (Platform.isAndroid) {
      path = '/data/user/0/com.squadra.squadra_pos/app_flutter/menu_image_$id';
    } else if (Platform.isIOS) {
      final directory = await getApplicationDocumentsDirectory();

      path = '${directory.path}/menu_image_$id';
    }

    if (path != null) {
      menuImagePath[id] = path;
    }
  }

  void handleTabCategory({required int id}) {
    isSelectCategory.value = id;

    if (id == 0) {
      menuFilter.value = menuList;
    } else {
      menuFilter.value =
          menuList.where((menu) => menu.categoryID == id).toList();
    }
  }

  Future<void> getDataStaff() async {
    String dataStaff = await localStorage.getDataStaff();
    String actionName = await localStorage.getActionName();

    for (var staff in jsonDecode(dataStaff)) {
      String data = staff['AuthLevelID']?['ActionName'];

      if (data.toLowerCase() == "waiters") {
        if (data.toLowerCase() == actionName.toLowerCase()) {
          isWaiters.value = true;
        }
      }
    }
  }

  bool validateSelectedAddons(List<Map<String, dynamic>> addonList) {
    final selectedMap = selectedAddonPerCategory;

    for (var addon in addonList) {
      final String title = addon['title'];
      final bool required = addon['required'] == 1;
      final bool multiply = addon['multiply'] == 1;
      final int min = addon['min'] ?? 1;

      final selected = selectedMap[title] ?? <int>{};

      if (required) {
        if (multiply) {
          // :: Required and can multiply
          if (selected.isEmpty || selected.length < min) return false;
        } else {
          // :: Required but cannot multiply
          if (selected.isEmpty) return false;
        }
      }
    }
    return true;
  }

  List<Map<String, dynamic>> buildSelectedAddOns(
      {required List<Map<String, dynamic>> parsedAddOns,
      required Map<String, Set<int>> selectedAddonPerCategory}) {
    return parsedAddOns.expand<Map<String, dynamic>>((category) {
      final String categoryTitle = category["title"] ?? "";
      final List<dynamic> menuAddOnList = category["MenuAddOn"] ?? [];

      return menuAddOnList.whereType<Map<String, dynamic>>().where((item) {
        final selectedIDs = selectedAddonPerCategory[categoryTitle];
        final itemID = int.tryParse(item["MenuID"].toString());
        return selectedIDs?.contains(itemID) ?? false;
      }).map((item) {
        final int menuID = int.tryParse(item["MenuID"].toString()) ?? 0;
        final int menuPrice = int.tryParse(item["MenuPrice"].toString()) ?? 0;
        final int menuDiscount =
            int.tryParse(item["MenuDiscount"].toString()) ?? 0;

        return {
          "menuID": menuID,
          "menuName": item["MenuName"] ?? "",
          "qty": 1,
          "menuPrice": menuPrice,
          "menuPriceAfterDiscount": menuPrice - menuDiscount,
        };
      });
    }).toList();
  }

  Future<void> addToCartCall(
      {required dynamic addOn,
      required MenuLiteModel menu,
      required Map<String, dynamic> transaction}) async {
    final parsed = addOn.whereType<Map<String, dynamic>>().toList();
    final isValid = validateSelectedAddons(parsed);

    if (!isValid) {
      status.value = RxStatus.error("Please complete all required fields.");

      return;
    }

    Get.back();

    status.value = RxStatus.empty();

    final addOnList = buildSelectedAddOns(
      parsedAddOns: parsed,
      selectedAddonPerCategory: selectedAddonPerCategory,
    );

    final outletName = await localStorage.getOutletName();

    final Map<String, dynamic> requestBody = {
      "UniqeNumber": transaction["unique_number"],
      "CustomerID": transaction["customer_id"],
      "OutletName": outletName,
      "TableNumber": transaction["table_number"],
      "TransactionType": transaction["transaction_type"],
      "details": [
        {
          "menuID": menu.menuID,
          "menuName": menu.menuName,
          "qty": qtyItemDetail.value,
          "menuPrice": menu.menuPrice,
          "menuPriceAfterDiscount": (menu.menuPrice) - (menu.menuDiscount),
          "Notes": notesController.text,
          "noteOption": "",
          "parentID": menu.menuID,
          "menuImage": menu.menuImage,
          "addOn": addOnList,
        }
      ]
    };

    final result = await sMenuRepository.postAddToCartSM(body: requestBody);

    result.when(
      success: (data, url, headers, statusCode) {
        final status = json.decode(data)['status'];

        if (status == "success") {
          transactionDetailSMController.rebuild(
              uniqueNumber: transaction["unique_number"]);
        }
      },
      error: (data, url, headers, statusCode) {
        // status.value = RxStatus.error(jsonDecode(data)["message"]);
      },
      failure: (exception) {
        // final response = getContentErrorHTTP(exception);

        // status.value = RxStatus.error(response["error_type"]);
      },
    );
  }

  Future<void> removeItemCall(
      {required int cartDetailId, required int uniqueNumber}) async {
    final result =
        await sMenuRepository.getRemoveCartSM(param: cartDetailId.toString());

    result.when(
      success: (data, url, headers, statusCode) {
        final status = json.decode(data)['status'];

        if (status == "success") {
          transactionDetailSMController.rebuild(uniqueNumber: uniqueNumber);
        }
      },
      error: (data, url, headers, statusCode) {
        // status.value = RxStatus.error(jsonDecode(data)["message"]);
      },
      failure: (exception) {
        // final response = getContentErrorHTTP(exception);

        // status.value = RxStatus.error(response["error_type"]);
      },
    );
  }

  Future<void> clearItemCall(
      {required int cartId, required int uniqueNumber}) async {
    final result =
        await sMenuRepository.getClearCartSM(param: cartId.toString());

    result.when(
      success: (data, url, headers, statusCode) {
        final status = json.decode(data)['status'];

        if (status == "success") {
          transactionDetailSMController.rebuild(uniqueNumber: uniqueNumber);
        }
      },
      error: (data, url, headers, statusCode) {
        // status.value = RxStatus.error(jsonDecode(data)["message"]);
      },
      failure: (exception) {
        // final response = getContentErrorHTTP(exception);

        // status.value = RxStatus.error(response["error_type"]);
      },
    );
  }

  Future<void> updateItemCall(
      {int? cartDetailId, required int qty, required int uniqueNumber}) async {
    final requestBody = {
      "cartDetailID": cartDetailId,
      "Notes": notesController.text,
      "Qty": qty
    };

    final result = await sMenuRepository.postUpdateCartSM(body: requestBody);

    result.when(
      success: (data, url, headers, statusCode) {
        final status = json.decode(data)['status'];

        if (status == "success") {
          transactionDetailSMController.rebuild(uniqueNumber: uniqueNumber);
        }
      },
      error: (data, url, headers, statusCode) {
        // status.value = RxStatus.error(jsonDecode(data)["message"]);
      },
      failure: (exception) {
        // final response = getContentErrorHTTP(exception);

        // status.value = RxStatus.error(response["error_type"]);
      },
    );
  }

/**
 * 
 * handle print call
 */

//print ketika send order dari SPOS
  Future<void> sendOrderCall(
      {required int rePrint,
      required int cartID,
      required List<dynamic> detail,
      required Rxn<TransactionSMHeaderData> header}) async {
    final requestBody = {
      "cartID": cartID,
      "transactionID": header.value?.transactionID ?? 0
    };

    final result = await sMenuRepository.postSendOrderSM(body: requestBody);

    result.when(
      success: (data, url, headers, statusCode) async {
        final status = json.decode(data)['status'];
        //if (status == "success") {
        // status = RxStatus.success();
        // }
        if (status == "success") {
          final transNum = header.value?.transactionNumber;
          final TableLabel = header.value?.tableLabel;
          transactionDetailSMController.rebuild(
              uniqueNumber: header.value?.uniqueNumber ?? 0);
          final result = await dbHelper.getStation();
          final stations =
              result.map((model) => StationLiteModel.fromJson(model)).toList();
          // final details = transactionDetailSMController.transactionSMDetailList;
          // final detailForStation;
          // if (value.stationName.toLowerCase() == 'checker') {
          // detailForStation = detail.where((d) => d.printKitchen == 2).toList();

          for (final value in stations) {
            try {
              // filter detail sesuai station
              final detailForStation;
              if (value.stationName.toLowerCase() == 'checker') {
                detailForStation =
                    detail.where((d) => d.printKitchen == 0).toList();
              } else {
                detailForStation = detail
                    .where((d) => d.printKitchen == 0)
                    .where((d) => d.stationID == value.stationID)
                    .toList();
              }

              if (detailForStation.isEmpty) {
                debugPrint("ℹ️ Tidak ada item untuk ${value.stationName}");
                continue;
              }

              await printDocketsReprint(
                rePrint,
                transNum,
                header,
                TableLabel,
                detailForStation,
                value.stationID,
                value.stationName,
              );

              // kasih jeda biar printer stabil
              await Future.delayed(const Duration(milliseconds: 800));
            } catch (e, st) {
              debugPrint("❌ Gagal print di ${value.stationName}: $e\n$st");
            }
          }
        }
      },
      error: (data, url, headers, statusCode) {
        // status.value = RxStatus.error(jsonDecode(data)["message"]);
      },
      failure: (exception) {
        // final response = getContentErrorHTTP(exception);

        // status.value = RxStatus.error(response["error_type"]);
      },
    );
  }

  Future<void> handlePrintBill(
      RxList<TransactionSMDetailData> transactionSMDetailList,
      Rxn<TransactionSMHeaderData> transactionSMFooterData) async {
    final primary = await localStorage.getPrimaryPrinter();
    Generator generator;
    final profile = await CapabilityProfile.load();
    generator = Generator(PaperSize.mm58, profile);

    if (primary.first == 'BluetoothPrinter') {
      bool connected = await PrintBluetoothThermal.connectionStatus;

      if (!connected) return;
      final profile = await CapabilityProfile.load();
      generator = Generator(PaperSize.mm58, profile);
      final ticket = await printBillCall(
          transactionSMDetailList, transactionSMFooterData, generator);
      await PrintBluetoothThermal.writeBytes(ticket);
    } else {
      final profile = await CapabilityProfile.load();
      final printer = NetworkPrinter(PaperSize.mm80, profile);
      final PosPrintResult response =
          await printer.connect(primary[1], port: 9100);

      if (response != PosPrintResult.success) return;

      generator = Generator(PaperSize.mm80, profile);
      final ticket = await printBillCall(
          transactionSMDetailList, transactionSMFooterData, generator);
      printer.rawBytes(Uint8List.fromList(ticket));
      printer.disconnect();
    }
  }

//print docket call dari smenu(customer)
  // Future<void> printDocketsAuto(transactionNumber, tableLabel, detail) async {
  //   final result = await dbHelper.getStation();
  //   final stations =
  //       result.map((model) => StationLiteModel.fromJson(model)).toList();
  //   List<dynamic> detailForStation = [];
  //   final primaryPrinter = await localStorage.getPrimaryPrinter();
  //   print('DATA APA INI? ${detail}');
  //   if (primaryPrinter.first != 'BluetoothPrinter') {
  //     //PRINT CHECKER DULU
  //     detailForStation = detail
  //         .where(
  //             (d) => !printedIdsChecker.contains(d['CartDetailID'].toString()))
  //         .toList();
  //     print('DATA CHECKER:${detailForStation}');

  //     if (detailForStation.isNotEmpty) {
  //       await printDocketPrint(
  //           transactionNumber, tableLabel, detailForStation, 99, 'Checker');

  //       printedIdsChecker.addAll(
  //           detailForStation.map((d) => d['CartDetailID'].toString()).toList());

  //       await Future.delayed(const Duration(milliseconds: 800));
  //     }
  //   }
  //   for (final value in stations) {
  //     try {
  //       if (value.stationName.toLowerCase() == 'checker') {
  //         // checker sudah diprint di atas, skip
  //         continue;
  //       }

  //       detailForStation = detail
  //           .where((d) =>
  //               d['StationID'] == value.stationID &&
  //               !printedIdsStation.contains(d['CartDetailID'].toString()))
  //           .toList();
  //       print('DATA STATION ${value.stationName} :${detailForStation}');

  //       if (detailForStation.isEmpty) {
  //         debugPrint("ℹ️ Tidak ada item untuk ${value.stationName}");
  //         continue;
  //       }
  //       if (detailForStation.isNotEmpty) {
  //         await printDocketPrint(transactionNumber, tableLabel,
  //             detailForStation, value.stationID, value.stationName);

  //         // if (value.stationName.toLowerCase() != 'checker') {
  //         printedIdsStation.addAll(detailForStation
  //             .map((d) => d['CartDetailID'].toString())
  //             .toList());

  //         // }
  //         // kasih jeda biar printer stabil
  //         await Future.delayed(const Duration(milliseconds: 800));
  //       }
  //     } catch (e, st) {
  //       debugPrint("❌ Gagal print di : $e\n$st");
  //     }
  //   }
  // }

  Future<void> printDocketsAuto(
      String transactionNumber, String tableLabel, List<dynamic> detail) async {
    final result = await dbHelper.getStation();
    final stations = result.map((m) => StationLiteModel.fromJson(m)).toList();

    final primaryPrinter = await localStorage.getPrimaryPrinter();

    // STEP 1: print checker
    final detailForChecker = detail.toList();

    debugPrint(
        "🔵 [CHECKER] $transactionNumber: ${detailForChecker.map((d) => d['CartDetailID'])}");

    if (detailForChecker.isNotEmpty) {
      await printDocketPrint(
          transactionNumber, tableLabel, detailForChecker, 99, 'Checker');
      // printedIds
      //     .addAll(detailForChecker.map((d) => d['CartDetailID'].toString()));
      await Future.delayed(const Duration(milliseconds: 50));
    }
    printedIds.clear();
    // STEP 2: print per station
    for (final station in stations) {
      if (station.stationName.toLowerCase() == 'checker') continue;

      final detailForStation = detail
          .where((d) =>
              d['StationID'] == station.stationID &&
              !printedIds.contains(d['CartDetailID'].toString()))
          .toList();

      debugPrint(
          "🟠 [${station.stationName}] $transactionNumber: ${detailForStation.map((d) => d['CartDetailID'])}");

      if (detailForStation.isEmpty) continue;

      await printDocketPrint(transactionNumber, tableLabel, detailForStation,
          station.stationID, station.stationName);
      printedIds
          .addAll(detailForStation.map((d) => d['CartDetailID'].toString()));
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }

//print ketika Re-send order dari SPOS
  Future<void> printDockets(rePrint, header, detail) async {
    final transNum = header.value?.transactionNumber;
    final TableLabel = header.value?.tableLabel;

    final result = await dbHelper.getStation();
    final stations =
        result.map((model) => StationLiteModel.fromJson(model)).toList();
    for (final value in stations) {
      try {
        // filter detail sesuai station
        final detailForStation;
        if (value.stationName.toLowerCase() == 'checker') {
          detailForStation = detail.toList();
        } else {
          detailForStation =
              detail.where((d) => d.stationID == value.stationID).toList();
        }
        if (detailForStation.isEmpty) {
          debugPrint("ℹ️ Tidak ada item untuk ${value.stationName}");
          continue;
        }

        await printDocketsReprint(
          rePrint,
          transNum ?? '',
          header,
          TableLabel ?? '',
          detailForStation,
          value.stationID,
          value.stationName,
        );

        // kasih jeda biar printer stabil
        await Future.delayed(const Duration(milliseconds: 800));
      } catch (e, st) {
        debugPrint("❌ Gagal print di ${value.stationName}: $e\n$st");
      }
    }
  }

/**
 * 
 * Control print
 */
  Future<void> printDocketsReprint(rePrint, transactionNumber, header,
      tableLabel, detail, stationID, stationName) async {
    final primaryPrinter = await localStorage.getPrimaryPrinter();
    final prefs = await SharedPreferences.getInstance();
    print('Print Docket Reprint');
    Generator generator;
    final profile = await CapabilityProfile.load();
    generator = Generator(PaperSize.mm58, profile);

    final printer = prefs.getString(stationName) ?? '';

    if (printer.isNotEmpty) {
      if (printer == 'to Primary') {
        if (primaryPrinter.first == 'BluetoothPrinter') {
          bool connected = await PrintBluetoothThermal.connectionStatus;

          if (!connected) return;
          // print('${detail[0]['printKitchen']}');
          final profile = await CapabilityProfile.load();
          generator = Generator(PaperSize.mm58, profile);
          final List<dynamic> transactionDetailList;
          if (detail.isNotEmpty) {
            transactionDetailList = detail.toList();

            if (transactionDetailList.isNotEmpty) {
              List<int> ticket = await generateTicket2(
                  rePrint: rePrint,
                  transactionNumber: transactionNumber,
                  type: 'printDocket',
                  stationID: stationID,
                  stationName: stationName,
                  tableLabel: tableLabel,
                  generator: generator,
                  detail: transactionDetailList,
                  header: header);

              await PrintBluetoothThermal.writeBytes(ticket);
              if (stationName.toLowerCase() != 'checker') {
                for (var i = 0; i < transactionDetailList.length; i++) {
                  final result = await sMenuRepository.postUpdatePrintSM(
                      param: transactionDetailList[i].cartDetailID.toString());

                  result.when(
                    success: (data, url, headers, statusCode) async {
                      final status = json.decode(data)['status'];

                      if (status == "success") {}
                    },
                    error: (data, url, headers, statusCode) {
                      // status.value = RxStatus.error(jsonDecode(data)["message"]);
                    },
                    failure: (exception) {
                      // final response = getContentErrorHTTP(exception);

                      // status.value = RxStatus.error(response["error_type"]);
                    },
                  );
                }
              }
            }
          }
        } else {
          final profile = await CapabilityProfile.load();
          final printer = NetworkPrinter(PaperSize.mm80, profile);
          final PosPrintResult response =
              await printer.connect(primaryPrinter[1], port: 9100);
          final List<dynamic> transactionDetailList;
          if (response != PosPrintResult.success) return;

          generator = Generator(PaperSize.mm80, profile);

          transactionDetailList = detail.toList();

          if (transactionDetailList.isNotEmpty) {
            final ticket = await generateTicket2(
                rePrint: rePrint,
                transactionNumber: transactionNumber,
                type: 'printDocket',
                stationID: stationID,
                stationName: stationName,
                tableLabel: tableLabel,
                generator: generator,
                detail: transactionDetailList,
                header: header);
            printer.rawBytes(Uint8List.fromList(ticket));
            // await sendBytes(printer, ticket);
            // await Future.delayed(const Duration(seconds: 1));

            await Future.delayed(const Duration(seconds: 1));
            printer.disconnect();
            if (stationName.toLowerCase() != 'checker') {
              for (var i = 0; i < transactionDetailList.length; i++) {
                final result = await sMenuRepository.postUpdatePrintSM(
                    param: transactionDetailList[i].cartDetailID.toString());

                result.when(
                  success: (data, url, headers, statusCode) async {
                    final status = json.decode(data)['status'];

                    if (status == "success") {}
                  },
                  error: (data, url, headers, statusCode) {
                    // status.value = RxStatus.error(jsonDecode(data)["message"]);
                  },
                  failure: (exception) {
                    // final response = getContentErrorHTTP(exception);

                    // status.value = RxStatus.error(response["error_type"]);
                  },
                );
              }
            }
          }
        }
      } else {
        final profile = await CapabilityProfile.load();
        final printer = NetworkPrinter(PaperSize.mm80, profile);
        final PosPrintResult response =
            await printer.connect(primaryPrinter[1], port: 9100);
        final List<dynamic> transactionDetailList;
        if (response != PosPrintResult.success) return;

        generator = Generator(PaperSize.mm80, profile);

        transactionDetailList = detail.toList();

        if (transactionDetailList.isNotEmpty) {
          final ticket = await generateTicket2(
              rePrint: rePrint,
              transactionNumber: transactionNumber,
              type: 'printDocket',
              stationID: stationID,
              stationName: stationName,
              tableLabel: tableLabel,
              generator: generator,
              detail: transactionDetailList,
              header: header);
          printer.rawBytes(Uint8List.fromList(ticket));
          // await sendBytes(printer, ticket);
          // await Future.delayed(const Duration(seconds: 1));

          await Future.delayed(const Duration(seconds: 1));
          printer.disconnect();
          if (stationName.toLowerCase() != 'checker') {
            for (var i = 0; i < transactionDetailList.length; i++) {
              final result = await sMenuRepository.postUpdatePrintSM(
                  param: transactionDetailList[i].cartDetailID.toString());

              result.when(
                success: (data, url, headers, statusCode) async {
                  final status = json.decode(data)['status'];

                  if (status == "success") {}
                },
                error: (data, url, headers, statusCode) {
                  // status.value = RxStatus.error(jsonDecode(data)["message"]);
                },
                failure: (exception) {
                  // final response = getContentErrorHTTP(exception);

                  // status.value = RxStatus.error(response["error_type"]);
                },
              );
            }
          }
        }
      }
    }
  }

  Future<void> printDocketPrint(
      transactionNumber, tableLabel, detail, stationID, stationName) async {
    print('Print Docket print');
    final primaryPrinter = await localStorage.getPrimaryPrinter();
    Generator generator;
    final profile = await CapabilityProfile.load();
    generator = Generator(PaperSize.mm58, profile);
    final prefs = await SharedPreferences.getInstance();
    final printer = prefs.getString(stationName) ?? '';

    if (printer.isNotEmpty) {
      if (printer == 'to Primary') {
        if (primaryPrinter.first == 'BluetoothPrinter') {
          bool connected = await PrintBluetoothThermal.connectionStatus;

          if (!connected) return;
          final profile = await CapabilityProfile.load();
          generator = Generator(PaperSize.mm58, profile);

          if (detail.isNotEmpty) {
            List<int> ticket = await generateTicket(
              transactionNumber: transactionNumber,
              type: 'printDocket',
              stationID: stationID,
              stationName: stationName,
              tableLabel: tableLabel,
              generator: generator,
              detail: detail,
            );

            await PrintBluetoothThermal.writeBytes(ticket);
            // if (stationName.toLowerCase() != 'checker') {
            for (var i = 0; i < detail.length; i++) {
              final result = await sMenuRepository.postUpdatePrintSM(
                  param: detail[i]['CartDetailID'].toString());

              result.when(
                success: (data, url, headers, statusCode) async {
                  final status = json.decode(data)['status'];

                  if (status == "success") {}
                },
                error: (data, url, headers, statusCode) {
                  // status.value = RxStatus.error(jsonDecode(data)["message"]);
                },
                failure: (exception) {
                  // final response = getContentErrorHTTP(exception);

                  // status.value = RxStatus.error(response["error_type"]);
                },
              );
            }
          }
        } else {
          final profile = await CapabilityProfile.load();
          final printer = NetworkPrinter(PaperSize.mm80, profile);
          final PosPrintResult response =
              await printer.connect(primaryPrinter[1], port: 9100);

          if (response != PosPrintResult.success) return;

          generator = Generator(PaperSize.mm80, profile);

          if (detail.isNotEmpty) {
            final ticket = await generateTicket(
              transactionNumber: transactionNumber,
              type: 'printDocket',
              stationID: stationID,
              stationName: stationName,
              tableLabel: tableLabel,
              generator: generator,
              detail: detail,
            );
            printer.rawBytes(Uint8List.fromList(ticket));

            await Future.delayed(const Duration(seconds: 1));
            printer.disconnect();
            // if (stationName.toLowerCase() != 'checker') {
            for (var i = 0; i < detail.length; i++) {
              final result = await sMenuRepository.postUpdatePrintSM(
                  param: detail[i]['CartDetailID'].toString());

              result.when(
                success: (data, url, headers, statusCode) async {
                  final status = json.decode(data)['status'];

                  if (status == "success") {}
                },
                error: (data, url, headers, statusCode) {
                  // status.value = RxStatus.error(jsonDecode(data)["message"]);
                },
                failure: (exception) {
                  // final response = getContentErrorHTTP(exception);

                  // status.value = RxStatus.error(response["error_type"]);
                },
              );
            }
          }
        }
      } else {
        final profile = await CapabilityProfile.load();
        final printer = NetworkPrinter(PaperSize.mm80, profile);
        final PosPrintResult response =
            await printer.connect(primaryPrinter[1], port: 9100);

        if (response != PosPrintResult.success) return;

        generator = Generator(PaperSize.mm80, profile);

        if (detail.isNotEmpty) {
          final ticket = await generateTicket(
            transactionNumber: transactionNumber,
            type: 'printDocket',
            stationID: stationID,
            stationName: stationName,
            tableLabel: tableLabel,
            generator: generator,
            detail: detail,
          );
          printer.rawBytes(Uint8List.fromList(ticket));

          await Future.delayed(const Duration(seconds: 1));
          printer.disconnect();
          // if (stationName.toLowerCase() != 'checker') {
          for (var i = 0; i < detail.length; i++) {
            final result = await sMenuRepository.postUpdatePrintSM(
                param: detail[i]['CartDetailID'].toString());

            result.when(
              success: (data, url, headers, statusCode) async {
                final status = json.decode(data)['status'];

                if (status == "success") {}
              },
              error: (data, url, headers, statusCode) {
                // status.value = RxStatus.error(jsonDecode(data)["message"]);
              },
              failure: (exception) {
                // final response = getContentErrorHTTP(exception);

                // status.value = RxStatus.error(response["error_type"]);
              },
            );
          }
        }
      }
    }
  }

/**
 * 
 * Template print
 */
  Future<List<int>> generateTicket(
      {required String transactionNumber,
      required String type,
      int? stationID,
      String? stationName,
      required String tableLabel,
      required Generator generator,
      required List<dynamic> detail}) async {
    String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    String tdata = DateFormat("HH:mm:ss").format(DateTime.now());

    List<int> bytes = [];

    bytes += generator.reset();

    bytes += generator.feed(1);
    bytes += generator.row([
      PosColumn(
        text: '',
        width: 1,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: stationName!,
        width: 10,
        styles: const PosStyles(align: PosAlign.center),
      ),
      PosColumn(
        text: '',
        width: 1,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.hr();

    bytes += generator.row([
      PosColumn(
        text: '$cdate $tdata ',
        width: 12,
        styles: const PosStyles(align: PosAlign.left),
      ),
    ]);
    if (tableLabel != '') {
      bytes += generator.row([
        PosColumn(
          text: 'Table $tableLabel',
          width: 12,
          styles: const PosStyles(align: PosAlign.left, bold: true),
        ),
      ]);
    }

    bytes += generator.hr();

    List<Map<String, dynamic>> transDetailRes = await dbHelper
        .getTransactionDetail(transactionNumber: transactionNumber);
    Iterable list = transDetailRes;

    // for (var i = 0; i < detail.length; i++) {
    //   List<Map<String, dynamic>> transDetailAddonRes =
    //       await dbHelper.getTransactionDetailAddOn(
    //           detail[i].transactionDetailID);

    //   transactionDetailList[i] =
    //       transactionDetailList[i].copyWith(addOn: transDetailAddonRes);
    // }

    // transactionDetailList = List.from(transactionDetailList);

    num jumItem = 0;

    for (var cartPrint in detail) {
      // num normalPrice = cartPrint.menuPrice;
      // :: Harusnya bukan normal price tapi price after discount
      final List<String> wrappedName =
          wrapText(cartPrint['menuName'], 20); // 20 karakter per baris

      for (int i = 0; i < wrappedName.length; i++) {
        bytes += generator.row([
          PosColumn(
            text: i == 0
                ? '${cartPrint['qty']} x ${wrappedName[i]}'
                : wrappedName[i],
            width: 11,
            styles: const PosStyles(
              align: PosAlign.left,
              height: PosTextSize.size2,
              width: PosTextSize.size2,
            ),
          ),
          PosColumn(
            text: '',
            width: 1,
          ),
        ]);
      }
      // bytes += generator.row([
      //   PosColumn(
      //     text: '${cartPrint['Qty']} x ${cartPrint['MenuName']}',
      //     width: 12,
      //     styles: const PosStyles(
      //       align: PosAlign.left,
      //       height: PosTextSize.size2,
      //       width: PosTextSize.size2,
      //     ),
      //   ),
      // ]);

      if (cartPrint['addOn'] != '') {
        for (var resAddon in cartPrint['addOn']) {
          final List<String> wrappedNameaddOn =
              wrapText(resAddon['menuName'], 20); // 20 karakter per baris

          for (int i = 0; i < wrappedNameaddOn.length; i++) {
            bytes += generator.row([
              PosColumn(
                text: i == 0 ? '- ${wrappedNameaddOn[i]}' : wrappedNameaddOn[i],
                width: 11,
                styles: const PosStyles(
                  align: PosAlign.left,
                  height: PosTextSize.size2,
                  width: PosTextSize.size2,
                ),
              ),
              PosColumn(
                text: '',
                width: 1,
              ),
            ]);
          }
          // bytes += generator.row([
          //   PosColumn(
          //     text: '',
          //     width: 1,
          //   ),
          //   PosColumn(
          //     text: '- ${resAddon['MenuName']}',
          //     width: 11,
          //     styles: const PosStyles(
          //       align: PosAlign.left,
          //       height: PosTextSize.size2,
          //       width: PosTextSize.size2,
          //     ),
          //   ),
          // ]);
        }
      }
      if (cartPrint['noteOption'] != null) {
        bytes += generator.row([
          PosColumn(
            text: '',
            width: 1,
          ),
          PosColumn(
            text: 'Note Option : ${cartPrint['noteOption']}',
            width: 11,
            styles: const PosStyles(
              align: PosAlign.left,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
            ),
          ),
        ]);
      }

      if (cartPrint['notes'] != null) {
        bytes += generator.row([
          PosColumn(
            text: '',
            width: 1,
          ),
          PosColumn(
            text: 'Notes : ${cartPrint['notes']}',
            width: 11,
            styles: const PosStyles(
              align: PosAlign.left,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
            ),
          ),
        ]);
      }

      jumItem += cartPrint['Qty'];
    }
    bytes += generator.hr();
    bytes += generator.row([
      PosColumn(
        text: '$jumItem Item /  $transactionNumber',
        width: 12,
        styles: const PosStyles(align: PosAlign.left),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        text:
            'Your Order #${transactionNumber.substring(transactionNumber.length - 3)}',
        width: 12,
        styles: const PosStyles(align: PosAlign.left),
      ),
    ]);
    bytes += generator.feed(2);
    bytes += generator.cut();
    return bytes;
  }

  Future<List<int>> generateTicket2(
      {required int rePrint,
      required String transactionNumber,
      required String type,
      int? stationID,
      String? stationName,
      required String tableLabel,
      required Generator generator,
      detail,
      header}) async {
    String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    String tdata = DateFormat("HH:mm:ss").format(DateTime.now());
    final staffName = await localStorage.getStaffName();

    List<int> bytes = [];

    bytes += generator.reset();
    if (rePrint == 1) {
      bytes += generator.row([
        PosColumn(
          text: '',
          width: 1,
          styles: const PosStyles(
            align: PosAlign.left,
            bold: true,
            height: PosTextSize.size2,
            width: PosTextSize.size2,
          ),
        ),
        PosColumn(
          text: 'Reprint',
          width: 10,
          styles: const PosStyles(
            align: PosAlign.center,
            bold: true,
            height: PosTextSize.size2,
            width: PosTextSize.size2,
          ),
        ),
        PosColumn(
          text: '',
          width: 1,
          styles: const PosStyles(
            align: PosAlign.right,
            bold: true,
            height: PosTextSize.size2,
            width: PosTextSize.size2,
          ),
        ),
      ]);
    }

    bytes += generator.feed(1);
    bytes += generator.row([
      PosColumn(
        text: '',
        width: 1,
        styles: const PosStyles(align: PosAlign.center),
      ),
      PosColumn(
        text: stationName!,
        width: 10,
        styles: const PosStyles(align: PosAlign.center),
      ),
      PosColumn(
        text: '',
        width: 1,
        styles: const PosStyles(align: PosAlign.center),
      ),
    ]);

    bytes += generator.hr();

    bytes += generator.row([
      PosColumn(
        text: '$cdate $tdata ',
        width: 12,
        styles: const PosStyles(align: PosAlign.left),
      ),
    ]);
    if (tableLabel != '') {
      bytes += generator.row([
        PosColumn(
          text: 'Table $tableLabel - $staffName',
          width: 12,
          styles: const PosStyles(align: PosAlign.left, bold: true),
        ),
      ]);
    }
    bytes += generator.row([
      PosColumn(
        text:
            '${header.value?.transactionType} - ${header.value?.customerName == "" ? '---' : header.value?.customerName}',
        width: 12,
        styles: const PosStyles(align: PosAlign.left),
      ),
    ]);
    bytes += generator.hr();

    num jumItem = 0;

    for (var cartPrint in detail) {
      final List<String> wrappedName =
          wrapText(cartPrint.menuName, 20); // 20 karakter per baris

      for (int i = 0; i < wrappedName.length; i++) {
        bytes += generator.row([
          PosColumn(
            text: i == 0
                ? '${cartPrint.qty} x ${wrappedName[i]}'
                : wrappedName[i],
            width: 11,
            styles: const PosStyles(
              align: PosAlign.left,
              height: PosTextSize.size2,
              width: PosTextSize.size2,
            ),
          ),
          PosColumn(
            text: '',
            width: 1,
          ),
        ]);
      }
      // bytes += generator.row([
      //   PosColumn(
      //     text: '${cartPrint.qty} x ${cartPrint.menuName}',
      //     width: 11,
      //     styles: const PosStyles(
      //       align: PosAlign.left,
      //       height: PosTextSize.size2,
      //       width: PosTextSize.size2,
      //     ),
      //   ),
      //   PosColumn(
      //     text: '',
      //     width: 1,
      //   ),
      // ]);
      for (var resAddon in cartPrint.addOn) {
        final List<String> wrappedNameaddOn =
            wrapText(resAddon.menuName, 20); // 20 karakter per baris

        for (int i = 0; i < wrappedNameaddOn.length; i++) {
          bytes += generator.row([
            PosColumn(
              text: i == 0 ? '- ${wrappedNameaddOn[i]}' : wrappedNameaddOn[i],
              width: 11,
              styles: const PosStyles(
                align: PosAlign.left,
                height: PosTextSize.size2,
                width: PosTextSize.size2,
              ),
            ),
            PosColumn(
              text: '',
              width: 1,
            ),
          ]);
        }
        // bytes += generator.row([
        //   PosColumn(
        //     text: '',
        //     width: 1,
        //   ),
        //   PosColumn(
        //     text: '- ${resAddon.menuName}',
        //     width: 11,
        //     styles: const PosStyles(
        //       align: PosAlign.left,
        //       height: PosTextSize.size2,
        //       width: PosTextSize.size2,
        //     ),
        //   ),
        // ]);
      }
      if (cartPrint.notes != '') {
        bytes += generator.row([
          PosColumn(
            text: '',
            width: 1,
          ),
          PosColumn(
            text: 'Notes : ${cartPrint.notes}',
            width: 11,
            styles: const PosStyles(
              align: PosAlign.left,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
            ),
          ),
        ]);
      }

      jumItem += cartPrint.qty;
    }
    bytes += generator.hr();
    bytes += generator.row([
      PosColumn(
        text: '$jumItem Item /  $transactionNumber',
        width: 12,
        styles: const PosStyles(align: PosAlign.left),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        text:
            'Your Order #${transactionNumber.substring(transactionNumber.length - 3)}',
        width: 12,
        styles: const PosStyles(align: PosAlign.left),
      ),
    ]);
    bytes += generator.feed(2);
    bytes += generator.cut();
    return bytes;
  }

  String formatTwoColumnText({String? left, String? right, int width = 32}) {
    int space = width - (left ?? '').length - (right ?? '').length;

    if (space < 0) space = 1;

    return '$left${' ' * space}$right';
  }

  Future<List<int>> printBillCall(
      RxList<TransactionSMDetailData> transactionSMDetailList,
      Rxn<TransactionSMHeaderData> transactionSMFooterData,
      Generator generator) async {
    int totalItem = 0;

    String dateNow = DateFormat("yyyy-MM-dd").format(DateTime.now());
    String timeNow = DateFormat("HH:mm:ss").format(DateTime.now());

    final outletName = await localStorage.getOutletName();
    final outletImage = await localStorage.getImageUrl();
    final staffName = await localStorage.getStaffName();
    final outletFB = await localStorage.getOutletFB();
    final outletIG = await localStorage.getOutletIG();
    final outletTikTok = await localStorage.getOutletTiktok();
    final outletWeb = await localStorage.getOutletWeb();

    // final profile = await CapabilityProfile.load();
    // final generator = Generator(PaperSize.mm58, profile);

    List<int> bytes = [];

    bytes += generator.reset();

    if (outletImage.isNotEmpty) {
      final Uint8List imageBytes = await File(outletImage).readAsBytes();
      final img.Image? image = img.decodeImage(imageBytes);
      if (image != null) {
        final resizedImage = img.copyResize(image, width: 200);
        bytes += generator.image(resizedImage, align: PosAlign.center);
      }
    }

    bytes += generator.row([
      PosColumn(
        text: '${outletName}',
        width: 12,
        styles: PosStyles(
            fontType: PosFontType.fontA,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center),
      ),
    ]);

    bytes += generator.feed(1);
    bytes += generator.text('Bill',
        styles: PosStyles(
            align: PosAlign.center, bold: true, fontType: PosFontType.fontA));
    bytes += generator.text('THIS IS NOT RECEIPT',
        styles: PosStyles(align: PosAlign.center, fontType: PosFontType.fontA));
    bytes += generator.hr();

    bytes += generator.row([
      PosColumn(
        text: 'Created On :',
        width: 4, // setengah dari lebar total (12)
        styles: PosStyles(
          fontType: PosFontType.fontA,
          align: PosAlign.left,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
      ),
      PosColumn(
        text: '${transactionSMFooterData.value?.datetime}',
        width: 8,
        styles: PosStyles(
          fontType: PosFontType.fontA,
          align: PosAlign.right,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
      ),
    ]);

    bytes += generator.row([
      PosColumn(
        text: 'Printed On :',
        width: 4, // setengah dari lebar total (12)
        styles: PosStyles(
          fontType: PosFontType.fontA,
          align: PosAlign.left,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
      ),
      PosColumn(
        text: '$dateNow $timeNow',
        width: 8,
        styles: PosStyles(
          fontType: PosFontType.fontA,
          align: PosAlign.right,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        text: 'Customer',
        width: 5, // setengah dari lebar total (12)
        styles: PosStyles(fontType: PosFontType.fontA, align: PosAlign.left),
      ),
      PosColumn(
        text:
            '${transactionSMFooterData.value?.customerName == '' ? '---' : transactionSMFooterData.value?.customerName}',
        width: 7,
        styles: PosStyles(
          fontType: PosFontType.fontA,
          align: PosAlign.right,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
      ),
    ]);
    if ((transactionSMFooterData.value?.transactionType ?? '').isNotEmpty) {
      bytes += generator.hr();
      bytes += generator.row([
        PosColumn(
          text:
              '${transactionSMFooterData.value?.transactionType == 'Dine In' ? '${transactionSMFooterData.value?.transactionType} [Table ${transactionSMFooterData.value?.tableLabel}]' : transactionSMFooterData.value?.transactionType}',
          width: 12,
          styles: PosStyles(
            fontType: PosFontType.fontA,
            align: PosAlign.center,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
          ),
        ),
      ]);
      bytes += generator.hr();
    }

    // :: List cart
    for (var data in transactionSMDetailList) {
      totalItem += data.qty ?? 0;

      bytes += generator.row([
        PosColumn(
            text: '${data.menuName}',
            width: 11,
            styles:
                PosStyles(align: PosAlign.left, fontType: PosFontType.fontA)),
        PosColumn(
            text: '',
            width: 1,
            styles:
                PosStyles(align: PosAlign.right, fontType: PosFontType.fontA))
      ]);
      // bytes += generator.text(
      //   formatTwoColumnText(
      //       left: '${data.qty} x ${numberFormatNoIDR(data.menuPrice)}',
      //       right: numberFormatNoIDR((data.menuPrice ?? 0) * (data.qty ?? 0))),
      // );
      bytes += generator.row([
        PosColumn(
          text: '${data.qty} x ${numberFormatNoIDR(data.menuPrice)}',
          width: 7,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: numberFormatNoIDR((data.menuPrice ?? 0) * (data.qty ?? 0))
              .toString(),
          width: 5,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);

      for (var value in data.addOn) {
        bytes += generator.row([
          PosColumn(
            text: '- ${value.menuName}',
            width: 7,
            styles: const PosStyles(align: PosAlign.left),
          ),
          PosColumn(
            text: numberFormatNoIDR((data.menuPrice ?? 0) * (data.qty ?? 0))
                .toString(),
            width: 5,
            styles: const PosStyles(align: PosAlign.right),
          ),
        ]);
      }
      // if (data.noteOption.isNotEmpty) {
      //   bytes += generator.text(
      //     'Note Option : ${data.noteOption}',
      //     styles: const PosStyles(align: PosAlign.left),
      //   );
      // }
      if ((data.notes ?? '').isNotEmpty) {
        bytes += generator.text(
          'Notes : ${data.notes}',
          styles: const PosStyles(align: PosAlign.left),
        );
      }
      bytes += generator.feed(1);
    }
    bytes += generator.hr();

    bytes += generator.row([
      PosColumn(
        text: 'Subtotal',
        width: 6,
        styles: const PosStyles(
          align: PosAlign.left,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
      ),
      PosColumn(
        text: numberFormatNoIDR(transactionSMFooterData.value?.subTotal ?? 0)
            .toString(),
        width: 6,
        styles: const PosStyles(
          align: PosAlign.right,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
      ),
    ]);
    // if ((discountTotalFinal + transactionList.first.discountTotal) > 0) {
    //   bytes += generator.text(
    //     formatTwoColumnText('Discount Total', numberFormatNoIDR(discountTotalFinal + transactionList.first.discountTotal).toString()),
    //   );
    // }
    if ((transactionSMFooterData.value?.ppn ?? 0) > 0) {
      bytes += generator.row([
        PosColumn(
          text: 'PPN',
          width: 6,
          styles: const PosStyles(
            align: PosAlign.left,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
          ),
        ),
        PosColumn(
          text: numberFormatNoIDR(transactionSMFooterData.value?.ppn ?? 0)
              .toString(),
          width: 6,
          styles: const PosStyles(
            align: PosAlign.right,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
          ),
        ),
      ]);
    }
    bytes += generator.row([
      PosColumn(
        text: 'Round',
        width: 6,
        styles: const PosStyles(
          align: PosAlign.left,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
      ),
      PosColumn(
        text: numberFormatNoIDR(transactionSMFooterData.value?.rounding ?? 0)
            .toString(),
        width: 6,
        styles: const PosStyles(
          align: PosAlign.right,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        text: 'Grand Total',
        width: 6,
        styles: const PosStyles(
          align: PosAlign.left,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
      ),
      PosColumn(
        text: numberFormatNoIDR(
                transactionSMFooterData.value?.grandTotalFinal ?? 0)
            .toString(),
        width: 6,
        styles: const PosStyles(
          align: PosAlign.right,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        text: 'Total Due',
        width: 6,
        styles: const PosStyles(
          align: PosAlign.left,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
      ),
      PosColumn(
        text: numberFormatNoIDR(
                transactionSMFooterData.value?.grandTotalFinal ?? 0)
            .toString(),
        width: 6,
        styles: const PosStyles(
          align: PosAlign.right,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
      ),
    ]);

    bytes += generator.hr();

    bytes += generator.row([
      PosColumn(
        text: '#$totalItem Item',
        width: 4, // setengah dari lebar total (12)
        styles: PosStyles(align: PosAlign.left, fontType: PosFontType.fontB),
      ),
      PosColumn(
        text: staffName,
        width: 8,
        styles: PosStyles(align: PosAlign.right, fontType: PosFontType.fontB),
      ),
    ]);
    bytes += generator.feed(1);
    bytes += generator.text(
        transactionSMFooterData.value?.transactionNumber ?? '---',
        styles: PosStyles(align: PosAlign.center, fontType: PosFontType.fontA));
    // bytes +=
    //     generator.text(staffName, styles: PosStyles(align: PosAlign.center));
    bytes += generator.text('Your Order',
        styles: PosStyles(align: PosAlign.center, fontType: PosFontType.fontA));
    bytes += generator.text(
        '#${(transactionSMFooterData.value?.transactionNumber ?? '').substring((transactionSMFooterData.value?.transactionNumber ?? '').length - 3)}',
        styles: PosStyles(align: PosAlign.center, fontType: PosFontType.fontA));

    for (final socmed in [outletFB, outletIG, outletTikTok, outletWeb]) {
      if (socmed.isNotEmpty) {
        bytes += generator.text(socmed,
            styles:
                PosStyles(align: PosAlign.center, fontType: PosFontType.fontA));
      }
    }

    bytes += generator.feed(1);
    bytes += generator.text('Powered by squadra.id',
        styles: PosStyles(align: PosAlign.center, fontType: PosFontType.fontA));
    bytes += generator.cut();
    return bytes;
    // await PrintBluetoothThermal.writeBytes(bytes);
  }

  List<String> wrapText(String text, int maxChars) {
    final List<String> lines = [];
    while (text.length > maxChars) {
      // cari spasi terakhir sebelum maxChars supaya tidak putus kata
      int breakIndex = text.lastIndexOf(' ', maxChars);
      if (breakIndex == -1) breakIndex = maxChars;
      lines.add(text.substring(0, breakIndex).trim());
      text = text.substring(breakIndex).trim();
    }
    if (text.isNotEmpty) lines.add(text);
    return lines;
  }

  @override
  void onInit() {
    super.onInit();
    getMenuLite();
    getDataOutlet();
    getDataStaff();
    getCategoryLite();
  }
}
