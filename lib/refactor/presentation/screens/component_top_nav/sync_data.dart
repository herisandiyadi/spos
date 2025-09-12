import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_sync_data.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_top_navigation.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/component_sync_data/row_content.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class SyncData extends StatelessWidget {
  SyncData({super.key, required this.firstSync});

  final bool firstSync;
  final syncDataController = Get.find<SyncDataController>();
  final topNavigationController = Get.find<TopNavigationController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
          color: customBlue1,
        ),
      ),
      backgroundColor: Colors.white,
      titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      insetPadding: const EdgeInsets.all(15),
      contentPadding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
      actionsPadding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
      title: Text(
        "Sync Data From Server",
        style: TextStyle(
          fontSize: 14.sp,
          fontFamily: "UbuntuBold",
          color: customHeadingText,
        ),
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 500.r,
          child: Column(
            children: [
              SyncRowItem(
                title: "Location",
                syncKey: SyncStatus.location,
                syncType: getLocation,
                syncState: syncDataController.syncState,
                onRefresh: syncDataController.initializeData,
              ),
              SyncRowItem(
                title: "Station",
                syncKey: SyncStatus.station,
                syncType: getStation,
                syncState: syncDataController.syncState,
                onRefresh: syncDataController.initializeData,
              ),
              SyncRowItem(
                title: "Table",
                syncKey: SyncStatus.table,
                syncType: getTable,
                syncState: syncDataController.syncState,
                onRefresh: syncDataController.initializeData,
              ),
              SyncRowItem(
                title: "Category",
                syncKey: SyncStatus.category,
                syncType: getCategory,
                syncState: syncDataController.syncState,
                onRefresh: syncDataController.initializeData,
              ),
              SyncRowItem(
                title: "Menu",
                syncKey: SyncStatus.menu,
                syncType: getMenu,
                syncState: syncDataController.syncState,
                onRefresh: syncDataController.initializeData,
              ),
              SyncRowItem(
                title: "Discount",
                syncKey: SyncStatus.discount,
                syncType: getDiscount,
                syncState: syncDataController.syncState,
                onRefresh: syncDataController.initializeData,
              ),
              SyncRowItem(
                title: "Payment Method",
                syncKey: SyncStatus.paymentMethod,
                syncType: getPaymentMethod,
                syncState: syncDataController.syncState,
                onRefresh: syncDataController.initializeData,
              ),
              SyncRowItem(
                title: "Province",
                syncKey: SyncStatus.province,
                syncType: getProvince,
                syncState: syncDataController.syncState,
                onRefresh: syncDataController.initializeData,
              ),
              SyncRowItem(
                title: "City",
                syncKey: SyncStatus.city,
                syncType: getCity,
                syncState: syncDataController.syncState,
                onRefresh: syncDataController.initializeData,
              ),
              SyncRowItem(
                title: "Customer",
                syncKey: SyncStatus.customer,
                syncType: getCustomer,
                syncState: syncDataController.syncState,
                onRefresh: syncDataController.initializeData,
              ),
              SyncRowItem(
                title: "Order Type",
                syncKey: SyncStatus.transactionTypeJuncLite,
                syncType: getTransactionType,
                syncState: syncDataController.syncState,
                onRefresh: syncDataController.initializeData,
              ),
              SyncRowItem(
                title: "Tax",
                syncKey: SyncStatus.tax,
                syncType: getTax,
                syncState: syncDataController.syncState,
                onRefresh: syncDataController.initializeData,
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  fixedSize: const Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  syncDataController.initializeData(data: 1, type: allData);
                },
                child: Text(
                  "Sync All",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "UbuntuBold",
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  fixedSize: const Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () => Get.back(),
                child: Text(
                  "Close",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "UbuntuBold",
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
