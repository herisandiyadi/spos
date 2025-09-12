import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recase/recase.dart';
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction/g_transaction.dart';
import 'package:squadra_pos/refactor/presentation/controllers/c_summary_report.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_send_data.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/component_report/payment_method_card.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/component_report/product_sold_card.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/component_report/shimmer/load_transaction_report.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/component_report/summary_card.dart';
import 'package:squadra_pos/refactor/utils/config_calendar.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';
import 'package:squadra_pos/refactor/utils/exception/network.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({super.key});

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  final summaryReportController = Get.find<SummaryReportController>();
  final sendDataController = Get.find<SendDataController>();
  @override
  void initState() {
    super.initState();

    String dateParse = dateDefault(DateTime.now().toString());

    summaryReportController.active.value = 1;
    summaryReportController.summaryReportCall(filter: today, date: dateParse);
    // int qtyOpen = _getTransactionOpen();
    _loadCountOnly();
  }

  final dbHelper = DatabaseHelper();
  var transactionOpen = <TransactionLiteModel>[];
  final List<Map<String, String>> items = [];
  int transactionCount = 0;

  void _loadCountOnly() async {
    int count = await _getTransactionOpen();
    setState(() {
      transactionCount = count;
    });
  }

  Future<int> _getTransactionOpen() async {
    items.clear();

    final response = await dbHelper.getTransaction();

    if (!mounted) return 0;
    setState(() {
      transactionOpen = response
          .map((model) => TransactionLiteModel.fromJson(model))
          .where((item) =>
              item.statusTransaction == TransactionFilter.open.name.titleCase)
          .toList();
    });
    return transactionOpen.length;
  }

  @override
  Widget build(BuildContext context) {
    final configCalendar = ConfigCalendarAttendance.defaultConfig(context);

    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          titleSpacing: 0.0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    await showCalendarDatePicker2Dialog(
                      context: context,
                      config: configCalendar.config,
                      dialogSize: const Size(325, 400),
                      borderRadius: BorderRadius.circular(16),
                      barrierDismissible: true,
                      value: summaryReportController.currentDate,
                      dialogBackgroundColor: Colors.white,
                    ).then((values) {
                      if (values != null) {
                        summaryReportController.selectDate(
                            summaryReportController.getValueText(
                                configCalendar.config.calendarType, values),
                            values[0] ?? DateTime.now());
                      }
                    });
                  },
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 2,
                        color: customRegularGrey,
                      ),
                    ),
                    child: Obx(() {
                      return Text(
                        summaryReportController.filterDate.value,
                        style: TextStyle(
                          fontSize: 8.sp,
                          color: customHeadingText,
                          fontFamily: "NanumGothic",
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(width: 5.w),
                buildFilterButton(
                  index: 1,
                  label: "1 Day",
                  filter: today,
                ),
                SizedBox(width: 5.w),
                buildFilterButton(
                  index: 2,
                  label: "1 Week",
                  filter: oneWeek,
                ),
                SizedBox(width: 5.w),
                buildFilterButton(
                  index: 3,
                  label: "1 Month",
                  filter: oneMonth,
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: summaryReportController.isBorder.value
                ? Container(
                    color: Colors.grey.shade300,
                    height: 0.5,
                  )
                : const SizedBox.shrink(),
          ),
        ),
        body: Obx(() {
          final state = summaryReportController.status.value;
          final active = summaryReportController.active.value;

          if (state.isLoading) return const LoadTransactionReport();
          if (state.isError) {
            return NetworkExceptionHandling(
              exception: state.errorMessage ?? '',
              refresh: () {
                summaryReportController.rebuild(
                    value: active == 1
                        ? today
                        : active == 2
                            ? oneWeek
                            : oneMonth);
              },
            );
          }

          final data = summaryReportController.reportList;
          final dataSend = sendDataController.transactionCloseList;

          return SingleChildScrollView(
            controller: summaryReportController.scrollController,
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      DashboardCard(
                        title: "Total Sales",
                        value: numberFormat(
                            "IDR", data.value.grandTotalFinal ?? 0),
                        percentage: data.value.percentageGrandTotalFinal ?? 0.0,
                      ),
                      SizedBox(width: 15.w),
                      DashboardCard(
                        title: "Average Spent Per Transaction",
                        value: numberFormat(
                            "IDR", data.value.averageSpentTransaction ?? 0),
                        percentage: data.value.percentageAVG ?? 0.0,
                      ),
                      SizedBox(width: 15.w),
                      DashboardCard(
                        title: "Number Of Transaction",
                        value: '${data.value.totalTransactionClose ?? 0}',
                        percentage:
                            data.value.percentageTotalTransaction ?? 0.0,
                      ),
                      SizedBox(width: 15.w),
                      DashboardCard(
                        title: "Total Discount",
                        value:
                            numberFormat("IDR", data.value.discountTotal ?? 0),
                        percentage: data.value.percentageTotalDiscount ?? 0.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PaymentMethodCard(
                          payment: data.value.paymentMethod,
                          grandTotalFinal: data.value.grandTotalFinal ?? 0,
                          grand_total_tax: data.value.grand_total_tax ?? 0,
                          onPrintSummary: () =>
                              summaryReportController.handlePrintSummary(
                                type: payments,
                                payment: data.value.paymentMethod,
                                tax: data.value.grand_total_tax ?? 0,
                                total: data.value.grandTotalFinal ?? 0,
                              ),
                          qtyOpen: transactionCount ?? 0,
                          qtyDataSend: dataSend.length ?? 0),
                      SizedBox(width: 15.w),
                      ProductSoldCard(
                          product: data.value.detatilTrans,
                          grandTotalFinal: data.value.grandTotalFinal ?? 0,
                          roundingTotal: data.value.totalRounding ?? 0,
                          discountTotal: data.value.discountTotal ?? 0,
                          grand_total_taxT: data.value.grand_total_tax1 ?? 0,
                          onPrintSummary: () =>
                              (summaryReportController.handlePrintSummary(
                                type: products,
                                product: data.value.detatilTrans,
                                tax: data.value.grand_total_tax ?? 0,
                                total: data.value.grandTotalFinal ?? 0,
                                rounding: data.value.totalRounding ?? 0,
                                discount: data.value.discountTotal ?? 0,
                              )),
                          qtyOpen: transactionCount ?? 0,
                          qtyDataSend: dataSend.length ?? 0),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
              ],
            ),
          );
        }),
      );
    });
  }

  Widget buildFilterButton(
      {required String label, required int index, required String filter}) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () => summaryReportController.handleFilterTap(
            value: filter, tabIndex: index),
        child: Obx(() {
          bool status = summaryReportController.active.value == index;

          return Container(
            alignment: Alignment.center,
            height: 40,
            width: 50.w,
            decoration: BoxDecoration(
              color: status ? primaryColor : Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                width: 2,
                color: customRegularGrey,
              ),
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 8.sp,
                fontFamily: "UbuntuBold",
                color: status ? Colors.white : customHeadingText,
              ),
            ),
          );
        }),
      ),
    );
  }
}
