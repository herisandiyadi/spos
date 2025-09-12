import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final RxInt isSelected = 0.obs;

  Future<void> toggleTableView(int index) async {
    isSelected.value = index;
    tabController.index = index;
  }

  Future<void> _checkDatabaseSize() async {
    final databasesPath = await getDatabasesPath();
    final path = '$databasesPath/app_database.db';
    final file = File(path);

    if (await file.exists()) {
      final bytes = await file.length();
      final sizeInKB = bytes / 1024;
      final sizeInMB = sizeInKB / 1024;

      debugPrint('Ukuran database: ${sizeInMB.toStringAsFixed(2)} MB');
    } else {
      debugPrint('Database tidak ditemukan di: $path');
    }
  }

  @override
  void onInit() {
    super.onInit();

    _checkDatabaseSize();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }
}
