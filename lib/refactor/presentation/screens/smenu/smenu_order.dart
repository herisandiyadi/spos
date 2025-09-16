import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_menu/g_menu.dart';
import 'package:squadra_pos/refactor/data/models/transaction_smenu_detail/m_transaction_sm_detail.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_detail.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_order.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/request/c_create_transaction_sm.dart';
import 'package:squadra_pos/refactor/presentation/routes/app_routes.dart';
import 'package:squadra_pos/refactor/presentation/screens/smenu/component_smenu_order/smenu_item_description.dart';
import 'package:squadra_pos/refactor/presentation/screens/smenu/component_smenu_order/smenu_notes_description.dart';
import 'package:squadra_pos/refactor/presentation/widgets/internet_status_widget.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';
import 'package:squadra_pos/refactor/utils/exception/network.dart';

class SMOrderPage extends StatefulWidget {
  const SMOrderPage({super.key});

  @override
  State<SMOrderPage> createState() => _SMOrderPageState();
}

class _SMOrderPageState extends State<SMOrderPage> {
  final arguments = Get.arguments;
  final transactionSMOrderController = Get.find<TransactionOrderSMController>();
  final transactionDetailSMController =
      Get.find<TransactionDetailSMController>();
  final createTransactionSMController =
      Get.find<CreateTransactionSMController>();
  // final RxList<TransactionSMDetailData> transactionDetailList;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      transactionDetailSMController.getTransactionSMHeaderCall(
          number: arguments["unique_number"]);
      transactionDetailSMController.getTransactionSMDetailCall(
          number: arguments["unique_number"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    log("SM ORDER ${transactionDetailSMController
        .transactionSMHeaderData.value?.transactionNumber}");
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: customWhite1,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: primaryColor,
          title: Row(
            children: [
              Image.asset("assets/images/logoTextVert.png", height: 40.r),
              Obx(() {
                return Text(
                  " | ${transactionSMOrderController.isOutletName.value}",
                  style: const TextStyle(
                    fontSize: 21,
                    fontFamily: "UbuntuBold",
                    color: Colors.white,
                  ),
                );
              }),
            ],
          ),
          actions: [
            InternetStatusWidget(),
            Container(
                margin: EdgeInsets.only(right: 10.w),
                alignment: Alignment.center,
                child: Obx(() {
                  return Text(
                    transactionSMOrderController.isStaffName.value,
                    style: const TextStyle(
                      fontSize: 21,
                      fontFamily: "UbuntuBold",
                      color: Colors.white,
                    ),
                  );
                })),
          ],
        ),
        body: Row(
          children: [
            Expanded(
              flex: 5,
              child: PageView(
                controller: transactionSMOrderController.pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  transactionSMOrderController.isCurrentIndex.value = index;
                },
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        height: 60,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 14,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  onChanged: (value) {
                                    transactionSMOrderController
                                        .getMenuFiltered(value: value);
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    hintText: "Search for item",
                                    fillColor: customDarkGrey,
                                    hintStyle: TextStyle(
                                      fontSize: 9.sp,
                                      fontFamily: 'NanumGothic',
                                      color: customBodyText,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: customHeadingText,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 15.h,
                                    horizontal: 20.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Obx(() {
                                    final state = transactionDetailSMController
                                        .statusHeader.value;
                                    final header = transactionDetailSMController
                                        .transactionSMHeaderData;

                                    if (state.isLoading) {
                                      return Shimmer.fromColors(
                                        baseColor: Colors.grey.shade300,
                                        highlightColor: Colors.grey.shade100,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 30.r,
                                              height: 30.r,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            SizedBox(width: 10.r),
                                            Container(
                                              width: 80.r,
                                              height: 15.r,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                    return Row(
                                      children: [
                                        Icon(
                                          header.value?.transactionType ==
                                                  'Dine In'
                                              ? Icons.house
                                              : Icons.shopping_bag,
                                          size: 30.r,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 10.r),
                                        Text(
                                          header.value?.transactionType ==
                                                  'Dine In'
                                              ? '${header.value?.tableLabel}'
                                              : '${header.value?.tableLabel}',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.white,
                                            fontFamily: 'UbuntuBold',
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                        child: SizedBox(
                          height: 60.h,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 0,
                            ),
                            child: Obx(() {
                              return ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  buildCategoryTab(context, 'All', 0),
                                  ...transactionSMOrderController.categoriesList
                                      .map((response) => buildCategoryTab(
                                          context,
                                          response.categoryName,
                                          response.categoryID)),
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                      // :: Daftar Item
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Obx(() {
                            final data =
                                transactionSMOrderController.menuFilter;

                            return GridView.builder(
                              padding: const EdgeInsets.all(8.0),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                crossAxisSpacing: 5.w,
                                mainAxisSpacing: 20.h,
                                childAspectRatio: 0.80,
                              ),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return buildMenuItem(menu: data[index]);
                              },
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Bagian Kanan - Panel Pesanan
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
                              child: Obx(() {
                                final state = transactionDetailSMController
                                    .statusHeader.value;
                                final header = transactionDetailSMController
                                    .transactionSMHeaderData;

                                if (state.isLoading) {
                                  return Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                      width: 100.r,
                                      height: 30.r,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                    ),
                                  );
                                }

                                return Text(
                                  "Order #${(header.value?.transactionNumber ?? '').isNotEmpty ? (header.value?.transactionNumber ?? '').substring((header.value?.transactionNumber ?? '').length - 3) : "---"}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontFamily: 'UbuntuBold',
                                  ),
                                );
                              }),
                            ),
                            SizedBox(width: 10),
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: Obx(() {
                                final state = transactionDetailSMController
                                    .statusHeader.value;

                                if (state.isLoading)
                                  return buildQRShimmerButton();
                                if (state.isError)
                                  return const SizedBox.shrink();

                                final header = transactionDetailSMController
                                    .transactionSMHeaderData;

                                int tableNumber = int.tryParse(
                                        header.value?.tableNumber ?? '') ??
                                    0;

                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.zero,
                                    backgroundColor: primaryColor,
                                  ),
                                  onPressed: () {
                                    createTransactionSMController
                                        .printQRTableHandle(
                                            header.value?.urlQRCode ?? '---',
                                            header.value?.tableLabel ?? '---',
                                            tableNumber,
                                            false);
                                  },
                                  child: Icon(Icons.qr_code,
                                      color: Colors.white, size: 20),
                                );
                              }),
                            ),
                            Container(
                                width: 180.r,
                                height: 45,
                                alignment: Alignment.center,
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Obx(() {
                                  final state = transactionDetailSMController
                                      .statusHeader.value;
                                  final header = transactionDetailSMController
                                      .transactionSMHeaderData;

                                  if (state.isLoading) {
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.grey.shade100,
                                      child: Container(
                                        width: 100.r,
                                        height: 20.r,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                      ),
                                    );
                                  }

                                  return Text(
                                    int.tryParse(header.value?.customerID ??
                                                ''.toString()) ==
                                            0
                                        ? "Guest"
                                        : header.value?.customerName ?? '',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: 'UbuntuBold',
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                    ),
                                  );
                                })),
                          ],
                        ),
                      ),
                    ),

                    // :: Cart list order
                    Obx(() {
                      final state =
                          transactionDetailSMController.statusDetail.value;

                      if (state.isLoading) {
                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 16.0,
                            ),
                            child: buildCartListShimmer(),
                          ),
                        );
                      }
                      if (state.isError) {
                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: NetworkExceptionHandling(
                              exception: state.errorMessage ?? '',
                              refresh: () {
                                transactionDetailSMController.rebuild(
                                    uniqueNumber: arguments["unique_number"]);
                              },
                            ),
                          ),
                        );
                      }

                      final data =
                          transactionDetailSMController.transactionSMDetailList;

                      if (data.isEmpty) {
                        return Expanded(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                        );
                      } else {
                        return Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 15),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                final detail = data[index];

                                return _buildCartList(response: detail);
                              },
                            ),
                          ),
                        );
                      }
                    }),

                    // :: Footer
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 8.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15.h,
                                        horizontal: 20,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      side: BorderSide(
                                        width: 2,
                                        color: customRegularGrey,
                                      ),
                                      backgroundColor: Colors.white,
                                      foregroundColor: customBodyText),
                                  onPressed: () async {
                                    await transactionSMOrderController
                                        .clearItemCall(
                                            cartId:
                                                transactionDetailSMController
                                                    .cartId.value,
                                            uniqueNumber:
                                                arguments["unique_number"]);
                                  },
                                  child: Text(
                                    "Clear",
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: 'UbuntuBold',
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 15.h,
                                      horizontal: 20,
                                    ),
                                    backgroundColor: Colors.white,
                                    foregroundColor: customBodyText,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    side: BorderSide(
                                      width: 2,
                                      color: customRegularGrey,
                                    ),
                                  ),
                                  onPressed: () =>
                                      Get.offAllNamed(RouteName.topNavigation),
                                  child: Text(
                                    "Hold",
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: 'UbuntuBold',
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(child: Obx(() {
                                final header = transactionDetailSMController
                                    .transactionSMHeaderData;
                                final transactionDetailList =
                                    transactionDetailSMController
                                        .transactionSMDetailList;
                                List<dynamic> details = transactionDetailList
                                    .where((item) => item.printKitchen == 0)
                                    .toList();

                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 15.h,
                                      horizontal: 20,
                                    ),
                                    backgroundColor: primaryColor,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    side: BorderSide(
                                      width: 2,
                                      color: details.isEmpty
                                          ? customRegularGrey
                                          : primaryColor,
                                    ),
                                  ),
                                  onPressed: details.isEmpty
                                      ? () {
                                          _printConfirmDialog(
                                              header, transactionDetailList);
                                        }
                                      : () async {
                                          await transactionSMOrderController
                                              .sendOrderCall(
                                                  rePrint: 0,
                                                  cartID:
                                                      transactionDetailSMController
                                                          .cartId.value,
                                                  header: header,
                                                  detail: details);

                                          // transactionDetailSMController
                                          //     .getTransactionSMDetailCall(
                                          //         number: header.value
                                          //                 ?.uniqueNumber ??
                                          //             0);

                                          transactionDetailSMController
                                              .transactionSMDetailList
                                              .refresh();
                                        },
                                  child: Text(
                                    "Send",
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: 'UbuntuBold',
                                    ),
                                  ),
                                );
                              })),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Obx(() {
                                    final status = transactionDetailSMController
                                        .isPrintBill.value;

                                    return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        padding: EdgeInsets.all(18.h),
                                        shape: const CircleBorder(),
                                        backgroundColor: Colors.white,
                                        side: BorderSide(
                                          width: 2,
                                          color: !status
                                              ? customRegularGrey
                                              : primaryColor,
                                        ),
                                      ),
                                      onPressed: !status
                                          ? null
                                          : () async {
                                              transactionSMOrderController.handlePrintBill(
                                                  transactionDetailSMController
                                                      .transactionSMDetailList,
                                                  transactionDetailSMController
                                                      .transactionSMFooterData);
                                            },
                                      child: Icon(
                                        Icons.receipt_long,
                                        size: 28.r,
                                        color: !status
                                            ? customRegularGrey
                                            : primaryColor,
                                      ),
                                    );
                                  })),
                              SizedBox(width: 3.w),
                              Expanded(
                                child: Obx(() {
                                  final footer = transactionDetailSMController
                                      .transactionSMFooterData;
                                  final transactionDetailList =
                                      transactionDetailSMController
                                          .transactionSMDetailList;
                                  List<dynamic> details = transactionDetailList
                                      .where((item) => item.printKitchen == 0)
                                      .toList();
                                  return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15.h,
                                        horizontal: 20,
                                      ),
                                      backgroundColor: primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      side: BorderSide(
                                        width: 2,
                                        color: transactionDetailList.isEmpty ||
                                                transactionSMOrderController
                                                    .isWaiters.value
                                            ? customRegularGrey
                                            : primaryColor,
                                      ),
                                    ),
                                    onPressed: transactionDetailList.isEmpty
                                        ? null
                                        : transactionSMOrderController
                                                .isWaiters.value
                                            ? null
                                            : () async {
                                                if (details.isNotEmpty) {
                                                  await transactionSMOrderController
                                                      .sendOrderCall(
                                                          rePrint: 0,
                                                          cartID:
                                                              transactionDetailSMController
                                                                  .cartId.value,
                                                          header: transactionDetailSMController
                                                              .transactionSMHeaderData,
                                                          detail: details);
                                                  await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 500),
                                                  );
                                                }
                                                Get.toNamed(
                                                  RouteName.checkOutSM,
                                                  arguments: {
                                                    'transactionNumber':
                                                        transactionDetailSMController
                                                            .transactionSMHeaderData
                                                            .value
                                                            ?.transactionNumber,
                                                    'cart_id':
                                                        transactionDetailSMController
                                                            .cartId.value,
                                                    'staff_name':
                                                        transactionSMOrderController
                                                            .isStaffName.value,
                                                    'outlet_name':
                                                        transactionSMOrderController
                                                            .isOutletName.value,
                                                    'header':
                                                        transactionDetailSMController
                                                            .transactionSMFooterData
                                                            .value,
                                                    'detail':
                                                        transactionDetailSMController
                                                            .transactionSMDetailList
                                                            .toList(),
                                                  },
                                                );
                                              },
                                    child: Text(
                                      "Pay • ${numberFormat('IDR', footer.value?.grandTotalFinal ?? 0).toString()}",
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontFamily: 'UbuntuBold',
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
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

  Widget buildCategoryTab(BuildContext context, String title, int id) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => transactionSMOrderController.handleTabCategory(id: id),
      child: Obx(() {
        bool active = transactionSMOrderController.isSelectCategory.value == id;

        return Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            color: active ? primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              width: 2,
              color: customRegularGrey,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() {
                final outletId = transactionSMOrderController.isOutletId.value;
                final pathImage =
                    transactionSMOrderController.categoryImagePath[id];
                final fileExists =
                    pathImage != null && File(pathImage).existsSync();

                return outletId != 0
                    ? id == 0
                        ? Container(
                            width: 55.r,
                            height: 55.r,
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset('assets/images/AppIcon.png',
                                  width: size.width * 0.1),
                            ))
                        : fileExists
                            ? Container(
                                width: 55.r,
                                height: 55.r,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: FileImage(File(pathImage)),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(
                                width: 55.r,
                                height: 55.r,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  title[0].toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.grey.shade800,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                    : const SizedBox.shrink();
              }),
              SizedBox(width: 10.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 9.5.sp,
                  fontFamily: "UbuntuBold",
                  color: active ? Colors.white : customHeadingText,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildMenuItem({required MenuLiteModel menu}) {
    return GestureDetector(
      onTap: () {
        transactionSMOrderController.resetItems();

        showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return SMItemDescription(data: menu, transaction: arguments);
            });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Obx(() {
                final pathImage =
                    transactionSMOrderController.menuImagePath[menu.menuID];
                final fileExists =
                    pathImage != null && File(pathImage).existsSync();

                return fileExists
                    ? Image.file(
                        File(pathImage),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )
                    : Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          menu.menuName,
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "UbuntuBold",
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800),
                          textAlign: TextAlign.center,
                        ));
              }),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            menu.menuName,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'UbuntuBold',
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Text(
            numberFormat('IDR', menu.menuPrice).toString(),
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'UbuntuBold',
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartList({required TransactionSMDetailData response}) {
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
            response.sendOrder == 0
                ? InkWell(
                    onTap: () async {
                      await transactionSMOrderController.removeItemCall(
                          cartDetailId: response.cartDetailID ?? 0,
                          uniqueNumber: arguments["unique_number"]);
                    },
                    child: Container(
                      padding: EdgeInsets.all(2.r),
                      child: const Icon(
                        Icons.close,
                        size: 17,
                        color: Colors.black,
                      ),
                    ),
                  )
                : Icon(
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
                GestureDetector(
                  onTap: (response.sendOrder ?? 0) > 0
                      ? null
                      : () {
                          transactionSMOrderController.updateDecrementQtyItem(
                              cartDetailId: response.cartDetailID ?? 0,
                              uniqueNumber: arguments["unique_number"],
                              notes: response.notes);
                        },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color:
                          response.sendOrder == 0 ? Colors.white : customGrey2,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 1,
                        color: response.sendOrder == 0
                            ? customRegularGrey
                            : customGrey2,
                      ),
                    ),
                    child: Icon(Icons.remove,
                        size: 15,
                        color: response.sendOrder == 0
                            ? Colors.black
                            : Colors.white),
                  ),
                ),
                Container(
                  width: 25,
                  color: Colors.white,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: Text(
                    response.qty.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'UbuntuBold',
                      color: customHeadingText,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (response.sendOrder ?? 0) > 0
                      ? null
                      : () {
                          transactionSMOrderController.updateIncrementQty(
                              cartDetailId: response.cartDetailID ?? 0,
                              uniqueNumber: arguments["unique_number"],
                              notes: response.notes);
                        },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color:
                          response.sendOrder == 0 ? primaryColor : customGrey2,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 1,
                        color: response.sendOrder == 0
                            ? primaryColor
                            : customGrey2,
                        // customGrey2
                      ),
                    ),
                    child: const Icon(Icons.add, size: 15, color: Colors.white),
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
                      InkWell(
                        onTap: () async {
                          transactionSMOrderController.notesController.clear();

                          return showDialog<void>(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return SMNotesDescription(
                                    cartDetailId: response.cartDetailID ?? 0,
                                    uniqueNumber: arguments["unique_number"],
                                    notes: response.notes,
                                    qty: response.qty ?? 0);
                              });
                        },
                        child: Icon(Icons.create_rounded,
                            size: 18.0, color: customHeadingText),
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

  Widget buildCartListShimmer() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 200,
              height: 16,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
            ),
          ),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade300,
            ),
          ),
        ],
      ),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: List.generate(
                3,
                (i) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                    )),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 60,
              height: 14,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
            ),
          ),
        ],
      ),
      SizedBox(height: 10),
      Row(
        children: [
          Icon(Icons.add, size: 15, color: Colors.grey.shade400),
          SizedBox(width: 5),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 100,
              height: 12,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
            ),
          ),
        ],
      ),
      SizedBox(height: 10),
    ]);
  }

  Widget buildQRShimmerButton() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: 40, // atau sesuaikan dengan icon size + padding
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade300,
        ),
      ),
    );
  }

  Future<void> _printConfirmDialog(header, transactionDetailList) async {
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
                    "Resend Order ?",
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
                        await transactionSMOrderController.printDockets(
                            1, header, transactionDetailList);

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
}
