import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squadra_pos/refactor/data/models/discount/discount_model.dart';
import 'package:squadra_pos/refactor/presentation/controllers/discount/discount_controller.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';

Future<void> showDiscountDialog(
  BuildContext context,
  DiscountController discountController,
  int discountType, {
  List<dynamic>? transDetail,
  num? subTotal,
  Function(DiscountModel? data)? onSelect,
  List<int>? selectedDiscountIds,
}) async {
  await discountController.getDiscountByTypeAndDay(discountType);

  // Inisialisasi selected discount jika ada
  if (selectedDiscountIds != null && selectedDiscountIds.isNotEmpty) {
    discountController.selectDiscount(selectedDiscountIds.first,
        subtotal: subTotal!.toDouble());
  }

  // Listen perubahan discountController, reset selected jika onDelete
  ever(discountController.discountList,
      (_) => discountController.resetSelectedDiscountOnDelete());

  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Obx(() {
          if (discountController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          final discountList = discountController.discountList;
          return AlertDialog(
            title: const Text("Discount List"),
            content: discountList.isEmpty
                ? const Text("No Discount Listed")
                : SizedBox(
                    width: 1000,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        for (var data in discountList)
                          Container(
                            margin: data == discountList.last
                                ? EdgeInsets.only(bottom: 0.h)
                                : EdgeInsets.only(bottom: 20.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "(${data.masterDiscountName} - ${data.qtyDiscount})",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily: "UbuntuBold",
                                                color: primaryColor,
                                              ),
                                            ),
                                            SizedBox(height: 5.h),
                                            Text(
                                              "${numberFormat('IDR', data.minTransDiscount).toString()} Minimum Transaction\n${numberFormat('IDR', data.maxDiscount).toString()} Maximum Discount",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontSize: 8.sp,
                                                fontFamily: "NanumGothic",
                                                color: customHeadingText,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Includes",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontSize: 8.sp,
                                                fontFamily: "NanumGothic",
                                                color: primaryColor,
                                              ),
                                            ),
                                            (data.spesificMenuID == null ||
                                                    (data.spesificMenuID
                                                            is String
                                                        ? (data.spesificMenuID
                                                                ?.isEmpty ??
                                                            true)
                                                        : (data.spesificMenuID
                                                                ?.isEmpty ??
                                                            true)))
                                                ? Text(
                                                    "Discount Transaction",
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      fontSize: 8.sp,
                                                      fontFamily: "NanumGothic",
                                                      color: customHeadingText,
                                                    ),
                                                  )
                                                : const SizedBox.shrink(),
                                            for (var resMenuDis in data
                                                    .spesificMenuID is String
                                                ? (data.spesificMenuID !=
                                                            null &&
                                                        (data.spesificMenuID
                                                                as String)
                                                            .isNotEmpty
                                                    ? jsonDecode(
                                                        data.spesificMenuID!)
                                                    : [])
                                                : (data.spesificMenuID ?? []))
                                              Text(
                                                "• ${resMenuDis['MenuName']}",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 8.sp,
                                                  fontFamily: "NanumGothic",
                                                  color: customHeadingText,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: data.valueType == 'Nominal'
                                            ? Text(
                                                numberFormat('IDR',
                                                        data.discountValue)
                                                    .toString(),
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontFamily: "NanumGothic",
                                                  color: customHeadingText,
                                                ),
                                              )
                                            : Text(
                                                "${data.discountValue.toString()} %",
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontFamily: "NanumGothic",
                                                  color: customHeadingText,
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20.sp),
                                Expanded(
                                  flex: 1,
                                  child: Obx(() {
                                    final isSelected = discountController
                                            .selectedDiscountId.value ==
                                        data.masterDiscountID;
                                    final isAnySelected = discountController
                                            .selectedDiscountId.value !=
                                        0;
                                    final isType1 = discountType == 1;
                                    return Column(
                                      children: [
                                        ElevatedButton(
                                          onPressed: isType1
                                              ? (isSelected
                                                  ? () {
                                                      // Remove Discount
                                                      discountController
                                                          .removeSelectedDiscount();
                                                      if (onSelect != null) {
                                                        onSelect(null);
                                                      }
                                                    }
                                                  : (isAnySelected
                                                      ? null
                                                      : () {
                                                          // Pilih Discount
                                                          // discountController
                                                          //     .selectDiscount(
                                                          //         data
                                                          //             .masterDiscountID,
                                                          //         subtotal:
                                                          //             subTotal);
                                                          if (onSelect != null)
                                                            onSelect(data);
                                                        }))
                                              : () {
                                                  if (onSelect != null)
                                                    onSelect(data);
                                                  Navigator.of(context).pop();
                                                },
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: Size(10, 28.sp),
                                            backgroundColor: isSelected
                                                ? customRed1
                                                : primaryColor,
                                            foregroundColor: Colors.white,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                          ),
                                          child: Text(
                                            isType1
                                                ? (isSelected
                                                    ? "Remove Discount"
                                                    : "Add Discount")
                                                : "Add Discount",
                                            style: TextStyle(
                                              fontSize: 8.sp,
                                              fontFamily: 'UbuntuBold',
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                      ]),
                    ),
                  ),
          );
        });
      });
}
