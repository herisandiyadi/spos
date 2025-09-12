import 'package:d_chart/single_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squadra_pos/refactor/data/models/transaction_report/m_transaction_report.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';

class PaymentMethodCard extends StatelessWidget {
  PaymentMethodCard(
      {super.key,
      required this.payment,
      required this.grandTotalFinal,
      required this.grand_total_tax,
      required this.onPrintSummary,
      required this.qtyOpen,
      required this.qtyDataSend});

  final List<PaymentMethod> payment;
  final int grandTotalFinal;
  final int grand_total_tax;
  final int qtyOpen;
  final int qtyDataSend;
  final VoidCallback onPrintSummary;
  final Map<int, bool> animated = {};

  @override
  Widget build(BuildContext context) {
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
            _buildHeader(context),
            SizedBox(height: 2.h),
            Text(
              "Showing most popular payment method",
              style: TextStyle(
                fontSize: 9.sp,
                fontFamily: "UbuntuBold",
                color: customBodyText,
              ),
            ),
            SizedBox(height: 20.h),
            _buildPaymentList(),
            SizedBox(height: 20.h),
            _buildGrandTotalRow(),
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

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Payment Methods",
          style: TextStyle(
            fontSize: 12.sp,
            color: customHeadingText,
            fontFamily: "UbuntuBold",
          ),
        ),
        ElevatedButton(
          onPressed: qtyOpen > 0 || qtyDataSend > 0
              ? () {
                  _showConfirmDialog(context);
                }
              : onPrintSummary,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: customBlue2,
            minimumSize: const Size(80, 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
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

  Widget _buildPaymentList() {
    final maxTotal = payment
        .map((p) => p.totalAmount ?? 0)
        .fold<int>(0, (a, b) => a > b ? a : b);
    final List<double> percentages = payment.map((p) {
      final total = payment
          .where((e) => e.method == p.method)
          .fold<int>(0, (sum, e) => sum + (e.totalAmount ?? 0));
      return maxTotal > 0 ? (total / maxTotal) * 100.0 : 0.0;
    }).toList();

    return SizedBox(
      height: 300.r,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: payment.length,
        itemBuilder: (context, index) {
          final items = payment[index];
          final percentage = percentages[index];

          return Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${items.total} x ${items.method}',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: "UbuntuBold",
                        color: customHeadingText,
                      ),
                    ),
                    Text(
                      numberFormat("IDR", items.totalAmount),
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: "NanumGothic",
                        color: customHeadingText,
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

  Widget _buildGrandTotalRow() {
    return Column(
      children: [
        _buildRow('Total Tax', grand_total_tax, customHeadingText),
        SizedBox(height: 10.h),
        _buildRow('Grand Total', grandTotalFinal, customHeadingText),
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
