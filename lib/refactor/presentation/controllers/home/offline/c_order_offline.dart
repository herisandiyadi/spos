import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_category/g_category.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_location/g_location.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_menu/g_menu.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_table/g_table.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction/g_transaction.dart';
import 'package:squadra_pos/refactor/presentation/screens/offline/component_offline_order/change_table_confirm.dart';

class OrderOfflineController extends GetxController {
  final _dbHelper = DatabaseHelper();

  final menuList = <MenuLiteModel>[].obs;
  final tableList = <TableLiteModel>[].obs;
  final categoryList = <CategoryLiteModel>[].obs;
  final reserveList = <LocationLiteModel, List<TableLiteModel>>{}.obs;
  final transactionList = <TransactionLiteModel>[].obs;

  final searchFocusNode = FocusNode();
  final searchController = TextEditingController();

  VoidCallback? onTableChanged;

  RxInt grandTotal = 0.obs;
  RxInt selectedTable = 0.obs;
  RxInt selectedCategory = 0.obs;
  RxString taxName = ''.obs;
  RxDouble taxPercent = 0.0.obs;
  final pathImageTab = <int, String>{}.obs;
  final pathImageMenu = <int, String>{}.obs;

  RxBool isDropdownOpened = false.obs;
  RxBool isCheckedRound = false.obs;
  var status = RxStatus.empty().obs;

  Future<void> _fetchAllGroupedTables() async {
    status.value = RxStatus.loading();

    try {
      final result = await _dbHelper.getAllTablesByLocation();

      final grouped = <int, List<TableLiteModel>>{};
      final locationMap = <int, LocationLiteModel>{};

      for (final row in result) {
        final table = TableLiteModel.fromJson(row);
        final location = LocationLiteModel(
          locationID: row['locationID'] as int? ?? 0,
          outletID: row['outletID'] as int? ?? 0,
          locationCode: row['locationCode'] as String? ?? '',
          locationLabel: row['locationLabel'] as String? ?? '',
        );

        locationMap[location.locationID] = location;
        grouped.putIfAbsent(location.locationID, () => []).add(table);
      }

      reserveList.assignAll({
        for (var id in grouped.keys) locationMap[id]!: grouped[id]!,
      });

      status.value = RxStatus.success();
    } catch (e) {
      status.value = RxStatus.error('Fetch error: $e');
    }
  }

  void setSelectedTable({required int tableId, required String trx}) {
    showDialog(
        context: Get.context!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ChangeTableConfirm(tableId: tableId, trx: trx);
        });
  }

  Future<void> changeTable({required int tableId, required String trx}) async {
    try {
      final result =
          await _dbHelper.updateTransactionTable(tableId: tableId, trx: trx);

      if (result > 0) {
        await _fetchAllGroupedTables();

        selectedTable.value = tableId;

        if (onTableChanged != null) {
          onTableChanged!();
        }
      } else {
        debugPrint('No transaction found for the given transaction number.');
      }
    } catch (e) {
      debugPrint('Error updating table: $e');
    }
  }

  Future<void> _getMenu() async {
    final results = await _dbHelper.getMenu();
    print(results);
    menuList.assignAll(results);

    for (var menu in results) {
      _getImageMenuByMenuId(menuId: menu.menuID);
    }
  }

  void _getImageMenuByMenuId({required int menuId}) async {
    if (pathImageMenu.containsKey(menuId)) return;

    String path = '';

    if (Platform.isAndroid) {
      path =
          '/data/user/0/com.squadra.squadra_pos/app_flutter/menu_image_$menuId';
    } else if (Platform.isIOS) {
      final dir = await getApplicationDocumentsDirectory();
      if (dir.path.isNotEmpty) {
        path = '${dir.path}/menu_image_$menuId';
      }
    }

    final file = File(path);
    if (file.existsSync()) {
      pathImageMenu[menuId] = path;
    } else {
      pathImageMenu[menuId] = '';
    }
  }

  Future<void> _getCategory() async {
    final results = await _dbHelper.getCategory();

    categoryList.assignAll(results);

    for (var cat in results) {
      _getImageTabByCategoryId(categoryId: cat.categoryID);
    }
  }

  void _getImageTabByCategoryId({required int categoryId}) async {
    if (pathImageTab.containsKey(categoryId)) return;

    String path = '';

    if (Platform.isAndroid) {
      path =
          '/data/user/0/com.squadra.squadra_pos/app_flutter/category_image_$categoryId';
    } else if (Platform.isIOS) {
      final dir = await getApplicationDocumentsDirectory();
      if (dir.path.isNotEmpty) {
        path = '${dir.path}/category_image_$categoryId';
      }
    }

    final file = File(path);

    if (file.existsSync()) {
      pathImageTab[categoryId] = path;
    } else {
      pathImageTab[categoryId] = '';
    }
  }

  void filterMenuByParam({required String val}) async {
    searchController.text = val;

    await _filterMenu();
  }

  void filterMenuByCategory({required int categoryId}) async {
    selectedCategory.value = categoryId;
    await _filterMenu();
  }

  Future<void> _filterMenu() async {
    final results = await _dbHelper.getMenuFiltered(
      categoryId: selectedCategory.value,
      keyword: searchController.text,
    );
    log("DATA MENU $results");
    menuList.assignAll(results);
  }

  @override
  void onInit() {
    super.onInit();

    _getMenu();
    _getCategory();
    _fetchAllGroupedTables();
  }
}
