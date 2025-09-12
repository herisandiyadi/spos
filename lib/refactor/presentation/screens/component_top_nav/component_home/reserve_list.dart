import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/reserve/c_reserve_list.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/reserve/c_reserve_offline.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/component_home/component_reserve_list/location_reserve.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class ReserveList extends StatelessWidget {
  ReserveList({super.key});

  final _reserveListController = Get.find<ReserveListController>();
  final _reserveOfflineController = Get.find<ReserveOfflineController>();
  
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final state = _reserveOfflineController.status.value;

      if (state.isLoading) return const SizedBox.shrink();
      if (state.isError) return const SizedBox.shrink();

      final data = _reserveOfflineController.locationList;

      if (data.isEmpty) {
        return const SizedBox.shrink();
      }

      return DefaultTabController(
        length: data.length, 
        child: Scaffold(
          backgroundColor: customBackground,
          appBar: AppBar(
            toolbarHeight: 0.0,
            automaticallyImplyLeading: false,
            backgroundColor: customBackground,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight + 35),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 50,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: 1,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: IgnorePointer(
                          ignoring: _reserveListController.status.value.isLoading,
                          child: TabBar(
                            padding: EdgeInsets.zero,
                            isScrollable: false,
                            splashFactory: NoSplash.splashFactory,
                            tabAlignment: TabAlignment.center,
                            labelColor: Colors.white,
                            labelPadding: EdgeInsets.zero,
                            indicatorColor: Colors.transparent,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorPadding: EdgeInsets.zero,
                            indicatorWeight: 0.0,
                            indicator: BoxDecoration(
                              color: primaryColor,
                            ),
                            unselectedLabelColor: Colors.grey.shade600,
                            dividerColor: Colors.transparent,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                            onTap: (value) {
                              _reserveOfflineController.toggleReserveView(value);
                            },
                            tabs: List.generate(_reserveOfflineController.locationList.length, (index) {
                              final loc = _reserveOfflineController.locationList[index];

                              return _buildTab(context: context, index: index, label: loc.locationLabel);
                            }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: _tabBarView(context),
        ),
      );
    });
  }

  Widget _tabBarView(BuildContext context) {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(_reserveOfflineController.locationList.length, (index) {
        final loc = _reserveOfflineController.locationList[index];
        
        return LocationReserve(locationId: loc.locationID);
      }),
    );
  }

  Widget _buildTab({required BuildContext context, required int index, required String label}) {
    return Obx(() {
      final isLast = index == _reserveOfflineController.locationList.length - 1;

      return Stack(
        children: [
          Container(
            width: 120,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(label,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: "UbuntuBold",
                ),
              ),
            ),
          ),

          !isLast ? Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 1,
              color: Colors.grey.shade300,
            ),
          ) : const SizedBox.shrink(),
        ],
      );
    });
  }
}