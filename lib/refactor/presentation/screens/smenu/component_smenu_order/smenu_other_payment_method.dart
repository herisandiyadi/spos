import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_check_out.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class SMOtherPaymentMethod extends StatelessWidget {
  SMOtherPaymentMethod({super.key});

  final transactionCheckOutSMController = Get.find<TransactionCheckOutSMController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Others",
                  style: TextStyle(
                    fontWeight: FontWeight.w700
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.close),
                ),
              ],
            ),
          ),
          Divider(
            height: 0.0,
            thickness: 0.5,
          ),
        ],
      ),
      content: SizedBox(
        height: 600.r,
        width: 400.r,
        child: Obx(() {
          final data = transactionCheckOutSMController.paymentMethod;
          // final method = transactionCheckOutSMController.isPaymentMethodId.value;

          if (data.isEmpty) {
            return Center(child: Text("No payment methods available"));
          }

          return ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              vertical: 16,
            ),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return index != 3 ? Padding(
                padding: EdgeInsets.only(
                  bottom: 5.0,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    transactionCheckOutSMController.nominalController.clear();
                    transactionCheckOutSMController.isPaymentMethodId.value = data[index].paymentMethodID;
                    transactionCheckOutSMController.isPaymentMethodName.value = data[index].paymentMethodName;

                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(
                        width: 2,
                        color: transactionCheckOutSMController.isPaymentMethodId.value == data[index].paymentMethodID ? primaryColor : customRegularGrey,
                      ),
                    ),
                    backgroundColor: transactionCheckOutSMController.isPaymentMethodId.value == data[index].paymentMethodID ? primaryColor : Colors.white,
                  ),
                  child: Text(data[index].paymentMethodName,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontFamily: 'UbuntuBold',
                      color: transactionCheckOutSMController.isPaymentMethodId.value == data[index].paymentMethodID ? Colors.white : customBodyText,
                    ),
                  ),
                ),
              ) : const SizedBox.shrink();
            },
          );
        })
      ),
    );
  }
}