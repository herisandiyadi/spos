import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_location/g_location.dart';

class ReserveOfflineController extends GetxController with GetTickerProviderStateMixin {
  final _dbHelper = DatabaseHelper();

  late TabController tabBarController;

  final locationList = <LocationLiteModel>[].obs;

  RxInt isSelected = 0.obs;
  RxInt availableCount = 0.obs;
  RxInt occupiedCount = 0.obs;

  var status = RxStatus.empty().obs;

  Future<void> initLocationAndTables() async {
    status.value = RxStatus.loading();

    try {
      final result = await _dbHelper.getLocation();
      final parsed = result.map((e) => LocationLiteModel.fromJson(e)).toList();

      locationList.assignAll(parsed);
      
      await countTables(parsedLocation: parsed);

      status.value = RxStatus.success();
    } catch (e) {
      status.value = RxStatus.error('$e');
    }
  }

  Future<void> countTables({required List<LocationLiteModel> parsedLocation}) async {
    final result = await _dbHelper.countTable(parsedLocation);

    int totalAvailable = 0;
    int totalOccupied = 0;

    for (final row in result) {
      totalAvailable += row['availableCount'] as int? ?? 0;
      totalOccupied += row['occupiedCount'] as int? ?? 0;
    }

    availableCount.value = totalAvailable;
    occupiedCount.value = totalOccupied;
  }

  void toggleReserveView(value) {
    isSelected.value = value;
  }

  @override
  void onInit() {
    super.onInit();

    initLocationAndTables();

    tabBarController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabBarController.dispose();
    
    super.dispose();
  }
}