import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/presentation/controllers/c_home.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/request/c_create_customer.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/component_home/component_reserve_list/popup_create_customer.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/component_home/component_reserve_list/tab_bar_reserve.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/component_home/component_transaction_log/tab_bar_table.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/component_home/reserve_list.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/component_home/transaction_log.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _homeController = Get.find<HomeController>();
  final _createCustomerController = Get.find<CreateCustomerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 20),
          child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 15.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Obx(() {
                      if (_homeController.isSelected.value == 0) {
                        return TabBarReserve();
                      } else {
                        return TabBarTable();
                      }
                    }),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.only(right: 15),
                            child: GestureDetector(
                              onTap: () {
                                _createCustomerController.resetCreateCustomer(
                                    type: tad);

                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    // :: For SMenu
                                    // return PopupCreateOrder(
                                    //   tableStatus: true,
                                    //   type: tad,
                                    // );
                                    return PopupCreateCustomer(
                                        id: 0, label: '', type: tad);
                                  },
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                  right: 15,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: customRegularGrey,
                                    width: 2,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: Alignment.center,
                                      child: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'New Order',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "UbuntuBold",
                                        color: customHeadingText,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Colors.grey.shade400,
                                width: 1,
                              ),
                            ),
                            child: TabBar(
                              padding: EdgeInsets.zero,
                              controller: _homeController.tabController,
                              isScrollable: true,
                              splashFactory: NoSplash.splashFactory,
                              tabAlignment: TabAlignment.center,
                              labelColor: Colors.white,
                              labelPadding: EdgeInsets.zero,
                              indicatorColor: Colors.transparent,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicatorPadding: EdgeInsets.zero,
                              indicatorWeight: 0.0,
                              indicator: const BoxDecoration(),
                              unselectedLabelColor: Colors.grey.shade600,
                              dividerColor: Colors.transparent,
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                              onTap: (value) {
                                _homeController.toggleTableView(value);
                              },
                              tabs: [
                                _buildTab(
                                    context: context,
                                    index: 0,
                                    icon: Icons.grid_view),
                                _buildTab(
                                    context: context,
                                    index: 1,
                                    icon: Icons.format_align_justify),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
      body: TabBarView(
        controller: _homeController.tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ReserveList(),
          TransactionLog(),
        ],
      ),
    );
  }

  Widget _buildTab(
      {required BuildContext context,
      required int index,
      required IconData icon}) {
    final size = MediaQuery.of(context).size;

    return Obx(() {
      return Container(
        height: size.height,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: _homeController.isSelected.value == index
              ? primaryColor
              : Colors.transparent,
          borderRadius: BorderRadius.horizontal(
            left: _homeController.isSelected.value == 0
                ? Radius.circular(50)
                : Radius.zero,
            right: _homeController.isSelected.value == 1
                ? Radius.circular(50)
                : Radius.zero,
          ),
        ),
        child: Icon(
          icon,
          color: _homeController.isSelected.value == index
              ? Colors.white
              : Colors.grey.shade600,
        ),
      );
    });
  }
}
