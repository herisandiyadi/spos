import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_discount/g_discount.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_tax/g_tax.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction_detail/g_transaction_detail.dart';
import 'package:squadra_pos/refactor/data/models/transaction_smenu_detail/m_transaction_sm_detail.dart';
import 'package:squadra_pos/refactor/presentation/controllers/discount/discount_controller.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/c_order_offline.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_check_out.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_detail.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_order.dart';
import 'package:squadra_pos/refactor/presentation/screens/smenu/component_smenu_order/component_smenu_checkout/payment_method_grid.dart';
import 'package:squadra_pos/refactor/presentation/screens/smenu/component_smenu_order/discount_dialog.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';

class SMCheckoutPage extends StatefulWidget {
  SMCheckoutPage({super.key});

  @override
  State<SMCheckoutPage> createState() => _SMCheckoutPageState();
}

class _SMCheckoutPageState extends State<SMCheckoutPage> {
  final args = Get.arguments as Map<String, dynamic>;

  final transactionSMOrderController = Get.find<TransactionOrderSMController>();
  OrderOfflineController get transactionOrderOfflineController {
    if (!Get.isRegistered<OrderOfflineController>()) {
      Get.put(OrderOfflineController());
    }
    return Get.find<OrderOfflineController>();
  }

  final transactionDetailSMController =
      Get.find<TransactionDetailSMController>();

  final transactionCheckOutSMController =
      Get.find<TransactionCheckOutSMController>();
  final discountController = Get.put(DiscountController());
  // Tambahkan Rx<num> untuk subtotal
  final ValueNotifier<bool> isCheckedRound = ValueNotifier(false);

  final dbHelper = DatabaseHelper();
  late String transactionNumber;

  double taxPercent = 0.0;

  String taxName = '';

  List discountOnTrans = [];
  List discountOnDetail = [];
  num discountTotals = 0;
  num grandTotalBeforeTax = 0;
  num tax = 0;
  num grandTotalAfterTax = 0;
  num subTotal = 0;
  var transDetail = <TransactionDetailLiteModel>[];
  var discount = <DiscountLiteModel>[];
  int masterDiscountID = 0;
  int qtyDiscount = 0;

