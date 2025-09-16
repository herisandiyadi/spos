import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction/g_transaction.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction_detail/g_transaction_detail.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/presentation/controllers/auto_print_controller.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/c_order_offline.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/c_print_receipt_offline.dart';
import 'package:squadra_pos/refactor/presentation/routes/app_routes.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage>
    with SingleTickerProviderStateMixin {
  final arguments = Get.arguments;
  final localStorage = Get.find<LocalStorage>();
  final _printReceiptController = Get.find<PrintReceiptOfflineController>();
  final transactionOrderOfflineController = Get.find<OrderOfflineController>();
  // final _checkOutOfflineController = Get.find<CheckOutOfflineController>();

  late AnimationController _controller;

  final dbHelper = DatabaseHelper();

  var transaction = <TransactionLiteModel>[];
  var transactionDetail = <TransactionDetailLiteModel>[];

  String dateNow = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String timeNow = DateFormat("HH:mm:ss").format(DateTime.now());

  int outletID = 0;

  int bulatkanKe500(int harga) {
    return ((harga + 499) ~/ 500) * 500;
  }

  Future<void> getTransactionDetailLite() async {
    final result = await dbHelper.getTransactionDetail(
        transactionNumber: arguments["transaction_number"]);

    if (!mounted) return;
    setState(() {
      transactionDetail = result
          .map((model) => TransactionDetailLiteModel.fromJson(model))
          .toList();
    });

    for (var i = 0; i < transactionDetail.length; i++) {
      final addOn = await dbHelper
          .getTransactionDetailAddOn(transactionDetail[i].transactionDetailID);

      transactionDetail[i] = transactionDetail[i].copyWith(addOn: addOn);
    }

    if (!mounted) return;
    setState(() {
      transactionDetail = List.from(transactionDetail);
    });
  }

  Future<Map<String, dynamic>> fetchTransaction() async {
    final result = await dbHelper.getTransSpec(
        transactionNumber: arguments["transaction_number"]);

    setState(() {
      result.map((model) => TransactionLiteModel.fromJson(model)).toList();
      transaction =
          result.map((model) => TransactionLiteModel.fromJson(model)).toList();
    });
    // print('DATA  EUY : ${result.first}');
    return result.first;
  }

  void getOutletID() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      outletID = prefs.getInt("outletID")!;
    });
  }

  @override
  void initState() {
    super.initState();

    getOutletID();
    getTransactionDetailLite();
    autoPrint();

    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        onLottieComplete();
      }
    });
  }

  void onLottieComplete() {
    debugPrint("Lottie animation completed!");
    // Lakukan sesuatu di sini
  }

  void autoPrint() {
    final autoPrintController = Get.find<AutoPrintController>();
    if (autoPrintController.isAutoPrint.value) {
      printFunction();
      onLottieComplete();
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchTransaction(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final customerName = snapshot.data?['customerName'] ?? '';
            final transNumber = snapshot.data?['transactionNumber'] ?? '';
            final statusReceipt = snapshot.data?['statusReceipt'] ?? 0;
            final paymentMethod =
                jsonDecode(snapshot.data?['paymentMethod'] ?? '[]');
            final subTotal = snapshot.data?['subTotal'] ?? '';
            // final discountOnDetail = jsonDecode(snapshot.data?["discountOnDetail"] ?? '[]');
            final discountTotal = snapshot.data?['discountTotal'] ?? '';
            final grandTotalBeforeTax =
                snapshot.data?['grandTotalBeforeTax'] ?? '';
            final ppn = snapshot.data?['ppn'] ?? '';
            final ppnName = snapshot.data?['ppnName'] ?? '';
            final statsTrans = snapshot.data?['statusTransaction'] == 'Close'
                ? 'CLOSED'
                : 'VOID';

            final rounding = snapshot.data?['rounding'] ?? '';
            final grandTotalFinal = snapshot.data?['grandTotalFinal'] ?? '';
            final guestNumber = snapshot.data?['guestNumber'] ?? '';
            final transactionType = snapshot.data?['transactionType'] ?? '';
            return Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                    color: customWhite1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image.asset("assets/images/primaryChecklist.png", width: 200),
                        Lottie.asset(
                          'assets/animations/payment-success.json',
                          controller: _controller,
                          onLoaded: (composition) {
                            _controller
                              ..duration = composition.duration
                              ..repeat();
                          },
                          width: size.height * 0.3,
                          height: size.height * 0.3,
                          repeat: true,
                        ),
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
                          'Order Number: ${arguments["transaction_number"]} [${statsTrans}]',
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
                            if (statusReceipt == 1) {
                              _printConfirmDialog();
                            } else {
                              final primaryPrinter =
                                  await localStorage.getPrimaryPrinter();

                              if (primaryPrinter.first == 'BluetoothPrinter') {
                                _printReceiptController.printReceiptBluetooth(
                                    transaction: transaction,
                                    transactionDetail: transactionDetail);
                                await Future.delayed(
                                  const Duration(milliseconds: 500),
                                );
                              } else {
                                _printReceiptController.printReceiptLan(
                                    transaction: transaction,
                                    transactionDetail: transactionDetail,
                                    printerIP: primaryPrinter[1]);
                                await Future.delayed(
                                  const Duration(milliseconds: 500),
                                );
                              }
                            }
                            await Future.delayed(
                              const Duration(milliseconds: 500),
                            );
                            await dbHelper
                                .updateTransactionReceipt(transNumber);
                            fetchTransaction();
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
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () {
                            if (arguments["refresh"]) {
                              Get.offAllNamed(RouteName.topNavigation);
                            } else {
                              Get.back();
                            }
                          },
                          child: Text(
                            'Done',
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontFamily: "UbuntuBold",
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
                          'Order Number: ${arguments["transaction_number"]} [${statsTrans}]',
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
                                'Customer Name : $customerName',
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
                                'Order Type : $transactionType',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontFamily: "NanumGothic",
                                  color: customHeadingText,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Guest : $guestNumber',
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
                            itemCount: transactionDetail.length,
                            itemBuilder: (context, index) {
                              return cartList(transactionDetail[index]);
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
                              numberFormat('IDR', subTotal),
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
                              'Discount',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: "UbuntuBold",
                                color: customHeadingText,
                              ),
                            ),
                            Text(
                              numberFormat('IDR', discountTotal).toString(),
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: "UbuntuBold",
                                color: customHeadingText,
                              ),
                            ),
                          ],
                        ),
                        ppn > 0
                            ? Column(
                                children: [
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total Before Tax',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: "UbuntuBold",
                                          color: customHeadingText,
                                        ),
                                      ),
                                      Text(
                                        numberFormat('IDR', grandTotalBeforeTax)
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ppnName,
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: "UbuntuBold",
                                          color: customHeadingText,
                                        ),
                                      ),
                                      Text(
                                        numberFormat('IDR', ppn).toString(),
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: "UbuntuBold",
                                          color: customHeadingText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
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
                              numberFormat('IDR', rounding).toString(),
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
                              numberFormat('IDR', grandTotalFinal),
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
                        for (final data in paymentMethod)
                          Column(
                            children: [
                              data['method'] != 'Cash'
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
                                          data['method'],
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
                                          data['method'].toString(),
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            fontFamily: "UbuntuBold",
                                            color: customHeadingText,
                                          ),
                                        ),
                                        Text(
                                          numberFormat("IDR", data["pay"])
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: "UbuntuBold",
                                            color: primaryColor,
                                          ),
                                        )
                                      ],
                                    ),
                              data['method'] == 'Cash'
                                  ? const SizedBox(
                                      height: 10,
                                    )
                                  : const SizedBox.shrink(),
                              data['method'] == 'Cash'
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
                                          numberFormat('IDR',
                                                  data["pay"] - grandTotalFinal)
                                              .toString(),
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
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                strokeCap: StrokeCap.round,
                valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
              ),
            );
          }
        },
      ),
    );
  }

  Future<void> printFunction() async {
    final primaryPrinter = await localStorage.getPrimaryPrinter();
    log("PRINT AUTOMATIC");
    if (primaryPrinter.first == 'BluetoothPrinter') {
      _printReceiptController.printReceiptBluetooth(
          transaction: transaction, transactionDetail: transactionDetail);
      await Future.delayed(
        const Duration(milliseconds: 500),
      );
    } else {
      _printReceiptController.printReceiptLan(
          transaction: transaction,
          transactionDetail: transactionDetail,
          printerIP: primaryPrinter[1]);
      await Future.delayed(
        const Duration(milliseconds: 500),
      );
    }
  }

  Future<void> _printConfirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(
                  color: customBlue1,
                ),
              ),
              backgroundColor: Colors.white,
              titlePadding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              insetPadding: const EdgeInsets.all(15),
              contentPadding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              actionsPadding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
              content: SingleChildScrollView(
                child: Center(
                  child: Text(
                    "Reprint Receipt ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: customHeadingText,
                      fontSize: 14.sp,
                      fontFamily: "NanumGothic",
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        minimumSize: const Size(80, 50),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        side: BorderSide(
                          width: 2,
                          color: customRegularGrey,
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "UbuntuBold",
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        minimumSize: const Size(80, 50),
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () async {
                        final primaryPrinter =
                            await localStorage.getPrimaryPrinter();

                        if (primaryPrinter.first == 'BluetoothPrinter') {
                          _printReceiptController.printReceiptBluetooth(
                              transaction: transaction,
                              transactionDetail: transactionDetail);
                          await Future.delayed(
                            const Duration(milliseconds: 500),
                          );
                        } else {
                          _printReceiptController.printReceiptLan(
                              transaction: transaction,
                              transactionDetail: transactionDetail,
                              printerIP: primaryPrinter[1]);
                          await Future.delayed(
                            const Duration(milliseconds: 500),
                          );
                        }

                        Get.back();
                      },
                      child: Text(
                        "Send",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "UbuntuBold",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  Column cartList(TransactionDetailLiteModel detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                // flex: 2,
                child: Text(
                  '${detail.qty} x ${detail.menuName}',
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
                // flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    detail.discountDetail.isNotEmpty
                        ? Text(
                            numberFormat('IDR', detail.menuPrice * detail.qty),
                            style: TextStyle(
                              fontSize: 8.sp,
                              fontFamily: 'NanumGothic',
                              color: customRed1,
                              decoration: TextDecoration.lineThrough,
                            ),
                          )
                        : const SizedBox.shrink(),
                    Text(
                      numberFormat(' IDR',
                              detail.menuPriceAfterDiscount * detail.qty)
                          .toString(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontFamily: "UbuntuBold",
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        detail.addOn.isNotEmpty
            ? SizedBox(
                height: 10.h,
              )
            : const SizedBox.shrink(),
        detail.addOn.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var resAddon in detail.addOn)
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
                                    resAddon['menuName'],
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
                            numberFormat(
                                    'IDR', resAddon['menuPrice'] * detail.qty)
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
        detail.noteOption.isNotEmpty
            ? SizedBox(
                height: 2.h,
              )
            : const SizedBox.shrink(),
        detail.noteOption.isNotEmpty
            ? Text(
                "Note : ${detail.noteOption.toString()}",
                style: TextStyle(
                  fontSize: 9.sp,
                  fontFamily: 'NanumGothic',
                  color: customHeadingText,
                ),
              )
            : const SizedBox.shrink(),
        detail.notes.isNotEmpty
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 2.h),
                  Text(
                    "Notes : ${detail.notes}",
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
