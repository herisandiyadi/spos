import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_discount/g_discount.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_payment_method/g_payment_method.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction/g_transaction.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction_detail/g_transaction_detail.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction_type/g_transaction_type.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/c_order_offline.dart';
import 'package:squadra_pos/refactor/presentation/routes/app_routes.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';
import 'package:squadra_pos/refactor/utils/custom_dialog.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';

class NumberInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat("#,###", "id_ID");

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Hapus karakter non-digit dulu
    String newText = newValue.text.replaceAll('.', '');

    // Ubah ke format dengan titik pemisah ribuan
    String formattedText = _formatter.format(int.parse(newText));

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class CheckoutPage extends StatefulWidget {
  final Function(int) onNavigateCheckout;

  final String transactionNumber;
  final VoidCallback callBack;
  final VoidCallback callBackDispose;

  const CheckoutPage(
      {super.key,
      required this.onNavigateCheckout,
      required this.transactionNumber,
      required this.callBack,
      required this.callBackDispose});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage>
    with SingleTickerProviderStateMixin {
  final transactionOrderOfflineController = Get.find<OrderOfflineController>();

  final dbHelper = DatabaseHelper();
  final payInputController = TextEditingController();

  List discountOnTrans = [];
  List discountOnDetail = [];

  bool loadingPayment = true;
  bool closeBillLoading = false;

  int paymentMethodIDSend = 0;
  int transactionTypeJuncIDSend = 0;
  int masterDiscountID = 0;
  int qtyDiscount = 0;
  int grandTotalFinal = 0;
  String ppnName = '';
  String paymentMethodIDLabel = '';
  String transType = 'Dine In';

  var trans = <TransactionLiteModel>[];
  var discount = <DiscountLiteModel>[];
  var payments = <PaymentMethodLiteModel>[];
  var transTypeJuncs = <TransactionTypeLiteModel>[];
  final controller = Get.find<OrderOfflineController>();
  var transDetail = <TransactionDetailLiteModel>[];
  num subTotal = 0;
  num discountTotals = 0;
  num grandTotalBeforeTax = 0;
  num tax = 0;

  num grandTotalAfterTax = 0;

  int bulatkanKe500(int harga) {
    return ((harga + 499) ~/ 500) * 500;
  }

  void _addGuestNumber(String number) {
    String currentText = payInputController.text.replaceAll('.', '');
    String newText = currentText + number;
    int value = int.tryParse(newText) ?? 0;

    payInputController.text = NumberFormat('#,###', 'id_ID').format(value);
  }

  void _delGuestNumber() {
    String currentText = payInputController.text.replaceAll('.', '');

    if (currentText.isNotEmpty) {
      String newText = currentText.substring(0, currentText.length - 1);
      int value = int.tryParse(newText) ?? 0;

      payInputController.text = value > 0
          ? NumberFormat('#,###', 'id_ID').format(value)
          : ''; // Format ulang
    }
  }

  Future<void> _closeBill(grandTotalBeforeTax, ppn, grandTotalAfterTax) async {
    if (paymentMethodIDSend == 0) {
      setState(() {
        closeBillLoading = false;
      });

      CustomDialog.show(context, "Please choose the payment type.");

      return;
    }

    if (transType == 'Delivery') {
      if (transactionTypeJuncIDSend == 0) {
        setState(() {
          closeBillLoading = false;
        });

        CustomDialog.show(context, "Please choose the delivery type.");

        return;
      }
    }

    // String rawValue = payInputController.text.replaceAll('.', '');
    // await Future.delayed(const Duration(milliseconds: 1000));

    // List<Map<String, dynamic>> payMethod = [];

    // var nPay = payments.where((item) => item.paymentMethodID == paymentMethodIDSend).toList();

    // int discountTotalDetail = 0;

    // for (var transDisAdd in transDetail) {
    //   final int qty = transDisAdd.qty;

    //   final List discountDetails = transDisAdd.discountDetail;

    //   if (discountDetails.isNotEmpty) {
    //     for (var d in discountDetails) {
    //       final int discount = d['discountTotal'] ?? 0;
    //       discountTotalDetail += discount * qty;
    //     }
    //   }

    //   for (var transD in transDisAdd.discountDetail) {
    //     discountOnDetail.add({
    //       "transactionDetailID": transDisAdd.transactionDetailID,
    //       "masterDiscountID": transD['masterDiscountID'],
    //       "menuID": transDisAdd.menuID,
    //       "discountTotal": transD['discountTotal']
    //     });
    //   }
    // }

    // // int discountTotalHeader = discountOnTrans.fold(0, (sum, d) => sum + (d['discountTotal'] as num).toInt());
    // // int discountTotalDetail = discountOnDetail.fold(0, (sum, d) => sum + (d['discountTotal'] as num).toInt());

    // final discountTotalFinal = discountTotals + discountTotalDetail;
    // final gTotal = bulatkanKe500(grandTotalAfterTax - discountTotalFinal);
    // final roundingFinal = bulatkanKe500(grandTotalAfterTax - discountTotalFinal) - grandTotalAfterTax + discountTotalFinal;

    // for (var resNPay in nPay) {
    //   if (resNPay.paymentMethodName == 'Cash') {
    //     if (rawValue.isEmpty) {
    //       if (!mounted) return;
    //       CustomDialog.show(context, "Please enter the cash value.");

    //       setState(() {
    //         closeBillLoading = false;
    //       });

    //       return;
    //     } else {
    //       if (num.parse(rawValue) < gTotal) {
    //         if (!mounted) return;
    //         CustomDialog.show(context, "The cash value should be greater than the transaction value.");

    //         setState(() {
    //           closeBillLoading = false;
    //         });

    //         return;
    //       }
    //     }
    //     payMethod.add(
    //       {
    //         "method": resNPay.paymentMethodName,
    //         "amount": gTotal,
    //         "pay": int.parse(rawValue),
    //         "fee": resNPay.paymentFee,
    //       },
    //     );
    //   } else {
    //     payMethod.add(
    //       {
    //         "method": resNPay.paymentMethodName,
    //         "amount": gTotal,
    //         "pay": 0,
    //         "fee": resNPay.paymentFee,
    //       },
    //     );
    //   }
    // }

    setState(() {
      closeBillLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));
    // final transactionOrderOfflineController =
    //     Get.find<OrderOfflineController>();
    double taxSettings = transactionOrderOfflineController.taxPercent.value;
    debugPrint("Transaction Tax: $taxSettings", wrapWidth: 1024);
    String rawValue = payInputController.text.replaceAll('.', '');
    debugPrint("🔢 rawValue cleaned: $rawValue");

    List<Map<String, dynamic>> payMethod = [];

    var nPay = payments
        .where((item) => item.paymentMethodID == paymentMethodIDSend)
        .toList();
    debugPrint("💳 Selected payments: ${nPay.length}");

    int discountTotalDetail = 0;

    for (var transDisAdd in transDetail) {
      final int qty = transDisAdd.qty;
      final List discountDetails = transDisAdd.discountDetail;
      final List addOns = transDisAdd.addOn;

      debugPrint("Add On item: $addOns");
      debugPrint(
          "🧾 Checking item: ${transDisAdd.menuID}, ${transDisAdd.menuName}, qty: $qty");

      if (discountDetails.isNotEmpty) {
        for (var d in discountDetails) {
          final int discount = d['discountTotal'] ?? 0;
          discountTotalDetail += discount * qty;
          debugPrint(
              "➖ Discount applied: $discount * $qty = ${discount * qty}");
        }
      }

      for (var transD in transDisAdd.discountDetail) {
        discountOnDetail.add({
          "transactionDetailID": transDisAdd.transactionDetailID,
          "masterDiscountID": transD['masterDiscountID'],
          "menuID": transDisAdd.menuID,
          "discountTotal": transD['discountTotal']
        });
      }
    }

    final discountTotalFinal = discountTotals + discountTotalDetail;
    debugPrint("🎯 Total discount: $discountTotalFinal");

    final ppn = ((subTotal - discountTotalFinal) * taxSettings).ceil();
    final grandTot = ((subTotal - discountTotalFinal) + ppn).toInt();

    final gTotal = !transactionOrderOfflineController.isCheckedRound.value
        ? grandTot
        : bulatkanKe500(grandTot);
    final roundingFinal =
        !transactionOrderOfflineController.isCheckedRound.value
            ? 0
            : gTotal - grandTot;

    debugPrint("💰 Grand total (rounded): $gTotal");
    debugPrint("🔁 Rounding final: $roundingFinal");

    debugPrint(
        "🔁 Tax Setting: ${transactionOrderOfflineController.taxPercent.value} ");
    final ppnName =
        "${transactionOrderOfflineController.taxName.value} (${transactionOrderOfflineController.taxPercent.value * 100}%)";
    for (var resNPay in nPay) {
      debugPrint("💳 Payment method: ${resNPay.paymentMethodName}");

      if (resNPay.paymentMethodName == 'Cash') {
        if (rawValue.isEmpty) {
          CustomDialog.show(Get.context!, "Please enter the cash value.");
          setState(() {
            closeBillLoading = false;
          });
          return;
        }

        if (num.parse(rawValue) < gTotal) {
          CustomDialog.show(Get.context!,
              "The cash value should be greater than the transaction value.");
          setState(() {
            closeBillLoading = false;
          });
          return;
        }

        payMethod.add({
          "method": resNPay.paymentMethodName,
          "amount": gTotal,
          "pay": int.parse(rawValue),
          "fee": resNPay.paymentFee,
        });
      } else {
        payMethod.add({
          "method": resNPay.paymentMethodName,
          "amount": gTotal,
          "pay": 0,
          "fee": resNPay.paymentFee,
        });
      }
    }

    debugPrint("🧾 Final payment payload:\n$payMethod");
    final now = DateTime.now();
    await dbHelper.updateTransaction(
        widget.transactionNumber,
        'Close',
        jsonEncode(payMethod),
        subTotal.toInt(),
        discountTotalFinal.toInt(),
        jsonEncode(discountOnDetail),
        grandTotalBeforeTax.toInt(),
        ppn,
        ppnName,
        grandTotalAfterTax,
        roundingFinal.toInt(),
        gTotal,
        transactionTypeJuncIDSend,
        now.toString());

    if (masterDiscountID != 0) {
      await dbHelper.updateDiscount(masterDiscountID, qtyDiscount);
    }

    setState(() {
      closeBillLoading = false;
    });

    var arguments = {
      "refresh": true,
      "transaction_number": widget.transactionNumber,
    };

    Get.offNamedUntil(RouteName.successPaymentOffline, (route) => route.isFirst,
        arguments: arguments);
  }

  Future<void> _getTransDetailLite() async {
    debugPrint(
        "[DEBUG] Fetching transaction detail for: ${widget.transactionNumber}");

    final transDetailRes = await dbHelper.getTransactionDetail(
        transactionNumber: widget.transactionNumber);
    debugPrint("[DEBUG] Raw transaction detail response: $transDetailRes");
    double taxSettings = transactionOrderOfflineController.taxPercent.value;
    if (!mounted) return;

    setState(() {
      Iterable list = transDetailRes;
      transDetail = list
          .map((model) => TransactionDetailLiteModel.fromJson(model))
          .toList();
      debugPrint("[DEBUG] Mapped transDetail length: ${transDetail.length}");
    });

    // Ambil add-on untuk setiap detail transaksi
    for (var i = 0; i < transDetail.length; i++) {
      debugPrint(
          "[DEBUG] Fetching add-ons for transactionDetailID: ${transDetail[i].transactionDetailID}");

      final transDetailAddonRes = await dbHelper
          .getTransactionDetailAddOn(transDetail[i].transactionDetailID);
      debugPrint("[DEBUG] Add-ons fetched: $transDetailAddonRes");

      transDetail[i] = transDetail[i].copyWith(addOn: transDetailAddonRes);
    }

    if (!mounted) return;
    setState(() {
      transDetail = List.from(transDetail);
      debugPrint("[DEBUG] Updated transDetail with add-ons");
    });

    // Hitung total
    num totalMenu = 0;
    num totalAddon = 0;

    for (var cTot in transDetail) {
      num menuTotal = cTot.qty * cTot.menuPrice;
      totalMenu += menuTotal;
      debugPrint(
          "[DEBUG] Menu Total += ${cTot.qty} x ${cTot.menuPrice} = $menuTotal");

      for (var aTot in cTot.addOn) {
        num addonTotal = cTot.qty * aTot['menuPrice'];
        totalAddon += addonTotal;
        debugPrint(
            "[DEBUG] Addon Total += ${cTot.qty} x ${aTot['menuPrice']} = $addonTotal");
      }
      final discountTotalFinal = discountTotals;

      final ppn =
          (((totalMenu + totalAddon) - discountTotalFinal) * taxSettings)
              .ceil();
      final grandTot =
          (((totalMenu + totalAddon) - discountTotalFinal) + ppn).toInt();

      final gTotal = bulatkanKe500(grandTot);
      final roundingFinal = gTotal - grandTot;

      setState(() {
        subTotal = totalMenu + totalAddon;
        grandTotalBeforeTax = subTotal - discountTotals;
        tax = grandTotalBeforeTax * taxSettings;
        grandTotalAfterTax = grandTotalBeforeTax + tax;
        // grandTotalFinal = gTotal;
        debugPrint("[DEBUG] discTotal: $discountTotals");
        debugPrint("[DEBUG] subTotal: $subTotal");
        debugPrint("[DEBUG] grandTotalBeforeTax: $grandTotalBeforeTax");
        debugPrint("[DEBUG] tax: $tax");
        debugPrint("[DEBUG] grandTotalAfterTax: $grandTotalAfterTax");
      });
    }
  }

  Future<void> _discountList() {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(15),
            backgroundColor: Colors.white,
            insetPadding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 5.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  discount.isEmpty
                      ? Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "No Discount Listed",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: "NanumGothic",
                              color: customHeadingText,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  for (var data in discount)
                    Container(
                      margin: data == discount.last
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
                                      data.spesificMenuID.isEmpty
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
                                      for (var resMenuDis
                                          in data.spesificMenuID)
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
                                          numberFormat(
                                                  'IDR', data.discountValue)
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
                            child: ElevatedButton(
                              onPressed: () async {
                                debugPrint("[DEBUG] Discount data: $data");
                                debugPrint(
                                    "[DEBUG] discountOnTrans.isNotEmpty: ${discountOnTrans.isNotEmpty}");

                                if (discountOnTrans.isNotEmpty) {
                                  debugPrint(
                                      "[DEBUG] Resetting transaction discount (because discountOnTrans is not empty)");

                                  await dbHelper.updateTransactionResetDiscount(
                                      widget.transactionNumber);
                                  await dbHelper
                                      .updateTransactionDetailResetDiscount(
                                          widget.transactionNumber);

                                  await _updateDiscount();
                                  await _getTransDetailLite();

                                  widget.callBack.call();

                                  debugPrint("[DEBUG] Navigating back");
                                  Get.back();
                                } else {
                                  debugPrint(
                                      "[DEBUG] Resetting transaction discount (no previous discount)");

                                  await dbHelper.updateTransactionResetDiscount(
                                      widget.transactionNumber);
                                  await dbHelper
                                      .updateTransactionDetailResetDiscount(
                                          widget.transactionNumber);

                                  await _updateDiscount();
                                  await _getTransDetailLite();

                                  if (data.spesificMenuID.isEmpty) {
                                    debugPrint(
                                        "[DEBUG] Diskon berlaku untuk semua menu");
                                    if (data.valueType == 'Nominal') {
                                      discountTotals = data.discountValue;
                                      debugPrint(
                                          "[DEBUG] Nominal discount applied: $discountTotals");
                                    } else {
                                      discountTotals =
                                          (subTotal * data.discountValue / 100);
                                      debugPrint(
                                          "[DEBUG] Percentage discount applied: $discountTotals");
                                    }

                                    setState(() {
                                      discountTotals = discountTotals;
                                    });
                                  } else {
                                    discountTotals = 0;
                                    debugPrint(
                                        "[DEBUG] Diskon hanya untuk menu tertentu");

                                    final menuId = data.spesificMenuID
                                        .map((item) => int.tryParse(
                                            item['MenuID'].toString()))
                                        .toList();
                                    debugPrint(
                                        "[DEBUG] Menu IDs for discount: $menuId");

                                    final discountIncludes = transDetail
                                        .where((menu) => menuId
                                            .any((id) => id == menu.menuID))
                                        .toList();
                                    debugPrint(
                                        "[DEBUG] Filtered menu for discount: ${discountIncludes.map((e) => e.menuName)}");

                                    for (var value in discountIncludes) {
                                      if (data.valueType == 'Nominal') {
                                        num addedDiscount =
                                            data.discountValue * value.qty;
                                        discountTotals += addedDiscount;
                                        debugPrint(
                                            "[DEBUG] Nominal discount += ${data.discountValue} x ${value.qty} = $addedDiscount");
                                      } else {
                                        num addedDiscount = (value.menuPrice *
                                                data.discountValue /
                                                100) *
                                            value.qty;
                                        discountTotals += addedDiscount;
                                        debugPrint(
                                            "[DEBUG] Percentage discount += ${value.menuPrice} x ${data.discountValue}% x ${value.qty} = $addedDiscount");
                                      }
                                    }

                                    setState(() {
                                      discountTotals = discountTotals;
                                    });
                                  }

                                  debugPrint(
                                      "[DEBUG] Final calculated discount: $discountTotals");
                                  debugPrint("[DEBUG] subTotal: $subTotal");

                                  if (discountTotals <= subTotal) {
                                    debugPrint(
                                        "[DEBUG] Discount is valid (less than subtotal), applying discount...");

                                    discountOnTrans.add({
                                      "masterDiscountID": data.masterDiscountID,
                                      "discountTotal": discountTotals,
                                    });

                                    _setDiscount(
                                        discountTotals, discountOnTrans);

                                    setState(() {
                                      masterDiscountID = data.masterDiscountID;
                                      qtyDiscount = data.qtyDiscount;
                                    });

                                    debugPrint(
                                        "[DEBUG] masterDiscountID: $masterDiscountID, qtyDiscount: $qtyDiscount");
                                  } else {
                                    debugPrint(
                                        "[DEBUG] Discount is greater than subtotal. Ignored.");
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(10, 28.sp),
                                backgroundColor: discountOnTrans.isEmpty
                                    ? primaryColor
                                    : customRed1,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Text(
                                discountOnTrans.isEmpty
                                    ? "Add Discount"
                                    : "Remove Discount",
                                style: TextStyle(
                                  fontSize: 8.sp,
                                  fontFamily: 'UbuntuBold',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  Future<void> _otherPayments(payments) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
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
                    Text(
                      "Others",
                      style: TextStyle(fontWeight: FontWeight.w700),
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
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                vertical: 16,
              ),
              itemCount: payments.length,
              itemBuilder: (context, index) {
                return payments.length > 3
                    ? Padding(
                        padding: EdgeInsets.only(
                          bottom: 5.0,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              payInputController.text = '';
                              paymentMethodIDSend =
                                  payments[index].paymentMethodID;
                              paymentMethodIDLabel =
                                  payments[index].paymentMethodName;
                            });

                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            fixedSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: BorderSide(
                                width: 2,
                                color: paymentMethodIDSend ==
                                        payments[index].paymentMethodID
                                    ? primaryColor
                                    : customRegularGrey,
                              ),
                            ),
                            backgroundColor: paymentMethodIDSend ==
                                    payments[index].paymentMethodID
                                ? primaryColor
                                : Colors.white,
                          ),
                          child: Text(
                            payments[index].paymentMethodName,
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontFamily: 'UbuntuBold',
                              color: paymentMethodIDSend ==
                                      payments[index].paymentMethodID
                                  ? Colors.white
                                  : customBodyText,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink();
              },
            ),
          ),
        );
      },
    );
  }

  Future<void> _getDiscountLite() async {
    String today = DateFormat('EEEE').format(DateTime.now());
    final result = await dbHelper.getDiscount();
    final discountListToday = result
        .map((row) {
          return DiscountLiteModel(
            masterDiscountID: row['masterDiscountID'],
            masterDiscountName: row['masterDiscountName'],
            discountType: row['discountType'],
            valueType: row['valueType'],
            discountValue: row['discountValue'],
            spesificMenuID: (jsonDecode(row['spesificMenuID']) as List)
                .map((e) => e as Map<String, dynamic>)
                .toList(),
            discountValidFrom: row['discountValidFrom'],
            discountValidUntil: row['discountValidUntil'],
            minTransDiscount: row['minTransDiscount'],
            outletID: row['outletID'],
            maxDiscount: row['maxDiscount'],
            qtyDiscount: row['qtyDiscount'],
            availableDay:
                (jsonDecode(row['availableDay']) as List).cast<String>(),
          );
        })
        .where((item) =>
            item.discountType == 1 &&
            (item.availableDay?.contains(today) ?? false))
        .toList();

    if (!mounted) return;
    setState(() {
      discount = discountListToday;
    });
  }

  Future<void> _setDiscount(discountTotal, discountOnTrans) async {
    await dbHelper.updateTransactionDiscount(widget.transactionNumber,
        discountTotal.toInt(), jsonEncode(discountOnTrans));

    widget.callBack.call();

    Get.back();
  }

  Future<void> _getPaymentMethodLite() async {
    final result = await dbHelper.getPaymentMethodLite();

    if (!mounted) return;
    setState(() {
      payments = result
          .map((model) => PaymentMethodLiteModel.fromJson(model))
          .toList();
      loadingPayment = false;
    });
    print(payments);
  }

  Future<void> _getTransactionTypeJuncLite() async {
    List<Map<String, dynamic>> transTypeRes =
        await dbHelper.getTransactionTypeJuncLite();

    if (!mounted) return;
    setState(() {
      Iterable list = transTypeRes;
      transTypeJuncs = list
          .map((model) => TransactionTypeLiteModel.fromJson(model))
          .where((item) => item.chargeValue != 0)
          .toList();
    });
  }

  num _calculateDiscount(TransactionDetailLiteModel detail) {
    num total = 0;
    for (final discount in detail.discountDetail) {
      final int discountAmount = discount['discountTotal'] ?? 0;
      total += discountAmount * detail.qty;
    }
    return total;
  }

  Future<void> _getTransSpec() async {
    final result = await dbHelper.getTransSpec(
        transactionNumber: widget.transactionNumber);
    final rawDetails = await dbHelper.getTransactionDetail(
        transactionNumber: widget.transactionNumber);
    final details =
        rawDetails.map(TransactionDetailLiteModel.fromJson).toList();
    double taxSettings = transactionOrderOfflineController.taxPercent.value;
    if (!mounted) return;

    num totalDiscount = 0;

    // :: Process each transaction detail
    for (int i = 0; i < details.length; i++) {
      final detail = details[i];
      final addOns =
          await dbHelper.getTransactionDetailAddOn(detail.transactionDetailID);
      final updatedDetail = detail.copyWith(addOn: addOns);

      details[i] = updatedDetail;
      totalDiscount += _calculateDiscount(updatedDetail);
    }

    final discountTotalFinal = discountTotals + totalDiscount;

    final ppn = ((subTotal - discountTotalFinal) * taxSettings).ceil();
    final grandTot = ((subTotal - discountTotalFinal) + ppn).toInt();

    final gTotal =
        !controller.isCheckedRound.value ? grandTot : bulatkanKe500(grandTot);
    final roundingFinal =
        !controller.isCheckedRound.value ? 0 : gTotal - grandTot;
    // print('${transDetail}');
    setState(() {
      transType = result.first['transactionType'];
      subTotal = result.first['subTotal'];
      discountTotals = result.first['discountTotal'];
      grandTotalBeforeTax = result.first['grandTotalBeforeTax'];

      grandTotalFinal = gTotal;
    });
  }

  Future<void> _updateDiscount() async {
    final result = await dbHelper.getTransSpec(
        transactionNumber: widget.transactionNumber);
    double taxSettings = transactionOrderOfflineController.taxPercent.value;
    debugPrint("asd: ${jsonEncode(result)}");

    setState(() {
      discountOnTrans = jsonDecode(result.first['discountOnTrans']);
      discountTotals = result.first['discountTotal'];

      grandTotalBeforeTax = subTotal - discountTotals;
      tax = grandTotalBeforeTax * taxSettings;
      grandTotalAfterTax = grandTotalBeforeTax + tax;
    });
  }

  Future<void> backToOrder() async {
    await dbHelper.updateTransactionResetDiscount(widget.transactionNumber);
    await dbHelper
        .updateTransactionDetailResetDiscount(widget.transactionNumber);

    widget.callBack.call();
    widget.onNavigateCheckout(0);
    transactionOrderOfflineController.grandTotal.value = 0;
  }

  @override
  void initState() {
    super.initState();

    _updateDiscount();
    _getTransSpec();
    _getDiscountLite();
    _getTransDetailLite();
    _getPaymentMethodLite();
    _getTransactionTypeJuncLite();
  }

  @override
  void dispose() {
    widget.callBackDispose.call();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: customWhite1,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 60,
          centerTitle: false,
          backgroundColor: customWhite1,
          leading: IconButton(
            color: Colors.black,
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              await backToOrder();
            },
          ),
          title: Text(
            'Checkout',
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'UbuntuBold',
              color: customBodyText,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          child: closeBillLoading
              ? Center(
                  child: CircularProgressIndicator(
                    strokeCap: StrokeCap.round,
                    valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 5.8,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Obx(() {
                                _getTransSpec();

                                final grandTotal =
                                    transactionOrderOfflineController
                                        .grandTotal.value;

                                return TextField(
                                  controller: payInputController,
                                  readOnly: true,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    NumberInputFormatter(),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontFamily: 'UbuntuBold',
                                    color: customBodyText,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: customDarkGrey,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(7.w, 7.h, 7.w, 7.h),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: customLightGrey,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: customLightGrey,
                                      ),
                                    ),
                                    hintText: numberFormatNoIDR(
                                            grandTotalFinal.toInt())
                                        .toString(),
                                    hintStyle: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: 'UbuntuBold',
                                      color: customGrey2,
                                    ),
                                  ),
                                );
                              }),
                              const SizedBox(height: 10),
                              GridView.builder(
                                shrinkWrap: true,
                                itemCount: 16,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  childAspectRatio: 1,
                                  mainAxisSpacing: 10.h,
                                  crossAxisSpacing: 10.w,
                                ),
                                itemBuilder: (context, index) {
                                  if (index == 3) {
                                    return GestureDetector(
                                      onTap: () => _delGuestNumber(),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: Icon(Icons.backspace_outlined,
                                            size: 13.sp),
                                      ),
                                    );
                                  } else if (index == 7) {
                                    return GestureDetector(
                                      onTap: () {
                                        if (paymentMethodIDLabel == 'Cash')
                                          _addGuestNumber('100');
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: Text(
                                          100.toString(),
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: "NanumGothic",
                                            color: customBodyText,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else if (index == 11) {
                                    return GestureDetector(
                                      onTap: () {
                                        if (paymentMethodIDLabel == 'Cash')
                                          _addGuestNumber('50');
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: Text(
                                          50.toString(),
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: "NanumGothic",
                                            color: customBodyText,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else if (index == 12) {
                                    return GestureDetector(
                                      onTap: () {
                                        if (paymentMethodIDLabel == 'Cash')
                                          _addGuestNumber('0');
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.grey),
                                        ),
                                        child: Text(
                                          0.toString(),
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: "NanumGothic",
                                            color: customBodyText,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else if (index == 13) {
                                    return GestureDetector(
                                      onTap: () {
                                        if (paymentMethodIDLabel == 'Cash')
                                          _addGuestNumber('00');
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.grey),
                                        ),
                                        child: Text(
                                          '00'.toString(),
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: "NanumGothic",
                                            color: customBodyText,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else if (index == 14) {
                                    return GestureDetector(
                                      onTap: () {
                                        if (paymentMethodIDLabel == 'Cash')
                                          _addGuestNumber('000');
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.grey),
                                        ),
                                        child: Text(
                                          '000'.toString(),
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: "NanumGothic",
                                            color: customBodyText,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else if (index == 15) {
                                    return GestureDetector(
                                      onTap: () async {
                                        await _getTransSpec();
                                        await _getTransDetailLite();

                                        debugPrint(
                                            "[DEBUG] Called _getTransDetailLite()");

                                        // await Future.delayed(const Duration(milliseconds: 500));
                                        double taxSettings =
                                            transactionOrderOfflineController
                                                .taxPercent.value;
                                        grandTotalBeforeTax = subTotal;
                                        debugPrint(
                                            "[DEBUG] grandTotalBeforeTax: $grandTotalBeforeTax (subTotal: $subTotal - discountTotal: $discountTotals)");

                                        tax = ((subTotal - discountTotals) *
                                                taxSettings)
                                            .ceil();
                                        debugPrint(
                                            "[DEBUG] tax: $tax (grandTotalBeforeTax: $grandTotalBeforeTax * taxSettings: $taxSettings)");

                                        final grandTotalAfterTax =
                                            (grandTotalBeforeTax -
                                                    discountTotals) +
                                                tax;
                                        debugPrint(
                                            "[DEBUG] grandTotalAfterTax: $grandTotalAfterTax (grandTotalBeforeTax: $grandTotalBeforeTax + tax: $tax)");

                                        _closeBill(
                                            grandTotalBeforeTax,
                                            tax.toInt(),
                                            grandTotalAfterTax.toInt());
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: primaryColor,
                                          border: Border.all(
                                            color: primaryColor,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          size: 13.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  } else if (index > 3 && index < 7) {
                                    String numberGuest = "$index";
                                    return GestureDetector(
                                      onTap: () {
                                        if (paymentMethodIDLabel == 'Cash')
                                          _addGuestNumber(numberGuest);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.grey),
                                        ),
                                        child: Text(
                                          numberGuest.toString(),
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: "NanumGothic",
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else if (index > 6) {
                                    String numberGuest = "${index - 1}";
                                    return GestureDetector(
                                      onTap: () {
                                        if (paymentMethodIDLabel == 'Cash')
                                          _addGuestNumber(numberGuest);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.grey),
                                        ),
                                        child: Text(
                                          numberGuest.toString(),
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: "NanumGothic",
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    String numberGuest = "${index + 1}";
                                    return GestureDetector(
                                      onTap: () {
                                        if (paymentMethodIDLabel == 'Cash')
                                          _addGuestNumber(numberGuest);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.grey),
                                        ),
                                        child: Text(
                                          numberGuest.toString(),
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: "NanumGothic",
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: null,
                                  icon: const Icon(Icons.tips_and_updates),
                                  label: Text(
                                    "Tip",
                                    style: TextStyle(
                                      fontFamily: 'UbuntuBold',
                                      fontSize: 9.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    minimumSize: Size(150, 28.sp),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: null,
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    minimumSize: Size(150, 28.sp),
                                    side: BorderSide(color: customRegularGrey),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  child: Text(
                                    "+ Surcharge",
                                    style: TextStyle(
                                        fontSize: 9.sp,
                                        fontFamily: 'UbuntuBold',
                                        color: Colors.white),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: null,
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    minimumSize: Size(150, 28.sp),
                                    side: BorderSide(
                                      color: customRegularGrey,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  child: Text(
                                    "Split Payment",
                                    style: TextStyle(
                                      fontSize: 9.sp,
                                      fontFamily: 'UbuntuBold',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () async {
                                    await _updateDiscount();
                                    await _getTransDetailLite();
                                    await _discountList();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    minimumSize: Size(150, 28.sp),
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  child: Text(
                                    "% Discount",
                                    style: TextStyle(
                                      fontSize: 9.sp,
                                      fontFamily: 'UbuntuBold',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            transType == 'Delivery'
                                ? Column(
                                    children: [
                                      for (var transTypeJuncRes
                                          in transTypeJuncs)
                                        Column(
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  transactionTypeJuncIDSend =
                                                      transTypeJuncRes
                                                          .transactionTypeJuncID;
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                minimumSize: Size(150, 28.sp),
                                                backgroundColor:
                                                    transactionTypeJuncIDSend ==
                                                            transTypeJuncRes
                                                                .transactionTypeJuncID
                                                        ? primaryColor
                                                        : customRegularGrey,
                                                foregroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                              ),
                                              child: Text(
                                                transTypeJuncRes.transJuncName,
                                                style: TextStyle(
                                                  fontFamily: 'UbuntuBold',
                                                  fontSize: 8.sp,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                          ],
                                        ),
                                    ],
                                  )
                                : const SizedBox.shrink(),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 0),
                    loadingPayment
                        ? SizedBox(
                            height: 120.h,
                            child: Center(
                              child: SizedBox(
                                width: 200.r,
                                child: LinearProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      primaryColor),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            height: 120.h,
                            child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: 4,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                childAspectRatio: 4.5,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 5,
                              ),
                              itemBuilder: (context, index) {
                                if (index == 3) {
                                  return ElevatedButton(
                                    onPressed: () {
                                      // setState(() {
                                      //   payInputController.text = '';
                                      //   paymentMethodIDSend = 0;
                                      //   paymentMethodIDLabel = '';
                                      // });
                                      _otherPayments(payments);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        side: BorderSide(
                                          width: 2,
                                          color: paymentMethodIDSend ==
                                                  payments[index]
                                                      .paymentMethodID
                                              ? primaryColor
                                              : customRegularGrey,
                                        ),
                                      ),
                                      backgroundColor: paymentMethodIDSend ==
                                              payments[index].paymentMethodID
                                          ? primaryColor
                                          : Colors.white,
                                    ),
                                    child: Text(
                                      'Others',
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontFamily: 'UbuntuBold',
                                        color: paymentMethodIDSend ==
                                                payments[index].paymentMethodID
                                            ? Colors.white
                                            : customBodyText,
                                      ),
                                    ),
                                  );
                                } else {
                                  return ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        payInputController.text = '';
                                        paymentMethodIDSend =
                                            payments[index].paymentMethodID;
                                        paymentMethodIDLabel =
                                            payments[index].paymentMethodName;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        side: BorderSide(
                                          width: 2,
                                          color: paymentMethodIDSend ==
                                                  payments[index]
                                                      .paymentMethodID
                                              ? primaryColor
                                              : customRegularGrey,
                                        ),
                                      ),
                                      backgroundColor: paymentMethodIDSend ==
                                              payments[index].paymentMethodID
                                          ? primaryColor
                                          : Colors.white,
                                    ),
                                    child: Text(
                                      payments[index].paymentMethodName,
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontFamily: 'UbuntuBold',
                                        color: paymentMethodIDSend ==
                                                payments[index].paymentMethodID
                                            ? Colors.white
                                            : customBodyText,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                  ],
                ),
        ),
      ),
    );
  }
}
