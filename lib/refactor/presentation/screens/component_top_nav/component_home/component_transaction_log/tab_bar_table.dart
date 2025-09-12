import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/transaction/c_transaction_offline.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_header.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/component_home/component_transaction_log/filter_button.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class TabBarTable extends StatelessWidget {
  TabBarTable({super.key});

  final _transactionHeaderSMController =
      Get.find<TransactionHeaderSMController>();
  final _transactionOfflineController =
      Get.find<TransactionOfflineController>();

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      controller: _transactionOfflineController.tabController,
      splashFactory: NoSplash.splashFactory,
      tabAlignment: TabAlignment.start,
      labelColor: Colors.black,
      labelPadding: EdgeInsets.only(
        right: 10.0,
        left: 10.0,
      ),
      indicatorColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: EdgeInsets.only(
        bottom: 7.0,
      ),
      unselectedLabelColor: Colors.grey.shade600,
      dividerColor: Colors.transparent,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w500,
      ),
      onTap: (value) {
        _transactionOfflineController.selectTab(index: value);
      },
      tabs: [
        Tab(
          child: Obx(() {
            return TransactionFilterButton(
              label: 'All',
              circleColor: customRed2,
              count: _transactionOfflineController.totalAll.value,
              isSelected:
                  _transactionOfflineController.currentTabIndex.value == 0,
            );
          }),
        ),
        Tab(
          child: Obx(() {
            return TransactionFilterButton(
              label: 'Open',
              circleColor: primaryColor,
              count: _transactionOfflineController.totalOpen.value,
              isSelected:
                  _transactionOfflineController.currentTabIndex.value == 1,
            );
          }),
        ),
        Tab(
          child: Obx(() {
            return TransactionFilterButton(
              label: 'Billed',
              circleColor: customGreen,
              count: _transactionOfflineController.totalClose.value,
              isSelected:
                  _transactionOfflineController.currentTabIndex.value == 2,
            );
          }),
        ),
        Tab(
          child: Obx(() {
            return TransactionFilterButton(
              label: 'SMenu',
              circleColor: Colors.black,
              count: _transactionHeaderSMController.transactionSMList.length,
              isSelected:
                  _transactionOfflineController.currentTabIndex.value == 3,
            );
          }),
        ),
      ],
    );
  }
}
