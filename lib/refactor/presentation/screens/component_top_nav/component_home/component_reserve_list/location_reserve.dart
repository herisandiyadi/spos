import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recase/recase.dart';
import 'package:shimmer/shimmer.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_table/g_table.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/request/c_create_customer.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/reserve/c_reserve_list.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/reserve/c_reserve_offline.dart';
import 'package:squadra_pos/refactor/presentation/routes/app_routes.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/component_home/component_reserve_list/popup_create_order.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';
import 'package:squadra_pos/refactor/utils/custom_refresh.dart';

class LocationReserve extends StatefulWidget {
  const LocationReserve({super.key, required this.locationId});

  final int locationId;

  @override
  State<LocationReserve> createState() => _LocationReserveState();
}

class _LocationReserveState extends State<LocationReserve>
    with AutomaticKeepAliveClientMixin {
  final _reserveListController = Get.find<ReserveListController>();
  final _reserveOfflineController = Get.find<ReserveOfflineController>();
  final _createCustomerController = Get.find<CreateCustomerController>();

  @override
  void initState() {
    super.initState();
    debugPrint(
        "presentation>screens>component_top>componenr_home>component_reserve_list page");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _reserveListController.getTransactionLogSMCall(
          locationId: widget.locationId);
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Obx(() {
      final state = _reserveListController.status.value;
      // _reserveOfflineController.initLocationAndTables();

      return Stack(
        children: [
          Platform.isIOS
              ? PlatformAwareRefreshControl(
                  listViewContent: Column(
                    children: [
                      Expanded(
                        child: CustomScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          slivers: [
                            CupertinoSliverRefreshControl(
                              onRefresh: () async {
                                await _reserveOfflineController
                                    .initLocationAndTables();
                                await _reserveListController
                                    .getTransactionLogSMCall(
                                        locationId: widget.locationId);
                              },
                              builder: (BuildContext context,
                                  RefreshIndicatorMode refreshState,
                                  double pulledExtent,
                                  double refreshTriggerPullDistance,
                                  double refreshIndicatorExtent) {
                                final showSpinner = refreshState ==
                                        RefreshIndicatorMode.refresh ||
                                    refreshState == RefreshIndicatorMode.armed;

                                return Center(
                                  child: showSpinner
                                      ? SizedBox(
                                          width: 20.0,
                                          height: 20.0,
                                          child:
                                              const CupertinoActivityIndicator(
                                            color: Colors.black,
                                            radius: 12.0,
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                );
                              },
                            ),
                            SliverPadding(
                              padding:
                                  const EdgeInsets.fromLTRB(150, 0, 150, 0),
                              sliver: _buildGridReserve(state),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : PlatformAwareRefreshControl(
                  onRefresh: () async {
                    await _reserveOfflineController.initLocationAndTables();
                    await _reserveListController.getTransactionLogSMCall(
                        locationId: widget.locationId);
                  },
                  listViewContent: Column(
                    children: [
                      Expanded(
                        child: CustomScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          slivers: [
                            SliverPadding(
                              padding:
                                  const EdgeInsets.fromLTRB(150, 0, 150, 0),
                              sliver: _buildGridReserve(state),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      );
    });
  }

  Widget _buildGridReserve(RxStatus state) {
    if (state.isLoading) return _buildShimmerGrid();
    if (state.isError) return SliverToBoxAdapter(child: SizedBox.shrink());

    final data = _reserveListController.reserveListMap[widget.locationId] ?? [];

    if (data.isEmpty) return SliverToBoxAdapter(child: SizedBox.shrink());

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 100,
        mainAxisSpacing: 30,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final table = data[index];
          return _buildItemReserve(context, table);
        },
        childCount: data.length,
      ),
    );
  }

  Widget _buildItemReserve(BuildContext context, TableLiteModel table) {
    final isAvailable =
        table.statusTransaction != TransactionFilter.open.name.titleCase &&
            table.uniqueNumberSM == 0;
    final statusLabel = isAvailable
        ? 'Available'
        : (table.uniqueNumberSM ?? 0) > 0
            ? _formatTime(table.dateTimeSM)
            : _formatTime(table.dateTime);

    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          if (isAvailable) {
            _createCustomerController.resetCreateCustomer(type: all);

            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                // :: SMenu
                return PopupCreateOrder(
                  tableId: table.tableID,
                  tableLabel: table.tableLabel,
                  tableNumber: table.tableNumber,
                  tableStatus: isAvailable,
                  type: all,
                  transactionNumber: table.transactionNumber,
                );
                // :: SPOS
                // return PopupCreateCustomer(id: table.tableID, label: table.tableLabel, type: all);
              },
            );
          } else {
            if ((table.uniqueNumberSM ?? 0) > 0 &&
                table.statusTransaction !=
                    TransactionFilter.open.name.titleCase) {
              Get.toNamed(RouteName.orderSM,
                  arguments: {"unique_number": table.uniqueNumberSM});
            } else {
              Get.toNamed(
                RouteName.orderOffline,
                arguments: {
                  "order_type": offline,
                  "table_id": table.tableID,
                  "transaction_number": table.transactionNumber ?? '',
                },
              );
            }
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1,
              color: customDarkGrey,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40.r,
                backgroundColor: isAvailable ? primaryColor : customOccupied,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    table.tableLabel,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 9.sp,
                      fontFamily: "UbuntuBold",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                statusLabel,
                style: TextStyle(
                  fontSize: 9.sp,
                  color: primaryColor,
                  fontFamily: "NanumGothic",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(String? dateTime) {
    if (dateTime == null || dateTime.isEmpty) return "-";

    final dt = DateTime.parse(dateTime);

    return "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}:${dt.second.toString().padLeft(2, '0')}";
  }

  Widget _buildShimmerGrid() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 100,
        mainAxisSpacing: 30,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1, color: Colors.grey.shade300),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(radius: 40, backgroundColor: Colors.grey),
                  const SizedBox(height: 10),
                  Container(height: 12, width: 60, color: Colors.grey),
                ],
              ),
            ),
          ),
        );
      }, childCount: 8),
    );
  }
}
