import 'package:d_chart/single_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:squadra_pos/database/database_helper.dart';
// import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction/g_transaction.dart';
import 'package:squadra_pos/refactor/data/models/transaction_report/m_transaction_report.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';

class ProductSoldCard extends StatelessWidget {
  ProductSoldCard(
      {super.key,
      required this.product,
      required this.grandTotalFinal,
      required this.roundingTotal,
      required this.discountTotal,
      required this.grand_total_taxT,
      required this.onPrintSummary,
      required this.qtyOpen,
      required this.qtyDataSend});

  final List<Product> product;
  final int grandTotalFinal;
  final int roundingTotal;
  final int discountTotal;
  final int grand_total_taxT;
  final int qtyOpen;
  final int qtyDataSend;
  final VoidCallback onPrintSummary;
  final Map<int, bool> animated = {};
  // final dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    print(qtyOpen);
    print(qtyDataSend);
    final headingColor = customHeadingText;
    final bodyTextColor = customBodyText;

    return Expanded(
      child: Container(
        padding: EdgeInsets.all(30.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(headingColor, context),
            SizedBox(height: 2.h),
            Text(
              "Showing most sold product",
              style: TextStyle(
                fontSize: 9.sp,
                fontFamily: "UbuntuBold",
                color: bodyTextColor,
              ),
            ),
            SizedBox(height: 20.h),
            _buildProductList(headingColor),
            SizedBox(height: 20.h),
            Text(
              "Showing most sold add-on",
              style: TextStyle(
                fontSize: 9.sp,
                fontFamily: "UbuntuBold",
                color: bodyTextColor,
              ),
            ),
            SizedBox(height: 20.h),
            _buildAddOnList(headingColor),
            SizedBox(height: 20.h),
            _buildSummaryRows(headingColor),
          ],
        ),
      ),
    );
  }

  void _showConfirmDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Unable Print Summary'),
          content: Text('There are still open orders or unsynced transaction'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text('Dismiss'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHeader(Color headingColor, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Product Sold",
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: "UbuntuBold",
            color: headingColor,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: customBlue2,
            minimumSize: const Size(80, 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: qtyOpen > 0 || qtyDataSend > 0
              ? () {
                  print('dajal ${qtyOpen}');
                  _showConfirmDialog(context);
                }
              : onPrintSummary,
          child: Text(
            'Print Summary',
            style: TextStyle(
              fontSize: 11,
              fontFamily: "UbuntuBold",
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductList(Color headingColor) {
    final main = product
        .where((item) => item.typeProduct?.toLowerCase() == 'main')
        .toList();
    final maxQty = main
        .map((e) => int.tryParse(e.totalQty.toString()) ?? 0)
        .fold(0, (a, b) => a > b ? a : b);
    final List<double> percentages = main.map((e) {
      final qty = int.tryParse(e.totalQty.toString()) ?? 0;
      return maxQty > 0 ? (qty / maxQty) * 100.0 : 0.0;
    }).toList();

    return SizedBox(
      height: 300.r,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: main.length,
        itemBuilder: (context, index) {
          final items = main[index];
          final percentage = percentages[index];

          return Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${items.totalQty} x ${items.menuName}',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: "UbuntuBold",
                        color: headingColor,
                      ),
                    ),
                    Text(
                      numberFormat(
                          "IDR", int.tryParse(items.totalPrice ?? '0') ?? 0),
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: "NanumGothic",
                        color: headingColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 17.h,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(
                      begin: animated[index] == true ? percentage : 0,
                      end: percentage,
                    ),
                    duration: const Duration(milliseconds: 800),
                    onEnd: () => animated[index] = true,
                    builder: (context, animatedValue, child) {
                      return DChartSingleBar(
                        max: 100,
                        value: animatedValue,
                        radius: BorderRadius.circular(50),
                        foregroundColor: primaryColor,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildAddOnList(Color headingColor) {
    final addOn = product
        .where((item) => item.typeProduct?.toLowerCase() == 'add on')
        .toList();
    final maxQty = addOn
        .map((e) => int.tryParse(e.totalQty.toString()) ?? 0)
        .fold(0, (a, b) => a > b ? a : b);
    final List<double> percentages = addOn.map((e) {
      final qty = int.tryParse(e.totalQty.toString()) ?? 0;
      return maxQty > 0 ? (qty / maxQty) * 100.0 : 0.0;
    }).toList();

    return SizedBox(
      height: 300.r,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: addOn.length,
        itemBuilder: (context, index) {
          final items = addOn[index];
          final percentage = percentages[index];

          return Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${items.totalQty} x ${items.menuName}',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: "UbuntuBold",
                        color: headingColor,
                      ),
                    ),
                    Text(
                      numberFormat(
                          "IDR", int.tryParse(items.totalPrice ?? '0') ?? 0),
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: "NanumGothic",
                        color: headingColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 17.h,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(
                      begin: animated[index] == true ? percentage : 0,
                      end: percentage,
                    ),
                    duration: const Duration(milliseconds: 800),
                    onEnd: () => animated[index] = true,
                    builder: (context, animatedValue, child) {
                      return DChartSingleBar(
                        max: 100,
                        value: animatedValue,
                        radius: BorderRadius.circular(50),
                        foregroundColor: primaryColor,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSummaryRows(Color headingColor) {
    return Column(
      children: [
        _buildRow('Total', grandTotalFinal - roundingTotal + discountTotal,
            headingColor),
        SizedBox(height: 10.h),
        _buildRow('Total Discount', discountTotal, headingColor),
        SizedBox(height: 10.h),
        _buildRow('Total Tax', grand_total_taxT, headingColor),
        SizedBox(height: 10.h),
        _buildRow('Total Rounding', roundingTotal, headingColor),
        SizedBox(height: 10.h),
        _buildRow('Grand Total', grandTotalFinal, headingColor),
      ],
    );
  }

  Widget _buildRow(String label, int value, Color headingColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10.sp,
            fontFamily: "UbuntuBold",
            color: headingColor,
          ),
        ),
        Text(
          numberFormat("IDR", value),
          style: TextStyle(
            fontSize: 10.sp,
            fontFamily: "NanumGothic",
            color: headingColor,
          ),
        ),
      ],
    );
  }
}
