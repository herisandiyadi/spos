import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/reserve/c_reserve_offline.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/transaction/c_transaction_offline.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class TabBarReserve extends StatelessWidget {
  TabBarReserve({super.key});

  final _reserveOfflineController = Get.find<ReserveOfflineController>();
  final _transactionOfflineController =
      Get.find<TransactionOfflineController>();

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      controller: _reserveOfflineController.tabBarController,
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
      onTap: null,
      tabs: [
        Obx(() {
          return Tab(
            child: _statusItemTable(
              count: _reserveOfflineController.availableCount.value,
              label: 'Available',
              color: primaryColor,
            ),
          );
        }),
        Obx(() {
          return Tab(
            child: _statusItemTable(
              count: _reserveOfflineController.occupiedCount.value,
              label: 'Occupied',
              color: customOccupied,
            ),
          );
        }),
        Obx(() {
          return Tab(
            child: _statusItemTable(
              count: _transactionOfflineController.totalAll.value,
              label: 'Billed',
              color: customBilled,
            ),
          );
        })
      ],
    );
  }

  Widget _statusItemTable(
      {required int count, required String label, required Color color}) {
    return Container(
      padding: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2, color: customRegularGrey),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            alignment: Alignment.center,
            child: Text(
              count.toString(),
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "UbuntuBold",
              color: customHeadingText,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
