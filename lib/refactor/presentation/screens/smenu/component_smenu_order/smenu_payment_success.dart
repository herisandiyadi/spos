import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/models/transaction_smenu_detail/m_transaction_sm_detail.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_check_out.dart';
import 'package:squadra_pos/refactor/presentation/routes/app_routes.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';

class SMPaymentSuccessPage extends StatelessWidget {
  SMPaymentSuccessPage({super.key});

  final args = Get.arguments as Map<String, dynamic>;
  final localStorage = Get.find<LocalStorage>();
  final transactionCheckOutSMController =
      Get.find<TransactionCheckOutSMController>();

  @override
  Widget build(BuildContext context) {
    final Rxn<TransactionSMHeaderData> header = Rxn<TransactionSMHeaderData>();
    header.value = args['header'] as TransactionSMHeaderData;

    final detail = args['detail'] as List<TransactionSMDetailData>;
    final method = args['paymentMethod'];
    final ppn = Get.parameters['ppn'];
    final rounding = Get.parameters['rounding'];
    final grandtotalFinal = Get.parameters['grandTotalFinal'];
    final customerId =
        int.tryParse(header.value?.customerID ?? ''.toString()) ?? 0;

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                color: customWhite1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/primaryChecklist.png",
                        width: 200),
                    Text(
                      'Payment Successful',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "UbuntuBold",
                        color: customHeadingText,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Order Number: ${header.value?.transactionNumber ?? '---'}',
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontFamily: "NanumGothic",
                        color: customBodyText,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        minimumSize: Size(350, 60.h),
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () async {
                        await transactionCheckOutSMController
                            .handlePrintReceipt(
                                args, ppn, grandtotalFinal, rounding);
                      },
                      child: Text(
                        'Print Receipt',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontFamily: "UbuntuBold",
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        minimumSize: Size(350, 60.h),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () => Get.offAllNamed(RouteName.topNavigation),
                      child: Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontFamily: "UbuntuBold",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Order Number: ${header.value?.transactionNumber ?? '---'}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: "UbuntuBold",
                        color: customHeadingText,
                      ),
                    ),
                    SizedBox(height: 9.5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Close : -',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: "NanumGothic",
                              color: customHeadingText,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Customer Name : ${customerId == 0 ? "Guest" : header.value?.customerName ?? '---'}',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: "NanumGothic",
                              color: customHeadingText,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 9.5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Order Type : ${header.value?.transactionType ?? '---'}',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: "NanumGothic",
                              color: customHeadingText,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 9.5.h),
                    const Divider(),
                    SizedBox(height: 9.5.h),
                    SizedBox(
                      height: 300.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: detail.length,
                        itemBuilder: (context, index) {
                          final data = detail[index];

                          return buildCartList(response: data);
                        },
                      ),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: "UbuntuBold",
                            color: customHeadingText,
                          ),
                        ),
                        Text(
                          numberFormat('IDR', header.value?.subTotal ?? 0)
                              .toString(),
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: "UbuntuBold",
                            color: customHeadingText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'PPN',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: "UbuntuBold",
                            color: customHeadingText,
                          ),
                        ),
                        Text(
                          numberFormat('IDR', ppn ?? 0).toString(),
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: "UbuntuBold",
                            color: customHeadingText,
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text('Discount',
                    //       style: TextStyle(
                    //         fontSize: 10.sp,
                    //         fontFamily: "UbuntuBold",
                    //         color: customHeadingText,
                    //       ),
                    //     ),
                    //     Text(numberFormat('IDR', discountTotal).toString(),
                    //       style: TextStyle(
                    //         fontSize: 10.sp,
                    //         fontFamily: "UbuntuBold",
                    //         color: customHeadingText,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Round',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: "UbuntuBold",
                            color: customHeadingText,
                          ),
                        ),
                        Text(
                          numberFormat('IDR', rounding ?? 0).toString(),
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: "UbuntuBold",
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Grand Total',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: "UbuntuBold",
                            color: customHeadingText,
                          ),
                        ),
                        Text(
                          numberFormat('IDR', grandtotalFinal ?? 0).toString(),
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: "UbuntuBold",
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Due',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: "UbuntuBold",
                            color: customHeadingText,
                          ),
                        ),
                        Text(
                          numberFormat('IDR', 0).toString(),
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: "UbuntuBold",
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        method.first['method'] != 'Cash'
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Payment',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: "UbuntuBold",
                                      color: customHeadingText,
                                    ),
                                  ),
                                  Text(
                                    method.first['method'],
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: "UbuntuBold",
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    method.first['method'],
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: "UbuntuBold",
                                      color: customHeadingText,
                                    ),
                                  ),
                                  Text(
                                    numberFormat("IDR", method.first["pay"]),
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: "UbuntuBold",
                                      color: primaryColor,
                                    ),
                                  )
                                ],
                              ),
                        method.first['method'] == 'Cash'
                            ? const SizedBox(height: 10)
                            : const SizedBox.shrink(),
                        method.first['method'] == 'Cash'
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Change',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: "UbuntuBold",
                                      color: customHeadingText,
                                    ),
                                  ),
                                  Text(
                                    numberFormat(
                                        'IDR',
                                        (num.tryParse(method.first["pay"]) ??
                                                0) -
                                            (header.value?.grandTotalFinal ??
                                                0)),
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: "UbuntuBold",
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCartList({required TransactionSMDetailData response}) {
    final price = response.menuPrice ?? 0;
    final qty = response.qty ?? 0;

    final total = price * qty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  '${response.qty} x ${response.menuName}',
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: "NanumGothic",
                    color: customHeadingText,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  numberFormat('IDR', total).toString(),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: "UbuntuBold",
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        response.addOn.isNotEmpty
            ? SizedBox(
                height: 10.h,
              )
            : const SizedBox.shrink(),
        response.addOn.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final value in response.addOn)
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Row(
                              children: [
                                Icon(Icons.add,
                                    size: 9.sp, color: primaryColor),
                                Flexible(
                                  child: Text(
                                    value.menuName ?? '---',
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 10.sp,
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
                            numberFormat('IDR',
                                    (value.menuPrice ?? 0) * (value.qty ?? 0))
                                .toString(),
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontFamily: 'NanumGothic',
                              color: customHeadingText,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              )
            : const SizedBox.shrink(),
        (response.notes ?? '').isNotEmpty
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 2.h),
                  Text(
                    "Notes : ${response.notes ?? '---'}",
                    style: TextStyle(
                      fontSize: 9.sp,
                      fontFamily: 'NanumGothic',
                      color: customHeadingText,
                    ),
                  )
                ],
              )
            : const SizedBox.shrink(),
        SizedBox(height: 20.h)
      ],
    );
  }
}