  @override
  void initState() {
    super.initState();
    transactionNumber = args["transactionNumber"];

    // Listen to discount changes and update checkout totals in real time
    ever<num>(discountController.discountValue, (discountValue) {
      // header is not available in initState, so we use a workaround:
      // Use WidgetsBinding to ensure context is available
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final header = Get.arguments['header'];
        final subtotal = header?.subTotal ?? 0;
        transactionCheckOutSMController.updateCheckoutTotals(
          subtotal: subtotal,
          discountValue: discountValue,
        );
      });
    });
  }

  Future<void> _setDiscount(discountTotal, discountOnTrans) async {
    await dbHelper.updateTransactionDiscount(
        transactionNumber, discountTotal.toInt(), jsonEncode(discountOnTrans));

    // widget.callBack.call();

    Get.back();
  }

  Future<double> _getTax() async {
    final result = await dbHelper.getTax();
    // taxPercent = 0.0;
    transactionCheckOutSMController.taxPercent.value = result.isNotEmpty
        ? (TaxLiteModel.fromJson(result.first).taxPercent / 100)
        : 0;
    // taxName =
    // result.isNotEmpty ? TaxLiteModel.fromJson(result.first).taxName : '-';
    return taxPercent.toDouble();
  }

  Future<void> _updateDiscount() async {
    final result =
        await dbHelper.getTransSpec(transactionNumber: transactionNumber);
    double taxSettings = transactionOrderOfflineController.taxPercent.value;
    debugPrint("asd: ${jsonEncode(result)}");
    // log("SM ORDER DATA TOTAL $transactionNumber");

    setState(() {
      discountOnTrans = jsonDecode(result.first['discountOnTrans']);
      discountTotals = result.first['discountTotal'];

      grandTotalBeforeTax = subTotal - discountTotals;
      tax = grandTotalBeforeTax * taxSettings;
      grandTotalAfterTax = grandTotalBeforeTax + tax;
    });
  }

  @override
  Widget build(BuildContext context) {
    // _getTax();

    // final size = MediaQuery.of(context).size;

    // final cartId = args['cart_id'] ?? 0;
    // final staffName = args['staff_name'];
    // final outletName = args['outlet_name'];

    // final Rxn<TransactionSMHeaderData> header = Rxn<TransactionSMHeaderData>();
    // header.value = args['header'] as TransactionSMHeaderData;
    // int ppnDB = ((header.value?.subTotal ?? 0) *
    //         (transactionCheckOutSMController.taxPercent.value))
    //     .ceil();
    // print('${ppnDB}');
    // header.value = header.value?.copyWith(ppn: ppnDB);
    // final List<TransactionSMDetailData> rawDetail =
    //     args['detail'] as List<TransactionSMDetailData>;
    // final RxList<TransactionSMDetailData> detail = RxList.of(rawDetail);

    return FutureBuilder<double>(
        future: _getTax(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final size = MediaQuery.of(context).size;
          final cartId = args['cart_id'] ?? 0;
          final staffName = args['staff_name'];
          final outletName = args['outlet_name'];

          final Rxn<TransactionSMHeaderData> header =
              Rxn<TransactionSMHeaderData>();
          header.value = args['header'] as TransactionSMHeaderData;
          // Update checkout totals in controller
          transactionCheckOutSMController.updateCheckoutTotals(
            subtotal: header.value?.subTotal ?? 0,
            discountValue: discountController.discountValue.value,
          );
          // Optionally update header.value if needed elsewhere
          header.value = header.value?.copyWith(
            subTotal: header.value?.subTotal,
            ppn: transactionCheckOutSMController.ppnDB.value,
            grandTotalFinal:
                transactionCheckOutSMController.grandTotalFinal.value,
          );
          print("ppnDB ${transactionCheckOutSMController.ppnDB.value}");
          print(
              "TOTAL DUE ${transactionCheckOutSMController.grandTotalFinal.value} --- ${discountController.discountValue.value}");
          final List<TransactionSMDetailData> rawDetail =
              args['detail'] as List<TransactionSMDetailData>;
          final RxList<TransactionSMDetailData> detail = RxList.of(rawDetail);

          final customerId =
              int.tryParse(header.value?.customerID ?? ''.toString()) ?? 0;

          return Scaffold(
            backgroundColor: customWhite1,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: primaryColor,
              title: Row(
                children: [
                  Image.asset("assets/images/logoTextVert.png", height: 40.r),
                  Text(
                    " | $outletName",
                    style: const TextStyle(
                      fontSize: 21,
                      fontFamily: "UbuntuBold",
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              actions: [
                Container(
                  margin: EdgeInsets.only(right: 10.w),
                  alignment: Alignment.center,
                  child: Text(
                    staffName,
                    style: const TextStyle(
                      fontSize: 21,
                      fontFamily: "UbuntuBold",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            body: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(32, 15, 32, 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => Get.back(),
                                child: Icon(Icons.arrow_back_rounded,
                                    color: customBodyText),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Checkout',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'UbuntuBold',
                                  color: customBodyText,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        Obx(() {
                          final state =
                              transactionCheckOutSMController.status.value;

                          if (state.isLoading) {
                            return SizedBox(
                              height: size.height * 0.6,
                              child: Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 6.0,
                                  strokeCap: StrokeCap.round,
                                ),
                              ),
                            );
                          }
                          return Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width / 5.8,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      focusNode: transactionCheckOutSMController
                                          .nominalFocusNode,
                                      controller:
                                          transactionCheckOutSMController
                                              .nominalController,
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
                                        contentPadding: EdgeInsets.fromLTRB(
                                            7.w, 7.h, 7.w, 7.h),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: customLightGrey,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: customLightGrey,
                                          ),
                                        ),
                                        hintText: numberFormatNoIDR(
                                                header.value?.grandTotalFinal ??
                                                    0)
                                            .toString(),
                                        hintStyle: TextStyle(
                                          fontSize: 13.sp,
                                          fontFamily: 'UbuntuBold',
                                          color: customGrey2,
                                        ),
                                      ),
                                    ),
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
                                            onTap: () {
                                              transactionCheckOutSMController
                                                  .deleteNominal();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              child: Icon(
                                                  Icons.backspace_outlined,
                                                  size: 13.sp),
                                            ),
                                          );
                                        } else if (index == 7) {
                                          return GestureDetector(
                                            onTap: () {
                                              if (transactionCheckOutSMController
                                                      .isPaymentMethodName
                                                      .value ==
                                                  'Cash') {
                                                transactionCheckOutSMController
                                                    .inputNominal('100');
                                              }
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
                                              if (transactionCheckOutSMController
                                                      .isPaymentMethodName
                                                      .value ==
                                                  'Cash') {
                                                transactionCheckOutSMController
                                                    .inputNominal('50');
                                              }
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
                                              if (transactionCheckOutSMController
                                                      .isPaymentMethodName
                                                      .value ==
                                                  'Cash') {
                                                transactionCheckOutSMController
                                                    .inputNominal('0');
                                              }
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.grey),
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
                                              if (transactionCheckOutSMController
                                                      .isPaymentMethodName
                                                      .value ==
                                                  'Cash') {
                                                transactionCheckOutSMController
                                                    .inputNominal('00');
                                              }
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.grey),
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
                                              if (transactionCheckOutSMController
                                                      .isPaymentMethodName
                                                      .value ==
                                                  'Cash') {
                                                transactionCheckOutSMController
                                                    .inputNominal('000');
                                              }
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.grey),
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
                                              await transactionCheckOutSMController.closeBillCall(
                                                  cartId: cartId,
                                                  arguments: args,
                                                  transactionTypeJuncID: 1,
                                                  amount: header.value
                                                          ?.grandTotalFinal ??
                                                      0,
                                                  transactionId: header.value
                                                          ?.transactionID ??
                                                      0,
                                                  tableId: int.tryParse(header
                                                              .value?.tableID ??
                                                          ''.toString()) ??
                                                      0,
                                                  ppn: (header.value?.ppn) ?? 0,
                                                  rounding:
                                                      (header.value?.rounding ??
                                                          0),
                                                  grandTotalFinal: (header.value
                                                          ?.grandTotalFinal ??
                                                      0));
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
                                          return GestureDetector(
                                            onTap: () {
                                              if (transactionCheckOutSMController
                                                      .isPaymentMethodName
                                                      .value ==
                                                  'Cash') {
                                                transactionCheckOutSMController
                                                    .inputNominal("$index");
                                              }
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.grey),
                                              ),
                                              child: Text(
                                                "$index",
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontFamily: "NanumGothic",
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          );
                                        } else if (index > 6) {
                                          return GestureDetector(
                                            onTap: () {
                                              if (transactionCheckOutSMController
                                                      .isPaymentMethodName
                                                      .value ==
                                                  'Cash') {
                                                transactionCheckOutSMController
                                                    .inputNominal(
                                                        "${index - 1}");
                                              }
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.grey),
                                              ),
                                              child: Text(
                                                "${index - 1}",
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontFamily: "NanumGothic",
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return GestureDetector(
                                            onTap: () {
                                              if (transactionCheckOutSMController
                                                      .isPaymentMethodName
                                                      .value ==
                                                  'Cash') {
                                                transactionCheckOutSMController
                                                    .inputNominal(
                                                        "${index + 1}");
                                              }
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.grey),
                                              ),
                                              child: Text(
                                                "${index + 1}",
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ElevatedButton.icon(
                                        onPressed: null,
                                        icon:
                                            const Icon(Icons.tips_and_updates),
                                        label: Text(
                                          "Tip",
                                          style: TextStyle(
                                            fontFamily: 'UbuntuBold',
                                            fontSize: 9.sp,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          minimumSize: Size(150, 28.sp),
                                          backgroundColor: Colors.black,
                                          foregroundColor: Colors.white,
                                          side: BorderSide(
                                              color: customRegularGrey),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: null,
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          minimumSize: Size(150, 28.sp),
                                          backgroundColor: Colors.black,
                                          foregroundColor: Colors.white,
                                          side: BorderSide(
                                              color: customRegularGrey),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                        child: Text(
                                          "+ Surcharge",
                                          style: TextStyle(
                                            fontSize: 9.sp,
                                            fontFamily: 'UbuntuBold',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: null,
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          minimumSize: Size(150, 28.sp),
                                          backgroundColor: Colors.black,
                                          foregroundColor: Colors.white,
                                          side: BorderSide(
                                              color: customRegularGrey),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                        child: Text(
                                          "Split Payment",
                                          style: TextStyle(
                                            fontSize: 9.sp,
                                            fontFamily: 'UbuntuBold',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: () async {
                                          // _updateDiscount();
                                          // // widget.callBack.call();
                                          // await _discountList();
                                          await showDiscountDialog(
                                            context,
                                            discountController,
                                            1,
                                            subTotal: header.value?.subTotal,
                                            onSelect: (data) {
                                              if (data == null) {
                                                // Remove discount
                                                discountController
                                                    .removeSelectedDiscount();
                                                log("DISCDATA $data (discount removed)");
                                                setState(() {});
                                              } else {
                                                // Apply discount
                                                discountController
                                                    .selectDiscount(
                                                        data.masterDiscountID,
                                                        subtotal: header
                                                            .value?.subTotal
                                                            ?.toDouble());
                                                log("DISCDATA $data");
                                                setState(() {});
                                              }
                                            },
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          minimumSize: Size(150, 28.sp),
                                          backgroundColor: Colors.black,
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
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
                                  (header.value?.transactionType ?? '') ==
                                          'Delivery'
                                      ? Obx(() => Column(
                                            children:
                                                transactionCheckOutSMController
                                                    .transactionTypeJunc
                                                    .map((value) {
                                              return Column(
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      transactionCheckOutSMController
                                                              .isTransactionTypeJuncId
                                                              .value =
                                                          value
                                                              .transactionTypeJuncID;
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      elevation: 0,
                                                      minimumSize:
                                                          Size(150, 28.sp),
                                                      backgroundColor:
                                                          transactionCheckOutSMController
                                                                      .isTransactionTypeJuncId
                                                                      .value ==
                                                                  value
                                                                      .transactionTypeJuncID
                                                              ? primaryColor
                                                              : customRegularGrey,
                                                      foregroundColor:
                                                          Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      value.transJuncName,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'UbuntuBold',
                                                        fontSize: 8.sp,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                ],
                                              );
                                            }).toList(),
                                          ))
                                      : const SizedBox.shrink(),
                                ],
                              )
                            ],
                          );
                        }),
                        Expanded(
                          child: Obx(() {
                            final state =
                                transactionCheckOutSMController.status.value;

                            return state.isLoading
                                ? const SizedBox.shrink()
                                : PaymentMethodGrid(header: header.value);
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
                // :: Bagian Kanan - Panel Pesanan
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: customWhite1,
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 14,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Order #${(header.value?.transactionNumber ?? '').isNotEmpty ? (header.value?.transactionNumber ?? '').substring((header.value?.transactionNumber ?? '').length - 3) : "---"}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontFamily: 'UbuntuBold',
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 180.r,
                                  height: 40,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Text(
                                    customerId == 0
                                        ? "Guest"
                                        : header.value?.customerName ?? '---',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: 'UbuntuBold',
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // :: Cart list order

                        detail.isEmpty
                            ? Expanded(
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          "assets/images/errors/data-empty.png",
                                          width: size.height * 0.2,
                                          fit: BoxFit.cover),
                                      Text("No items added"),
                                    ],
                                  ),
                                ),
                              )
                            : Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 15),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                  ),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: detail.length,
                                    itemBuilder: (context, index) {
                                      final data = detail[index];

                                      return buildCartList(response: data);
                                    },
                                  ),
                                ),
                              ),
                        // :: Footer
                        // :: Footer
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 16, 16, 16),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Subtotal',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontFamily: "UbuntuBold",
                                            color: customHeadingText,
                                          ),
                                        ),
                                        Text(
                                          numberFormat('IDR',
                                                  header.value?.subTotal ?? 0)
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontFamily: "UbuntuBold",
                                            color: customHeadingText,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Discount',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontFamily: "UbuntuBold",
                                            color: customHeadingText,
                                          ),
                                        ),
                                        Obx(() => Text(
                                              numberFormat(
                                                      'IDR',
                                                      discountController
                                                          .discountValue.value)
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily: "UbuntuBold",
                                                color: customHeadingText,
                                              ),
                                            )),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'PPN',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontFamily: "UbuntuBold",
                                            color: customHeadingText,
                                          ),
                                        ),
                                        Obx(() {
                                          final ppnValue =
                                              transactionCheckOutSMController
                                                  .ppnDB.value;
                                          return Text(
                                            numberFormat('IDR', ppnValue ?? 0)
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontFamily: "UbuntuBold",
                                              color: customHeadingText,
                                            ),
                                          );
                                        }),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 0),
                                          child: Row(
                                            children: [
                                              Transform.scale(
                                                scale: 0.8,
                                                child: ValueListenableBuilder<
                                                    bool>(
                                                  valueListenable:
                                                      isCheckedRound,
                                                  builder: (context, value, _) {
                                                    return Checkbox(
                                                      value: value,
                                                      onChanged: (newValue) {
                                                        isCheckedRound.value =
                                                            newValue ?? false;

                                                        if (newValue == false) {
                                                          header.value = header.value?.copyWith(
                                                              grandTotalFinal: (header
                                                                          .value
                                                                          ?.grandTotalFinal ??
                                                                      0) -
                                                                  (header.value
                                                                          ?.rounding ??
                                                                      0));
                                                          header.value = header
                                                              .value
                                                              ?.copyWith(
                                                                  rounding: 0);
                                                        } else {
                                                          print('unchecked');
                                                          header.value = header.value?.copyWith(
                                                              rounding: (bulatkanKe500(header
                                                                          .value
                                                                          ?.grandTotalFinal ??
                                                                      0) -
                                                                  (header.value
                                                                          ?.grandTotalFinal ??
                                                                      0)));
                                                          header.value = header
                                                              .value
                                                              ?.copyWith(
                                                                  grandTotalFinal:
                                                                      bulatkanKe500(
                                                                          header.value?.grandTotalFinal ??
                                                                              0));
                                                        }
                                                      },
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                    );
                                                  },
                                                ),
                                              ),
                                              Text(
                                                'Rounding',
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontFamily: "UbuntuBold",
                                                  color: customHeadingText,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        ValueListenableBuilder<bool>(
                                          valueListenable: isCheckedRound,
                                          builder: (context, isChecked, _) {
                                            return Text(
                                              numberFormat(
                                                      'IDR',
                                                      !isChecked
                                                          ? 0
                                                          : header
                                                              .value?.rounding)
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontFamily: "UbuntuBold",
                                                color: primaryColor,
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total Due',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontFamily: "UbuntuBold",
                                            color: customHeadingText,
                                          ),
                                        ),
                                        Obx(() {
                                          final grandTotal =
                                              transactionCheckOutSMController
                                                  .grandTotalFinal.value;
                                          return ValueListenableBuilder<bool>(
                                            valueListenable: isCheckedRound,
                                            builder: (context, isChecked, _) {
                                              final total = !isChecked
                                                  ? (grandTotal ?? 0)
                                                  : transactionCheckOutSMController
                                                      .bulatkanKe500(
                                                          grandTotal ?? 0);
                                              return Text(
                                                numberFormat('IDR', total)
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontFamily: "UbuntuBold",
                                                  color: primaryColor,
                                                ),
                                              );
                                            },
                                          );
                                        }),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      alignment: Alignment.center,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          minimumSize: const Size(500, 0),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 14.h,
                                            horizontal: 20,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          backgroundColor: primaryColor,
                                        ),
                                        onPressed: () async {
                                          try {
                                            await transactionSMOrderController
                                                .handlePrintBill(
                                                    detail, header);
                                          } catch (e, stack) {
                                            debugPrint(
                                                "[ERROR] Exception in Print Bill button: $e\n$stack");
                                            if (mounted) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Error: ${e.toString()}"),
                                                backgroundColor: Colors.red,
                                              ));
                                            }
                                          }
                                        },
                                        child: Text(
                                          "Print Bill",
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            fontFamily: 'UbuntuBold',
                                            color: Colors.white,
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget buildCartList({required TransactionSMDetailData response}) {
    final price = response.menuPrice ?? 0;
    final qty = response.qty ?? 0;

    final total = price * qty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                response.menuName ?? '---',
                maxLines: 2,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontFamily: 'NanumGothic',
                  overflow: TextOverflow.ellipsis,
                  color: customHeadingText,
                ),
              ),
            ),
            Icon(
              Icons.lock,
              size: 18,
              color: customGrey2,
            ),
          ],
        ),
        SizedBox(height: 5.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 25,
                  color: Colors.white,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: Text(
                    "${response.qty}x",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'UbuntuBold',
                      color: customHeadingText,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                (response.discountDetail).isNotEmpty
                    ? Text(
                        numberFormat('IDR', total).toString(),
                        style: TextStyle(
                          fontSize: 8.sp,
                          fontFamily: 'NanumGothic',
                          color: customRed1,
                          decoration: TextDecoration.lineThrough,
                        ),
                      )
                    : const SizedBox.shrink(),
                SizedBox(width: 1.w),
                Text(
                  numberFormat('IDR', total).toString(),
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: 'UbuntuBold',
                    color: primaryColor,
                  ),
                ),
              ],
            )
          ],
        ),
        response.addOn.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var resAddon in response.addOn)
                    Container(
                      margin: EdgeInsets.only(top: 7.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 15,
                                  color: primaryColor,
                                ),
                                Flexible(
                                  child: Text(
                                    resAddon.menuName ?? '',
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 8.sp,
                                      fontFamily: 'NanumGothic',
                                      overflow: TextOverflow.ellipsis,
                                      color: customBodyText,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            numberFormat(
                                    'IDR',
                                    (resAddon.menuPrice ?? 0) *
                                        (resAddon.qty ?? 0))
                                .toString(),
                            style: TextStyle(
                              fontSize: 8.sp,
                              fontFamily: 'NanumGothic',
                              color: primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              )
            : const SizedBox.shrink(),
        (response.notes ?? "").isNotEmpty
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 7.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Notes : ${response.notes}",
                        style: TextStyle(
                          fontSize: 8.sp,
                          fontFamily: 'NanumGothic',
                          color: customHeadingText,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : const SizedBox.shrink(),
        SizedBox(height: 20.h)
      ],
    );
  }
}
