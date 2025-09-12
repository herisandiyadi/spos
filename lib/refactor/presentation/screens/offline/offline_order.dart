import 'dart:convert';
import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recase/recase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:squadra_pos/Printer/print_bluetooth.dart';
import 'package:squadra_pos/Printer/print_lan.dart';
import 'package:squadra_pos/pos/checkout_page.dart';
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/create/c_transaction_detail_lite.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_city/g_city.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_customer/g_customer.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_discount/g_discount.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_province/g_province.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_station/g_station.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_tax/g_tax.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction/g_transaction.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction_detail/g_transaction_detail.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/c_order_offline.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/c_print_bill_offline.dart';
import 'package:squadra_pos/refactor/presentation/routes/app_routes.dart';
import 'package:squadra_pos/refactor/presentation/widgets/internet_status_widget.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:squadra_pos/refactor/utils/formatter_date.dart';

class OfflineOrderPage extends StatefulWidget {
  const OfflineOrderPage({super.key});

  @override
  State<OfflineOrderPage> createState() => _OfflineOrderPageState();
}

class _OfflineOrderPageState extends State<OfflineOrderPage> {
  final arguments = Get.arguments;
  final localStorage = Get.find<LocalStorage>();

  final _orderOfflineController = Get.find<OrderOfflineController>();
  final _printBillOfflineController = Get.find<PrintBillOfflineController>();

  final dbHelper = DatabaseHelper();
  final pageController = PageController();

  String isTransactionNumber = '';

  int selectedProvince = 0;
  int selectedCity = 0;
  // int selectedCategoryID = 0;

  bool validateFullName = false;

  bool provinceLoading = false;
  bool cityLoading = false;
  bool checkoutPage = false;

  final List<Map<String, String>> items = [];

  final searchCustomerController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNoController = TextEditingController();
  final birthDateController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
  final notesController = TextEditingController();

  final notesFocusNode = FocusNode();

  var transactionOpen = <TransactionLiteModel>[];
  var transactionSelected = <TransactionLiteModel>[];
  var transactionDetailList = <TransactionDetailLiteModel>[];
  var transactionDetailUnsend = <TransactionDetailLiteModel>[];
  var transactionDetailSend = <TransactionDetailLiteModel>[];
  var cityList = <CityLiteModel>[];
  var provinceList = <ProvinceLiteModel>[];
  var discountList = <DiscountLiteModel>[];

  var customers = <CustomerLiteModel>[];
  var stations = <StationLiteModel>[];

  bool tableMap = false;
  bool isWaiters = false;
  bool isAdmin = false;

  String customerName = '';
  String tableLabel = '';
  String staffName = '';
  String outletName = '';
  String iosDocumentPath = '';
  int transactionDetaiSendcount = 0;
  int selectedNoteIndex = -1;
  int selectedAddonID = -1;

  List<int> selectedAddonIDs = [];

  Map<String, dynamic> selectedAddonPerCategory = {};

  num subTotal = 0;
  num discountTotals = 0;
  num grandTotalBeforeTax = 0;
  num tax = 0;
  // double taxSettings = 0;
  // String taxName = '';
  num totalTrans = 0;
  int outletID = 0;

  int qtyItemDetail = 1;
  int currentPageIndex = 0;

  String customerCode = '';
  String outletType = '';

  bool tblLoading = true;
  bool custCodeLoading = true;
  String ipAddress = '';
  String deviceName = '';
  late Future fetchTransDataCountFromDetail;

  int bulatkanKe500(int harga) {
    return ((harga + 499) ~/ 500) * 500;
  }

  Future<void> getDeviceInfo() async {
    final info = NetworkInfo();
    final deviceInfoPlugin = DeviceInfoPlugin();

    // Ambil IP Address
    String? ip = await info.getWifiIP();

    // Ambil Device Name
    String? name;
    if (Platform.isAndroid) {
      var androidInfo = await deviceInfoPlugin.androidInfo;
      name = "${androidInfo.manufacturer} ${androidInfo.model}";
    } else if (Platform.isIOS) {
      var iosInfo = await deviceInfoPlugin.iosInfo;
      name = iosInfo.name; // Nama device iPhone/iPad
    } else {
      name = "Unknown Device";
    }
    setState(() {
      ipAddress = ip ?? 'Tidak terdeteksi';
      deviceName = name ?? 'Tidak terdeteksi';
    });
  }

  void _callBack() async {
    await _getTransactionByTrx(trx: isTransactionNumber);
    fetchTransDataCountFromDetail = _fetchTransactionDataCountFromDetail();
  }

  void _callBackDispose() async {
    // await _getDiscount();
    await _getTransactionByTrx(trx: isTransactionNumber);
  }

  void _navigateToPage(int pageIndex) {
    setState(() {
      currentPageIndex = pageIndex;
      pageController.jumpToPage(pageIndex);
    });
  }

  Future<void> _getProvince() async {
    final result = await dbHelper.getProvince();

    if (!mounted) return;
    setState(() {
      provinceList = result;
    });
  }

  Future<void> _getCity({required int id}) async {
    final result = await dbHelper.getCity();

    if (!mounted) return;
    setState(() {
      cityList = result;
    });
  }

  Future<void> _initPaths() async {
    if (Platform.isIOS) {
      final dir = await getApplicationDocumentsDirectory();

      setState(() {
        iosDocumentPath = dir.path;
      });
    }
  }

  Future<void> _getTransactionByTrx({required String trx}) async {
    if (!mounted) return;
    setState(() {
      isTransactionNumber = trx;
    });

    final result = await dbHelper.getTransSpec(transactionNumber: trx);
    final transactionList =
        result.map((model) => TransactionLiteModel.fromJson(model)).toList();

    if (transactionList.isEmpty) return;

    if (!mounted) return;
    setState(() {
      customerName = transactionList.first.customerName ?? '';
      tableLabel = transactionList.first.tableLabel ?? '';

      if (transactionList.first.tableID > 0) {
        tableMap = true;
      } else {
        tableMap = false;
      }
    });

    _orderOfflineController.selectedTable.value = transactionList.first.tableID;

    await _getTransactionOpen();
    await _getTransactionDetail(
        discountTotalHeader: transactionList.first.discountTotal);

    _countTotal();
    print('tes :${transactionList.first}');
  }

  Future<void> _getTransactionDetail({int? discountTotalHeader}) async {
    debugPrint("presentation>screens>offline>offline_order page");
    // :: Fetch raw data from DB
    final rawDetails = await dbHelper.getTransactionDetail(
        transactionNumber: isTransactionNumber);
    final details =
        rawDetails.map(TransactionDetailLiteModel.fromJson).toList();

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

    if (!mounted) return;
    transactionDetailSend =
        details.where((item) => item.statusSend == 1).toList();
    setState(() {
      transactionDetailList = List.from(details);
      transactionDetailUnsend =
          details.where((item) => item.statusSend == 0).toList();
      transactionDetaiSendcount = transactionDetailSend.length;
      discountTotals = totalDiscount + (discountTotalHeader ?? 0);
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

  void _countTotal() {
    tax = 0;
    subTotal = 0;
    totalTrans = 0;
    grandTotalBeforeTax = 0;

    num totalMenu = 0;
    num totalAddon = 0;

    for (var data in transactionDetailList) {
      setState(() {
        totalMenu += data.qty * data.menuPrice;
        for (var items in data.addOn) {
          totalAddon += data.qty * items['menuPrice'];
        }
      });
      subTotal = totalMenu + totalAddon;
      grandTotalBeforeTax = subTotal - discountTotals;
      tax = grandTotalBeforeTax * _orderOfflineController.taxPercent.value;
      totalTrans = grandTotalBeforeTax + tax;
    }
    dbHelper.updateTransactionPPN(isTransactionNumber, tax.ceil());
  }

  Future<void> _addTransactionDetail(menuID, menuName, qtyItemDetail, menuPrice,
      menuImage, String notes) async {
    var getSelAddOn = await dbHelper.getMenuSpecID(menuID);
    var tgetSelAddOn = jsonDecode(getSelAddOn[0]['addOn']);
    var allSelectedIDs = selectedAddonPerCategory.map((key, value) =>
        MapEntry(key, (value is Set ? value.toList() : [value]).cast<int>()));

    var addOnExist = 0;

    for (var lAddOn in allSelectedIDs.entries) {
      List<int> menuIDs = lAddOn.value;
      addOnExist += menuIDs.length;
    }

    var selNote = '';
    var noteOptionList = jsonDecode(getSelAddOn[0]['noteOption']);

    if (selectedNoteIndex != -1)
      selNote = noteOptionList[(selectedNoteIndex - 1)];

    final transactionDetail = TransDetailLiteCreate(
      transactionNumber: isTransactionNumber,
      menuID: menuID,
      menuName: menuName,
      qty: qtyItemDetail,
      menuPrice: menuPrice,
      discountDetail: '[]',
      menuPriceAfterDiscount: menuPrice,
      noteOption: selNote,
      parentID: 0,
      menuImage: menuImage,
      statusSend: 0,
      notes: notes,
      statusItem: 'Closed',
    );

    int transactionDetailID =
        await dbHelper.createTransactionDetailLite(transactionDetail);

    // :: Add On
    if (addOnExist > 0) {
      for (var entry in allSelectedIDs.entries) {
        String category = entry.key;
        List<int> menuIDs = entry.value;

        var addOnFull = tgetSelAddOn
            .where((item) => item['title'] == category.toString())
            .toList()[0]['MenuAddOn'];
        var filteredAddOns = addOnFull
            .where(
                (item) => menuIDs.any((id) => id == int.parse(item['MenuID'])))
            .toList();

        for (var filteredAddOn in filteredAddOns) {
          final transactionDetail = TransDetailLiteCreate(
            transactionNumber: isTransactionNumber,
            menuID: int.parse(filteredAddOn['MenuID']),
            menuName: filteredAddOn['MenuName'],
            qty: qtyItemDetail,
            menuPrice: int.parse(filteredAddOn['MenuPrice']),
            discountDetail: '[]',
            menuPriceAfterDiscount: int.parse(filteredAddOn['MenuPrice']),
            noteOption: '',
            parentID: transactionDetailID,
            menuImage: menuImage,
            statusSend: 0,
            notes: notes,
            statusItem: 'Closed',
          );

          await dbHelper.createTransactionDetailLite(transactionDetail);
        }
      }
    }

    await _getTransactionDetail();

    _countTotal();

    Get.back();
  }

  Future<void> _updateTransactionDetail(
      {required int id, int? qty, String? notes}) async {
    await dbHelper.updateTransactionDetail(id: id, qty: qty, notes: notes);

    await _getTransactionDetail();

    _countTotal();
  }

  Future<dynamic> _fetchTransactionDataCountFromDetail() async {
    final response = await dbHelper.getTransactionDetail(
        transactionNumber: isTransactionNumber);

    double subTotal = response.fold(0, (sum, item) {
      return sum + (item['menuPrice'] * item['qty'] ?? 0);
    });

    // :: AddOn
    transactionDetailList = response
        .map((model) => TransactionDetailLiteModel.fromJson(model))
        .toList();

    for (var i = 0; i < transactionDetailList.length; i++) {
      final addOn = await dbHelper.getTransactionDetailAddOn(
          transactionDetailList[i].transactionDetailID);

      transactionDetailList[i] =
          transactionDetailList[i].copyWith(addOn: addOn);
    }

    transactionDetailUnsend =
        transactionDetailList.where((item) => item.statusSend == 0).toList();

    num totalAddon = 0;

    for (var data in transactionDetailList) {
      for (var value in data.addOn) {
        totalAddon += data.qty * value['menuPrice'];
      }
    }

    List allData = [];

    allData.add({
      'subTotal': (subTotal + totalAddon).ceil(),
    });

    // :: Update placeholder text field on checkout page
    int subTotals = allData[0]['subTotal'];
    int totalTax =
        (subTotals * _orderOfflineController.taxPercent.value).ceil();
    final totalDue =
        bulatkanKe500((subTotals + totalTax - discountTotals.toInt()));

    _orderOfflineController.grandTotal.value = totalDue;

    return allData;
  }

  Future<void> _getDiscount() async {
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
            item.discountType == 2 &&
            (item.availableDay?.contains(today) ?? false))
        .toList();

    if (!mounted) return;
    setState(() {
      discountList = discountListToday;
    });
  }

  Future<void> _getTax() async {
    final result = await dbHelper.getTax();

    if (!mounted) return;
    setState(() {
      _orderOfflineController.taxPercent.value = result.isNotEmpty
          ? (TaxLiteModel.fromJson(result.first).taxPercent / 100)
          : 0;
      _orderOfflineController.taxName.value =
          result.isNotEmpty ? TaxLiteModel.fromJson(result.first).taxName : '-';
    });
    print('taxes : ${result.first}');
  }

  Future<void> _setDiscount(transactionDetailID, menuPrice, masterDiscountID,
      discountTotal, qtyItem) async {
    final menuPriceAfterDiscount = (menuPrice - discountTotal).ceil();

    final discountDetail = [
      {
        "masterDiscountID": masterDiscountID,
        "discountTotal": discountTotal.ceil(),
      }
    ];

    await dbHelper.updateTransactionDetailDiscount(transactionDetailID,
        jsonEncode(discountDetail), menuPriceAfterDiscount.toInt());
    await _getTransactionDetail();

    _countTotal();

    Get.back();
  }

  Future<void> _getTransactionOpen() async {
    items.clear();

    final response = await dbHelper.getTransaction();

    if (!mounted) return;
    setState(() {
      transactionOpen = response
          .map((model) => TransactionLiteModel.fromJson(model))
          .where((item) =>
              item.statusTransaction == TransactionFilter.open.name.titleCase)
          .toList();
      transactionSelected = response
          .map((model) => TransactionLiteModel.fromJson(model))
          .where((item) => item.transactionNumber == isTransactionNumber)
          .toList();

      isTransactionNumber = transactionSelected.first.transactionNumber ?? '';

      for (var data in transactionOpen) {
        items.add(
          {
            "custName": data.customerName ?? '',
            "orderType": data.transactionType ?? '',
            "tableLabel": data.tableLabel ?? '',
            "transactionNumber": data.transactionNumber ?? ''
          },
        );
      }

      tblLoading = false;
      custCodeLoading = false;
    });
  }

  Future<void> _getCustomer() async {
    final result = await dbHelper.getCustomer();

    if (!mounted) return;
    setState(() {
      customers = result;
    });
  }

  void _selectDate(BuildContext context) async {
    DateTime? datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1948),
      lastDate: DateTime(2030),
    );

    if (datePicker != null && datePicker != DateTime.now()) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(datePicker);
      birthDateController.text = formattedDate;
    }
  }

  Future<void> _insertCustomer({required String code}) async {
    final outletID = await localStorage.getOutletID();

    if (code.isEmpty) {
      customerCode = await dbHelper.generateCustomerCode();

      await dbHelper.insertCustomer(
        customerCode: customerCode,
        fullname: fullNameController.text,
        email: emailController.text,
        mobileNo: int.tryParse(mobileNoController.text) ?? 0,
        birthDate: birthDateController.text,
        provinceID: selectedProvince,
        cityID: selectedCity,
        address: addressController.text,
        outletID: outletID,
      );
    }

    await dbHelper.updateTransactionCustomer(
        isTransactionNumber, customerCode, fullNameController.text);

    _callBack();

    Get.back();
  }

  void _getOutletInfo() async {
    final name = await localStorage.getStaffName();
    final outletId = await localStorage.getOutletID();
    final outlet = await localStorage.getOutletName();
    final outlettype = await localStorage.getOutletType();

    if (!mounted) return;
    setState(() {
      staffName = name;
      outletID = outletId;
      outletName = outlet;
      outletType = outlettype;
    });
  }

  Future<void> _getStation() async {
    final result = await dbHelper.getStation();

    setState(() {
      stations =
          result.map((model) => StationLiteModel.fromJson(model)).toList();
    });
  }

  Future<void> _resetDiscountDetail({required String trx}) async {
    // await dbHelper.updateTransactionDetailResetDiscount(isTransactionNumber);
    print('delete discount');
    print('tessss: ${trx}');
    await dbHelper.updateTransactionResetDiscount(trx);
    await dbHelper.updateTransactionDetailResetDiscount(trx);
  }

  Future<void> _selectedOrder({required String trx}) async {
    await _getTransactionByTrx(trx: trx);
  }

  void _addCustomer() async {
    setState(() {
      customerCode = '';
      selectedProvince = 0;
      selectedCity = 0;

      fullNameController.text = '';
      emailController.text = '';
      mobileNoController.text = '';
      birthDateController.text = '';
      addressController.text = '';
    });

    return showDialog(
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
            actionsPadding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Autocomplete<CustomerLiteModel>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      final query = textEditingValue.text.toLowerCase();

                      if (query.isEmpty) {
                        return const Iterable<CustomerLiteModel>.empty();
                      }

                      final filtered = customers.where(
                          (c) => c.fullname.toLowerCase().contains(query));

                      final unique = <String, CustomerLiteModel>{};

                      for (var c in filtered) {
                        unique[c.fullname] = c;
                      }

                      return unique.values;
                    },
                    displayStringForOption: (CustomerLiteModel option) =>
                        option.fullname,
                    onSelected: (CustomerLiteModel selection) async {
                      setState(() {
                        final provinceId = selection.provinceID ?? 0;
                        final cityId = selection.cityID ?? 0;

                        if (provinceId > 0) {
                          selectedProvince = provinceId;
                          selectedCity = cityId;
                        }

                        customerCode = selection.customerCode;
                        fullNameController.text = selection.fullname;
                        emailController.text = selection.email ?? '';
                        mobileNoController.text = selection.mobileNo ?? '';
                        birthDateController.text = selection.birthDate ?? '';
                        addressController.text = selection.address ?? '';
                      });

                      await _getCity(id: selection.provinceID ?? 0);
                    },
                    fieldViewBuilder:
                        (context, controller, focusNode, onEditingComplete) {
                      return TextField(
                        controller: controller,
                        focusNode: focusNode,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          labelText: 'Search Customer',
                          labelStyle: TextStyle(
                            fontFamily: 'NanumGothic',
                            color: customBodyText,
                          ),
                          filled: true,
                          fillColor: customLightGrey,
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
                        ),
                      );
                    },
                    optionsViewBuilder: (context, onSelected, options) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          color: Colors.white,
                          elevation: 1,
                          borderRadius: BorderRadius.circular(30),
                          child: SizedBox(
                            width: 400.w,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: options.length,
                              itemBuilder: (BuildContext context, int index) {
                                final CustomerLiteModel option =
                                    options.elementAt(index);
                                return ListTile(
                                  title: Text(
                                    option.fullname,
                                    style: TextStyle(
                                      fontFamily: 'NanumGothic',
                                    ),
                                  ),
                                  onTap: () => onSelected(option),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10.h),
                  Opacity(opacity: 0.2, child: Divider()),
                  SizedBox(height: 10.h),
                  Center(
                    child: Text(
                      "Add New Customer",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: customHeadingText,
                        fontSize: 14.sp,
                        fontFamily: "NanumGothic",
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: 500.w,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: const TextStyle(color: Colors.black),
                            controller: fullNameController,
                            readOnly: customerCode == '' ? false : true,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(20, 20, 20, 20),
                              errorText: validateFullName
                                  ? 'Full Name cannot be empty'
                                  : null,
                              filled: true,
                              fillColor: customLightGrey,
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
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: customRed1,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: customLightGrey,
                                ),
                              ),
                              hintText: 'Full Name',
                              hintStyle: TextStyle(
                                fontFamily: 'NanumGothic',
                                color: customBodyText,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: TextField(
                            style: const TextStyle(color: Colors.black),
                            controller: emailController,
                            readOnly: customerCode.isEmpty ? false : true,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(20, 20, 20, 20),
                              filled: true,
                              fillColor: customLightGrey,
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
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: customRed1,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: customLightGrey,
                                ),
                              ),
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                fontFamily: 'NanumGothic',
                                color: customBodyText,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: TextField(
                            style: const TextStyle(color: Colors.black),
                            controller: mobileNoController,
                            readOnly: customerCode.isEmpty ? false : true,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(20, 20, 20, 20),
                              filled: true,
                              fillColor: customLightGrey,
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
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: customRed1,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: customLightGrey,
                                ),
                              ),
                              hintText: 'Mobile No',
                              hintStyle: TextStyle(
                                fontFamily: 'NanumGothic',
                                color: customBodyText,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: 500.w,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            controller: birthDateController,
                            onTap: customerCode.isNotEmpty
                                ? null
                                : () => _selectDate(context),
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(20, 20, 20, 20),
                              filled: true,
                              fillColor: customLightGrey,
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
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: customRed1,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: customLightGrey,
                                ),
                              ),
                              hintText: 'Date of Birth',
                              hintStyle: TextStyle(
                                fontFamily: 'NanumGothic',
                                color: customBodyText,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Container(
                            height: 60,
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            decoration: BoxDecoration(
                              color: customLightGrey,
                              border: Border.all(
                                color: customLightGrey,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<int>(
                                isDense: true,
                                isExpanded: true,
                                hint: const Text(
                                  "Province",
                                  style: TextStyle(
                                    fontFamily: 'NexaRegular',
                                    color: Colors.grey,
                                  ),
                                ),
                                value: provinceList.any(
                                        (e) => e.provinceID == selectedProvince)
                                    ? selectedProvince
                                    : null,
                                dropdownStyleData: DropdownStyleData(
                                  width: 300,
                                  maxHeight: 200,
                                  padding: EdgeInsets.all(10),
                                  offset: const Offset(-20, -10),
                                  decoration: BoxDecoration(
                                    color:
                                        customLightGrey.withValues(alpha: 0.9),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                items: provinceLoading
                                    ? [
                                        const DropdownMenuItem<int>(
                                          value: null,
                                          enabled: false,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 18,
                                                height: 18,
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  strokeCap: StrokeCap.round,
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Text("Loading provinces..."),
                                            ],
                                          ),
                                        ),
                                      ]
                                    : provinceList.map((val) {
                                        return DropdownMenuItem<int>(
                                          value: val.provinceID,
                                          child: Text(
                                            val.provinceName,
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                onChanged: customerCode.isNotEmpty
                                    ? null
                                    : (value) async {
                                        setState(() {
                                          cityList.clear();
                                          selectedCity = 0;
                                          selectedProvince = value ?? 0;
                                        });

                                        await _getCity(id: value ?? 0);
                                      },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Container(
                            height: 60,
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            decoration: BoxDecoration(
                              color: customLightGrey,
                              border: Border.all(
                                color: customLightGrey,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<int>(
                                isDense: true,
                                isExpanded: true,
                                hint: const Text(
                                  "City",
                                  style: TextStyle(
                                    fontFamily: 'NexaRegular',
                                    color: Colors.grey,
                                  ),
                                ),
                                value: cityList
                                        .any((e) => e.cityID == selectedCity)
                                    ? selectedCity
                                    : null,
                                dropdownStyleData: DropdownStyleData(
                                  width: 300,
                                  maxHeight: 200,
                                  padding: EdgeInsets.all(10),
                                  offset: const Offset(-50, -10),
                                  decoration: BoxDecoration(
                                    color:
                                        customLightGrey.withValues(alpha: 0.9),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                items: cityLoading
                                    ? [
                                        const DropdownMenuItem<int>(
                                          value: null,
                                          enabled: false,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 18,
                                                height: 18,
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  strokeCap: StrokeCap.round,
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Text("Loading cities..."),
                                            ],
                                          ),
                                        ),
                                      ]
                                    : cityList.map((val) {
                                        return DropdownMenuItem<int>(
                                          value: val.cityID,
                                          child: Text(
                                            val.cityName,
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                onChanged: customerCode.isNotEmpty
                                    ? null
                                    : (value) {
                                        setState(() {
                                          selectedCity = value ?? 0;
                                        });
                                      },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: 500.w,
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: addressController,
                      readOnly: customerCode.isEmpty ? false : true,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        filled: true,
                        fillColor: customLightGrey,
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
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            width: 1,
                            color: customRed1,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            width: 1,
                            color: customLightGrey,
                          ),
                        ),
                        hintText: 'Address',
                        hintStyle: TextStyle(
                          fontFamily: 'NanumGothic',
                          color: customBodyText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      side: BorderSide(
                        width: 2,
                        color: customRegularGrey,
                      ),
                    ),
                    onPressed: () => Get.back(),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "UbuntuBold",
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      minimumSize: const Size(100, 50),
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        fullNameController.text.isEmpty
                            ? validateFullName = true
                            : validateFullName = false;
                      });

                      if (!validateFullName)
                        await _insertCustomer(code: customerCode);
                    },
                    child: Text(
                      customerCode.isEmpty ? "Save" : "Assign",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "UbuntuBold",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
      },
    );
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
                        final prefs = await SharedPreferences.getInstance();
                        final grandTotalAfterTax =
                            grandTotalBeforeTax.toInt() + tax.toInt();

                        await dbHelper.updateTransactionHold(
                            isTransactionNumber,
                            int.parse(subTotal.toString()),
                            tax.toInt(),
                            "${_orderOfflineController.taxName.value} (${_orderOfflineController.taxPercent.value * 100}%)",
                            grandTotalBeforeTax.toInt(),
                            grandTotalAfterTax);
                        await dbHelper
                            .updateTransactionDetailSend(isTransactionNumber);
                        // _loadTransactionDetail();
                        // _getTransactionDetail();
                        final primaryPrinter =
                            await localStorage.getPrimaryPrinter();

                        for (final value in stations) {
                          final printer =
                              prefs.getString(value.stationName) ?? '';

                          if (printer.isNotEmpty) {
                            if (printer == 'to Primary') {
                              if (primaryPrinter.first == 'BluetoothPrinter') {
                                printDocket(
                                    1,
                                    isTransactionNumber,
                                    value.stationID,
                                    value.stationName,
                                    tableLabel);
                                await Future.delayed(
                                  const Duration(milliseconds: 500),
                                );
                              } else {
                                printDocketLan(
                                    1,
                                    isTransactionNumber,
                                    primaryPrinter[1],
                                    value.stationID,
                                    value.stationName,
                                    tableLabel);
                                await Future.delayed(
                                  const Duration(milliseconds: 500),
                                );
                              }
                            } else {
                              printDocketLan(
                                  1,
                                  isTransactionNumber,
                                  printer,
                                  value.stationID,
                                  value.stationName,
                                  tableLabel);
                              await Future.delayed(
                                const Duration(milliseconds: 500),
                              );
                            }
                          }
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

  Future<void> _popupAddItem(menuID, menuName, menuDesc, menuImage, image,
      menuPrice, addOn, noteOption) async {
    var addOnList = jsonDecode(addOn);
    var noteOptionList = jsonDecode(noteOption);

    notesController.clear();

    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        final size = MediaQuery.of(context).size;

        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            insetPadding: EdgeInsets.symmetric(
              horizontal: size.width / 5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: menuImage != ''
                                    ? Image.file(
                                        File(menuImage),
                                        height: 200,
                                        fit: BoxFit.cover,
                                      )
                                    : Container(
                                        alignment: Alignment.center,
                                        height: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Text(
                                          menuName,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "UbuntuBold",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade800),
                                          textAlign: TextAlign.center,
                                        )),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              menuName,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'UbuntuBold',
                                color: customHeadingText,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              menuDesc,
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 8.sp,
                                fontFamily: 'NanumGothic',
                                color: customBodyText,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              numberFormat('IDR', menuPrice).toString(),
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'UbuntuBold',
                                color: primaryColor,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (qtyItemDetail > 1) {
                                      setState(() {
                                        qtyItemDetail--;
                                      });
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(3.5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        width: 1,
                                        color: customRegularGrey,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      size: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 35,
                                  padding: const EdgeInsets.all(2),
                                  margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                                  color: Colors.white,
                                  alignment: Alignment.center,
                                  child: Text(
                                    qtyItemDetail.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'UbuntuBold',
                                      color: customHeadingText,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      qtyItemDetail++;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(3.5),
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        width: 1,
                                        color: primaryColor,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 450.h,
                          width: 10,
                          child: ListView(
                            children: [
                              if (addOnList.isNotEmpty)
                                ...addOnList.map((addOnHead) {
                                  String key = addOnHead['title'].toString();

                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              addOnHead['title'],
                                              style: TextStyle(
                                                fontSize: 11.sp,
                                                fontFamily: 'UbuntuBold',
                                                color: Colors.black,
                                              ),
                                            ),
                                            addOnHead['required'] == 1
                                                ? addOnHead['multiply'] == 1 &&
                                                        addOnHead['min'] > 1
                                                    ? Text(
                                                        '(Required ${addOnHead['min']})',
                                                        style: TextStyle(
                                                          fontSize: 9.sp,
                                                          fontFamily:
                                                              'NanumGothic',
                                                          color: customRed1,
                                                        ),
                                                      )
                                                    : Text(
                                                        '(Required)',
                                                        style: TextStyle(
                                                          fontSize: 9.sp,
                                                          fontFamily:
                                                              'NanumGothic',
                                                          color: customRed1,
                                                        ),
                                                      )
                                                : const SizedBox.shrink(),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        ...addOnHead['MenuAddOn']
                                            .map<Widget>((addOnRes) {
                                          int menuID =
                                              int.parse(addOnRes['MenuID']);

                                          return ListTile(
                                            visualDensity: const VisualDensity(
                                              vertical: -4,
                                              horizontal: 0,
                                            ),
                                            contentPadding: EdgeInsets.zero,
                                            title: Text(
                                              addOnRes['MenuName'].toString(),
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                fontFamily: 'NanumGothic',
                                                color: customBodyText,
                                              ),
                                            ),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  "+ ${numberFormat('IDR', int.parse(addOnRes['MenuPrice']))}",
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontFamily: 'NanumGothic',
                                                    color: customBodyText,
                                                  ),
                                                ),
                                                addOnHead['multiply'] == 1
                                                    ? Theme(
                                                        data: Theme.of(context)
                                                            .copyWith(
                                                          checkboxTheme:
                                                              CheckboxThemeData(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                          ),
                                                        ),
                                                        child: Checkbox(
                                                          activeColor:
                                                              primaryColor,
                                                          value: (selectedAddonPerCategory[
                                                                          key]
                                                                      as Set<
                                                                          int>?)
                                                                  ?.contains(
                                                                      menuID) ??
                                                              false,
                                                          onChanged: (bool?
                                                              isChecked) {
                                                            setState(() {
                                                              selectedAddonPerCategory
                                                                  .putIfAbsent(
                                                                      key,
                                                                      () =>
                                                                          <int>{});
                                                              if (isChecked ==
                                                                  true) {
                                                                (selectedAddonPerCategory[
                                                                            key]
                                                                        as Set<
                                                                            int>)
                                                                    .add(
                                                                        menuID);
                                                              } else {
                                                                (selectedAddonPerCategory[
                                                                            key]
                                                                        as Set<
                                                                            int>)
                                                                    .remove(
                                                                        menuID);
                                                              }
                                                            });

                                                            debugPrint(
                                                                "selected add on: $selectedAddonPerCategory");
                                                          },
                                                        ),
                                                      )
                                                    : Radio(
                                                        value: menuID,
                                                        activeColor:
                                                            primaryColor,
                                                        groupValue:
                                                            selectedAddonPerCategory[
                                                                key],
                                                        onChanged: (value) {
                                                          setState(() {
                                                            selectedAddonPerCategory[
                                                                    key] =
                                                                value as int;
                                                          });
                                                        },
                                                      ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              addOnList.length > 0 && noteOptionList.length > 0
                                  ? const Column(
                                      children: [
                                        Divider(),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                              noteOptionList.length > 0
                                  ? Text(
                                      'Note Option',
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontFamily: 'UbuntuBold',
                                        color: Colors.black,
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                              ...noteOptionList.asMap().entries.map((noteRes) {
                                int index = noteRes.key + 1;

                                return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  visualDensity: const VisualDensity(
                                    vertical: -4,
                                    horizontal: 0,
                                  ),
                                  title: Text(
                                    noteRes.value.toString(),
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: 'NanumGothic',
                                      color: customBodyText,
                                    ),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'NanumGothic',
                                          color: customBodyText,
                                        ),
                                      ),
                                      Radio(
                                        value: index,
                                        groupValue: selectedNoteIndex,
                                        activeColor: primaryColor,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedNoteIndex = value as int;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildTextNotes(context),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      var allSelectedAddonList = selectedAddonPerCategory
                          .entries
                          .map<Map<String, List<int>>>((entry) {
                        return {
                          entry.key: (entry.value is Set)
                              ? entry.value.cast<int>().toList()
                              : [entry.value as int]
                        };
                      }).toList();

                      var c = 0;

                      for (var resReq in addOnList) {
                        if (resReq['required'] == 1 &&
                            resReq['multiply'] == 1) {
                          var selectedExist = allSelectedAddonList
                              .where(
                                  (item) => item.keys.first == resReq['title'])
                              .toList();

                          if (selectedExist.isEmpty) return;
                          if (selectedExist[c][resReq['title']]!.length <
                              resReq['min']) return;
                        }

                        if (resReq['required'] == 1 &&
                            resReq['multiply'] == 0) {
                          var selectedExist = allSelectedAddonList
                              .where(
                                  (item) => item.keys.first == resReq['title'])
                              .toList();

                          if (selectedExist.isEmpty) return;
                        }
                        c++;
                      }

                      _addTransactionDetail(menuID, menuName, qtyItemDetail,
                          menuPrice, image, notesController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      minimumSize: Size((size.width / 1.5), 50),
                      backgroundColor: primaryColor,
                    ),
                    child: Text(
                      "Add • ${numberFormat('IDR', qtyItemDetail * menuPrice).toString()} ",
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.white,
                        fontFamily: 'UbuntuBold',
                      ),
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

  Future<void> _discountList(
      transactionDetailID, menuPrice, menuid, qtyItem) async {
    final tempDiscount = <DiscountLiteModel>[];
    final result = await dbHelper.getTransactionDetailByID(
        isTransactionNumber, transactionDetailID);
    final discountDetail = jsonDecode(result.first['discountDetail']) as List;

    for (var data in discountList) {
      final list = data.spesificMenuID;

      final matched = list.any((item) {
        return item['MenuID'].toString() == menuid.toString();
      });

      if (matched) tempDiscount.add(data);
    }

    if (!mounted) return;
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
          content: SingleChildScrollView(
            child: Column(
              children: [
                if (tempDiscount.isEmpty)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Center(
                          child: Text(
                            "No available discounts for this menu.",
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontFamily: "NanumGothic",
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => Get.back(),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(10, 24.sp),
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Text(
                          "Close",
                          style: TextStyle(
                            fontSize: 8.sp,
                            fontFamily: 'UbuntuBold',
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  ...discountList.map((data) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.masterDiscountName,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontFamily: "UbuntuBold",
                                          color: primaryColor,
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        "${numberFormat('IDR', data.minTransDiscount)} Minimum Transaction\n${numberFormat('IDR', data.maxDiscount).toString()} Maximum Discount",
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
                                  child: Text(
                                    data.valueType == 'Nominal'
                                        ? numberFormat(
                                                'IDR', data.discountValue)
                                            .toString()
                                        : data.valueType == 'Percent'
                                            ? "${data.discountValue} %"
                                            : "= ${numberFormat('IDR', data.discountValue).toString()}",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 10.sp,
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
                                if (discountDetail.isNotEmpty) {
                                  await _removeDiscount(
                                      id: transactionDetailID,
                                      price: menuPrice);
                                } else {
                                  num discounts = 0;

                                  if (data.valueType == 'Nominal') {
                                    setState(() {
                                      discountTotals =
                                          (data.discountValue * qtyItem).ceil();
                                      discounts = data.discountValue;
                                    });
                                  } else if (data.valueType == 'Percent') {
                                    setState(() {
                                      discountTotals = ((menuPrice *
                                                  data.discountValue /
                                                  100) *
                                              qtyItem)
                                          .ceil();
                                      discounts = (menuPrice *
                                          data.discountValue /
                                          100);
                                    });
                                  } else {
                                    setState(() {
                                      discountTotals =
                                          ((menuPrice - data.discountValue) *
                                                  qtyItem)
                                              .ceil();
                                      discounts =
                                          (menuPrice - data.discountValue);
                                    });
                                  }

                                  await _setDiscount(
                                      transactionDetailID,
                                      menuPrice,
                                      data.masterDiscountID,
                                      discounts,
                                      qtyItem);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(10, 24.sp),
                                backgroundColor: discountDetail.isNotEmpty
                                    ? customRed1
                                    : primaryColor,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Text(
                                discountDetail.isNotEmpty
                                    ? "Remove Discount"
                                    : "Add Discount",
                                style: TextStyle(
                                  fontSize: 8.sp,
                                  fontFamily: 'UbuntuBold',
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _popupUpdateNotes(
      {required int id, String? notes, int? qty}) async {
    notesController.text = notes ?? '';

    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        final size = MediaQuery.of(context).size;

        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: size.width * 0.5,
                    child: _buildTextNotes(context),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _updateTransactionDetail(
                          id: id, qty: qty, notes: notesController.text);

                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: primaryColor,
                    ),
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.white,
                        fontFamily: 'UbuntuBold',
                      ),
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

  Future<void> _removeDiscount({required int id, required int price}) async {
    await dbHelper.updateTransactionDetailDiscount(id, '[]', price);
    await _getTransactionDetail();

    _countTotal();

    Get.back();
  }

  Future<void> _getDataStaff() async {
    String dataStaff = await localStorage.getDataStaff();
    String actionName = await localStorage.getActionName();

    for (var staff in jsonDecode(dataStaff)) {
      String data = staff['AuthLevelID']?['ActionName'];

      if (data.toLowerCase() == "waiters") {
        if (data.toLowerCase() == actionName.toLowerCase()) {
          setState(() {
            isWaiters = true;
          });
        }
      }
      if (data.toLowerCase() == "spv" || data.toLowerCase() == "manager") {
        if (data.toLowerCase() == actionName.toLowerCase()) {
          setState(() {
            isAdmin = true;
          });
        }
      }
    }
    print('Admin : $isAdmin');
  }

  @override
  void initState() {
    super.initState();
    _initPaths();
    _getStation();
    _getDiscount();
    _getProvince();
    _getCustomer();
    _getDataStaff();
    _getOutletInfo();
    _resetDiscountDetail(trx: arguments["transaction_number"]);
    _getTax();

    _getTransactionDetail();
    getDeviceInfo();
    _getTransactionByTrx(trx: arguments["transaction_number"]);

    _orderOfflineController.onTableChanged = () {
      _getTransactionByTrx(trx: isTransactionNumber);
    };

    _orderOfflineController.selectedTable.value = arguments["table_id"];
    fetchTransDataCountFromDetail = _fetchTransactionDataCountFromDetail();
  }

  // Future<void> clearDiscount() async {
  //   await dbHelper.updateTransactionResetDiscount(widget.transactionNumber);
  //   await dbHelper
  //       .updateTransactionDetailResetDiscount(widget.transactionNumber);

  //   widget.callBack.call();
  //   widget.onNavigateCheckout(0);
  //   transactionOrderOfflineController.grandTotal.value = 0;
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return PopScope(
        canPop: false,
        child: GestureDetector(
          onTap: () => _orderOfflineController.searchFocusNode.unfocus(),
          child: Scaffold(
            backgroundColor: customWhite1,
            resizeToAvoidBottomInset: false,
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
                InternetStatusWidget(),
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
                  child: PageView(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() {
                        currentPageIndex = index;
                      });
                    },
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            height: 60,
                            child: Row(
                              children: [
                                _searchItem(context),
                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20.h,
                                        vertical: 0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: tblLoading
                                          ? LinearProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      primaryColor),
                                            )
                                          : Obx(() {
                                              final state =
                                                  _orderOfflineController
                                                      .isDropdownOpened.value;

                                              return DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  isDense: true,
                                                  isExpanded: true,
                                                  value: isTransactionNumber,
                                                  iconStyleData: IconStyleData(
                                                    icon: Icon(
                                                        state
                                                            ? CupertinoIcons
                                                                .chevron_up
                                                            : CupertinoIcons
                                                                .chevron_down,
                                                        color: Colors.white),
                                                    iconSize: 18,
                                                    iconEnabledColor:
                                                        Colors.white,
                                                    iconDisabledColor:
                                                        Colors.grey,
                                                  ),
                                                  onMenuStateChange:
                                                      (bool isOpen) {
                                                    setState(() {
                                                      _orderOfflineController
                                                          .isDropdownOpened
                                                          .value = isOpen;
                                                    });
                                                  },
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: Colors.white,
                                                    fontFamily: 'UbuntuBold',
                                                  ),
                                                  onChanged:
                                                      (String? value) async {
                                                    String val = value ?? '';

                                                    if (val.isNotEmpty)
                                                      _selectedOrder(trx: val);
                                                  },
                                                  selectedItemBuilder:
                                                      (BuildContext context) {
                                                    return items.map(
                                                        (Map<String, String>
                                                            value) {
                                                      return Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              value['orderType'] ==
                                                                      'Dine In'
                                                                  ? Icons.house
                                                                  : Icons
                                                                      .shopping_bag,
                                                              size: 30.r,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            SizedBox(
                                                                width: 10.r),
                                                            Expanded(
                                                              child: Text(
                                                                value['orderType'] ==
                                                                        'Dine In'
                                                                    ? '${value['tableLabel']} - ${value['custName']}'
                                                                    : '${value['custName']}',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      10.sp,
                                                                  fontFamily:
                                                                      'UbuntuBold',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width: 10.r),
                                                          ],
                                                        ),
                                                      );
                                                    }).toList();
                                                  },
                                                  items: items.map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (Map<String, String>
                                                          value) {
                                                    final isSelected = value[
                                                            'transactionNumber'] ==
                                                        isTransactionNumber;

                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value[
                                                          'transactionNumber'],
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  value['orderType'] ==
                                                                          'Dine In'
                                                                      ? Icons
                                                                          .house
                                                                      : Icons
                                                                          .shopping_bag,
                                                                  size: 30.r,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                SizedBox(
                                                                    width:
                                                                        10.r),
                                                                Expanded(
                                                                  child: Text(
                                                                    value['orderType'] ==
                                                                            'Dine In'
                                                                        ? '${value['tableLabel']} - ${value['custName']}'
                                                                        : '${value['custName']}',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10.sp,
                                                                      fontFamily:
                                                                          'UbuntuBold',
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          isSelected
                                                              ? Icon(
                                                                  Icons.check,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 20)
                                                              : const SizedBox
                                                                  .shrink(),
                                                        ],
                                                      ),
                                                    );
                                                  }).toList(),
                                                  buttonStyleData:
                                                      ButtonStyleData(
                                                    height: 50,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                  ),
                                                  dropdownStyleData:
                                                      DropdownStyleData(
                                                    width: 280,
                                                    maxHeight: 400,
                                                    offset:
                                                        const Offset(-13, -5),
                                                    decoration: BoxDecoration(
                                                      color: primaryColor
                                                          .withValues(
                                                              alpha: 0.9),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                ),
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
                                child: Obx(() {
                                  final categories =
                                      _orderOfflineController.categoryList;

                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        categories.length + 1, // +1 untuk 'All'
                                    itemBuilder: (context, index) {
                                      if (index == 0) {
                                        return _buildCategoryTab(
                                            context, 'All', 0);
                                      } else {
                                        final category = categories[index - 1];
                                        return _buildCategoryTab(
                                            context,
                                            category.categoryName,
                                            category.categoryID);
                                      }
                                    },
                                  );
                                })),
                          ),

                          // :: List items
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Obx(() {
                                final data = _orderOfflineController.menuList;

                                if (data.isEmpty) {
                                  return Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            "assets/images/errors/box-empty.webp",
                                            width: size.height * 0.2,
                                            fit: BoxFit.cover),
                                        const SizedBox(height: 10),
                                        Text(
                                          "Oops! We couldn't find any menu items.",
                                          style: TextStyle(
                                            fontFamily: 'NanumGothic',
                                            color: customBodyText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  // Grouped menu by category if "All" selected
                                  if (_orderOfflineController
                                          .selectedCategory.value ==
                                      0) {
                                    final categories =
                                        _orderOfflineController.categoryList;
                                    final grouped = groupBy(
                                      data,
                                      (item) => item.categoryID,
                                    );
                                    return SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          for (final category in categories)
                                            if ((grouped[category.categoryID] ??
                                                    [])
                                                .isNotEmpty) ...[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 10),
                                                child: Text(
                                                  category.categoryName,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 24),
                                                ),
                                              ),
                                              const Divider(),
                                              GridView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 5,
                                                  crossAxisSpacing: 5.w,
                                                  mainAxisSpacing: 20.h,
                                                  childAspectRatio: 0.80,
                                                ),
                                                itemCount: grouped[
                                                        category.categoryID]!
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  final menu = grouped[category
                                                      .categoryID]![index];
                                                  return _buildMenuItem(
                                                    menuId: menu.menuID,
                                                    menuName: menu.menuName,
                                                    menuDesc: menu.menuDesc,
                                                    menuImage: menu.menuImage,
                                                    menuPrice: menu.menuPrice,
                                                    menuAddOn: menu.addOn,
                                                    menuNotes: menu.noteOption,
                                                  );
                                                },
                                              ),
                                            ],
                                        ],
                                      ),
                                    );
                                  } else {
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
                                        return _buildMenuItem(
                                          menuId: data[index].menuID,
                                          menuName: data[index].menuName,
                                          menuDesc: data[index].menuDesc,
                                          menuImage: data[index].menuImage,
                                          menuPrice: data[index].menuPrice,
                                          menuAddOn: data[index].addOn,
                                          menuNotes: data[index].noteOption,
                                        );
                                      },
                                    );
                                  }
                                }
                              }),
                            ),
                          ),
                        ],
                      ),
                      CheckoutPage(
                        onNavigateCheckout: _navigateToPage,
                        transactionNumber: isTransactionNumber,
                        callBack: _callBack,
                        callBackDispose: _callBackDispose,
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
                              horizontal: 14,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Order #${isTransactionNumber.substring(isTransactionNumber.length - 3)}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontFamily: 'UbuntuBold',
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                currentPageIndex == 0
                                    ? Obx(() {
                                        if (_orderOfflineController
                                                .selectedTable.value >
                                            0) {
                                          return DropdownButtonHideUnderline(
                                            child: DropdownButton2<int>(
                                              isDense: true,
                                              isExpanded: true,
                                              customButton: SizedBox(
                                                  width: 45,
                                                  height: 45,
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        primaryColor,
                                                    child: const Icon(
                                                        Iconsax.reserve5,
                                                        color: Colors.white,
                                                        size: 20),
                                                  )),
                                              value: _orderOfflineController
                                                  .selectedTable.value,
                                              onChanged: (value) async {
                                                final val = value ?? 0;
                                                _orderOfflineController
                                                    .setSelectedTable(
                                                        tableId: val,
                                                        trx:
                                                            isTransactionNumber);

                                                await _getTransactionByTrx(
                                                    trx: isTransactionNumber);
                                              },
                                              menuItemStyleData:
                                                  MenuItemStyleData(
                                                padding: EdgeInsets.zero,
                                              ),
                                              dropdownStyleData:
                                                  DropdownStyleData(
                                                width: 210,
                                                maxHeight: 500,
                                                offset: const Offset(0, -10),
                                                decoration: BoxDecoration(
                                                  color: primaryColor
                                                      .withValues(alpha: 0.9),
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                              ),
                                              items: _orderOfflineController
                                                  .reserveList.entries
                                                  .expand((entry) {
                                                final location = entry.key;
                                                final tables = entry.value;

                                                return [
                                                  DropdownMenuItem<int>(
                                                    enabled: false,
                                                    child: Container(
                                                      width: double.infinity,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10.0,
                                                              horizontal: 16.0),
                                                      decoration: BoxDecoration(
                                                        border: Border(
                                                          bottom: BorderSide(
                                                            color: Colors.grey,
                                                            width: 0.5,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        location.locationLabel,
                                                        style: TextStyle(
                                                          fontSize: 10.sp,
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'NexaRegular',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  ...tables.map((table) {
                                                    final isAvailable = table
                                                                .statusTransaction !=
                                                            TransactionFilter
                                                                .open
                                                                .name
                                                                .titleCase &&
                                                        (table.uniqueNumberSM ??
                                                                0) ==
                                                            0;
                                                    final timeLabel =
                                                        (table.uniqueNumberSM ??
                                                                    0) >
                                                                0
                                                            ? _formatTime(table
                                                                .dateTimeSM)
                                                            : _formatTime(
                                                                table.dateTime);

                                                    final value = table.tableID;
                                                    final bool selected =
                                                        _orderOfflineController
                                                                .selectedTable
                                                                .value ==
                                                            table.tableID;

                                                    return DropdownMenuItem<
                                                        int>(
                                                      value: value,
                                                      enabled: isAvailable,
                                                      child: Container(
                                                        height: double.infinity,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 10.0,
                                                                horizontal:
                                                                    16.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: selected
                                                              ? customDarkGrey
                                                              : Colors
                                                                  .transparent,
                                                        ),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              "Table - ${table.tableLabel}",
                                                              style: TextStyle(
                                                                color: isAvailable
                                                                    ? Colors.white
                                                                    : selected
                                                                        ? Colors.black
                                                                        : Colors.grey.shade400,
                                                                fontFamily:
                                                                    'NexaRegular',
                                                              ),
                                                            ),
                                                            Text(
                                                              isAvailable
                                                                  ? "Available"
                                                                  : timeLabel,
                                                              style: TextStyle(
                                                                color: isAvailable
                                                                    ? Colors.white
                                                                    : selected
                                                                        ? Colors.black
                                                                        : Colors.grey.shade400,
                                                                fontFamily:
                                                                    'NexaRegular',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                ];
                                              }).toList(),
                                            ),
                                          );
                                        } else {
                                          return const SizedBox.shrink();
                                        }
                                      })
                                    : const SizedBox.shrink(),
                                custCodeLoading
                                    ? SizedBox(
                                        width: 20,
                                        child: Center(
                                          child: LinearProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    primaryColor),
                                          ),
                                        ),
                                      )
                                    : ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          minimumSize: Size(180.r, 45),
                                          maximumSize: Size(180.r, 45),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 10.h,
                                            horizontal: 10.w,
                                          ),
                                          backgroundColor: primaryColor,
                                          foregroundColor: Colors.white,
                                          disabledBackgroundColor: primaryColor,
                                          disabledForegroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                        onPressed: transactionSelected
                                                    .first.customerCode !=
                                                null
                                            ? null
                                            : () => _addCustomer(),
                                        child: Text(
                                          transactionSelected
                                                      .first.customerCode !=
                                                  null
                                              ? transactionSelected
                                                      .first.customerName ??
                                                  ''
                                              : "+ Customer",
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            fontFamily: 'UbuntuBold',
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),

                        // :: Cart list order
                        transactionDetailList.isEmpty
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
                                    itemCount: transactionDetailList.length,
                                    itemBuilder: (context, index) {
                                      return cartList(
                                          transactionDetailList[index]);
                                    },
                                  ),
                                ),
                              ),

                        // Footer _currentPageIndex
                        currentPageIndex == 0
                            ? Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(16, 16, 16, 8.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              minimumSize: const Size(200, 0),
                                              backgroundColor: Colors.white,
                                              padding: EdgeInsets.symmetric(
                                                vertical: 20.h,
                                                horizontal: 20,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              side: BorderSide(
                                                width: 2,
                                                color: customRegularGrey,
                                              ),
                                            ),
                                            onPressed: () async {
                                              await _getTransactionDetail();
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 500));

                                              if (transactionDetaiSendcount >
                                                  0) {
                                                print('udah ada send order');
                                                await dbHelper
                                                    .deleteTransactionDetailUnsend(
                                                        isTransactionNumber);
                                                await _getTransactionDetail();
                                                final activityDesc =
                                                    "Clear Transaction : ${isTransactionNumber}";
                                                final dateTime =
                                                    DateFormatter.format(
                                                        date: DateTime.now(),
                                                        pattern: DateFormatter
                                                            .fullDateTime);
                                                final pinStaff =
                                                    await localStorage
                                                        .getStaffPinId();
                                                await dbHelper.insertLogActLite(
                                                    dateTime,
                                                    isTransactionNumber,
                                                    deviceName,
                                                    activityDesc,
                                                    ipAddress,
                                                    "CLEAR TRANSACTION",
                                                    int.parse(pinStaff),
                                                    "system");
                                                _countTotal();
                                              } else {
                                                print('belum ada send order');
                                                _showConfirmDialog(context);
                                              }
                                            },
                                            child: Text(
                                              "Clear",
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                fontFamily: 'UbuntuBold',
                                                color: customBodyText,
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
                                                vertical: 20.h,
                                                horizontal: 20,
                                              ),
                                              minimumSize: const Size(100, 0),
                                              backgroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              side: BorderSide(
                                                width: 2,
                                                color: customRegularGrey,
                                              ),
                                            ),
                                            onPressed: () async {
                                              final grandTotalAfterTax =
                                                  grandTotalBeforeTax.toInt() +
                                                      tax.toInt();

                                              await dbHelper.updateTransactionHold(
                                                  isTransactionNumber,
                                                  subTotal.toInt(),
                                                  tax.toInt(),
                                                  "${_orderOfflineController.taxName.value} (${_orderOfflineController.taxPercent.value * 100}%)",
                                                  grandTotalBeforeTax.toInt(),
                                                  grandTotalAfterTax);

                                              Get.offAllNamed(
                                                  RouteName.topNavigation);
                                            },
                                            child: Text(
                                              "Hold",
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                fontFamily: 'UbuntuBold',
                                                color: customBodyText,
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
                                                vertical: 20.h,
                                                horizontal: 20,
                                              ),
                                              minimumSize: const Size(100, 0),
                                              backgroundColor:
                                                  transactionDetailList.isEmpty
                                                      ? Colors.white
                                                      : primaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              side: BorderSide(
                                                width: 2,
                                                color: transactionDetailList
                                                        .isEmpty
                                                    ? customRegularGrey
                                                    : primaryColor,
                                              ),
                                            ),
                                            onPressed: () async {
                                              final prefs =
                                                  await SharedPreferences
                                                      .getInstance();

                                              if (transactionDetailList
                                                  .isNotEmpty) {
                                                if (transactionDetailUnsend
                                                    .isEmpty) {
                                                  _printConfirmDialog();
                                                } else {
                                                  int grandTotalAfterTax =
                                                      grandTotalBeforeTax
                                                              .toInt() +
                                                          tax.toInt();

                                                  await dbHelper
                                                      .updateTransactionHold(
                                                          isTransactionNumber,
                                                          subTotal.toInt(),
                                                          tax.toInt(),
                                                          "${_orderOfflineController.taxName.value} (${_orderOfflineController.taxPercent.value * 100}%)",
                                                          grandTotalBeforeTax
                                                              .toInt(),
                                                          grandTotalAfterTax);

                                                  final primaryPrinter =
                                                      await localStorage
                                                          .getPrimaryPrinter();

                                                  for (var location
                                                      in stations) {
                                                    String station =
                                                        prefs.getString(location
                                                                .stationName) ??
                                                            "";

                                                    if (station.isNotEmpty) {
                                                      if (station ==
                                                          'to Primary') {
                                                        if (primaryPrinter
                                                                .first ==
                                                            'BluetoothPrinter') {
                                                          print(
                                                              'dataTrans:  ${isTransactionNumber} - ${primaryPrinter} - ${station}');
                                                          printDocket(
                                                              0,
                                                              isTransactionNumber,
                                                              location
                                                                  .stationID,
                                                              location
                                                                  .stationName,
                                                              tableLabel);
                                                          await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                          );
                                                        } else {
                                                          printDocketLan(
                                                              0,
                                                              isTransactionNumber,
                                                              primaryPrinter[1],
                                                              location
                                                                  .stationID,
                                                              location
                                                                  .stationName,
                                                              tableLabel);
                                                          await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                          );
                                                        }
                                                      } else {
                                                        printDocketLan(
                                                            0,
                                                            isTransactionNumber,
                                                            station,
                                                            location.stationID,
                                                            location
                                                                .stationName,
                                                            tableLabel);
                                                        await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  500),
                                                        );
                                                      }
                                                    }
                                                  }
                                                }
                                                await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 500),
                                                );
                                                await dbHelper
                                                    .updateTransactionDetailSend(
                                                        isTransactionNumber);
                                                _getTransactionDetail();
                                              }
                                            },
                                            child: Text(
                                              "Send",
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                fontFamily: 'UbuntuBold',
                                                color: transactionDetailList
                                                        .isEmpty
                                                    ? customBodyText
                                                    : Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 0, 16, 16),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                padding: EdgeInsets.all(0),
                                                shape: const CircleBorder(),
                                                minimumSize: const Size(50, 50),
                                                maximumSize: const Size(50, 50),
                                                backgroundColor: Colors.white,
                                                side: BorderSide(
                                                  width: 2,
                                                  color: transactionDetailUnsend
                                                              .isNotEmpty ||
                                                          transactionDetailList
                                                              .isEmpty ||
                                                          outletType == 'Quick'
                                                      ? customRegularGrey
                                                      : primaryColor,
                                                ),
                                              ),
                                              onPressed: outletType == 'Quick'
                                                  ? null
                                                  : () async {
                                                      if (transactionDetailUnsend
                                                              .isEmpty &&
                                                          transactionDetailList
                                                              .isNotEmpty) {
                                                        final primaryPrinter =
                                                            await localStorage
                                                                .getPrimaryPrinter();

                                                        if (primaryPrinter
                                                                .first ==
                                                            'BluetoothPrinter') {
                                                          print("print bill 1");
                                                          _printBillOfflineController
                                                              .printBillBluetooth(
                                                                  transactionNumber:
                                                                      isTransactionNumber);
                                                        } else {
                                                          print(
                                                              "print bill LAN 1");
                                                          print(primaryPrinter[
                                                              1]);
                                                          _printBillOfflineController
                                                              .printBillLan(
                                                                  transactionNumber:
                                                                      isTransactionNumber,
                                                                  printerIP:
                                                                      primaryPrinter[
                                                                          1]);
                                                        }
                                                      }
                                                    },
                                              child: Icon(
                                                Icons.receipt_long,
                                                size: 28.r,
                                                color: transactionDetailUnsend
                                                            .isNotEmpty ||
                                                        transactionDetailList
                                                            .isEmpty ||
                                                        outletType == 'Quick'
                                                    ? customRegularGrey
                                                    : primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 2.w),
                                        Expanded(
                                          flex: 7,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              minimumSize: const Size(500, 0),
                                              padding: EdgeInsets.symmetric(
                                                vertical: 20.h,
                                                horizontal: 20,
                                              ),
                                              backgroundColor: primaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              side: BorderSide(
                                                width: 2,
                                                color: transactionDetailList
                                                            .isEmpty ||
                                                        isWaiters
                                                    ? customRegularGrey
                                                    : primaryColor,
                                              ),
                                            ),
                                            onPressed: transactionDetailList
                                                    .isEmpty
                                                ? null
                                                : isWaiters
                                                    ? null
                                                    : () async {
                                                        final grandTotalAfterTax =
                                                            grandTotalBeforeTax
                                                                    .toInt() +
                                                                tax.toInt();

                                                        await dbHelper.updateTransactionHold(
                                                            isTransactionNumber,
                                                            subTotal.toInt(),
                                                            tax.toInt(),
                                                            "${_orderOfflineController.taxName.value} (${_orderOfflineController.taxPercent.value * 100}%)",
                                                            grandTotalBeforeTax
                                                                .toInt(),
                                                            grandTotalAfterTax);
                                                        await dbHelper
                                                            .updateTransactionDetailSend(
                                                                isTransactionNumber);

                                                        await _getTransactionByTrx(
                                                            trx:
                                                                isTransactionNumber);

                                                        fetchTransDataCountFromDetail =
                                                            _fetchTransactionDataCountFromDetail();

                                                        if (totalTrans > 0)
                                                          _navigateToPage(1);
                                                      },
                                            child: Text(
                                              "Pay • ${numberFormat('IDR', subTotal).toString()}",
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                fontFamily: 'UbuntuBold',
                                                color: transactionDetailList
                                                        .isEmpty
                                                    ? customBodyText
                                                    : Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : FutureBuilder(
                                future: fetchTransDataCountFromDetail,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    final controller = _orderOfflineController;

                                    int subTotal = snapshot.data[0]['subTotal'];
                                    int discount = discountTotals.toInt();
                                    int totalTax = ((subTotal - discount) *
                                            _orderOfflineController
                                                .taxPercent.value)
                                        .ceil();
                                    int rounding = !controller
                                            .isCheckedRound.value
                                        ? 0
                                        : bulatkanKe500(((subTotal - discount) +
                                                totalTax)) -
                                            ((subTotal - discount) + totalTax);
                                    int totalDue = !controller
                                            .isCheckedRound.value
                                        ? ((subTotal - discount) + totalTax)
                                        : bulatkanKe500(
                                            ((subTotal - discount) + totalTax));

                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 16, 16, 16),
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
                                                numberFormat('IDR', subTotal)
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
                                              Text(
                                                numberFormat('IDR', discount)
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontFamily: "UbuntuBold",
                                                  color: customHeadingText,
                                                ),
                                              ),
                                            ],
                                          ),
                                          _orderOfflineController
                                                      .taxPercent.value >
                                                  0
                                              ? Column(
                                                  children: [
                                                    const Divider(),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '${_orderOfflineController.taxName.value} (${_orderOfflineController.taxPercent.value * 100} %)',
                                                          style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontFamily:
                                                                "UbuntuBold",
                                                            color:
                                                                customHeadingText,
                                                          ),
                                                        ),
                                                        Text(
                                                          numberFormat('IDR',
                                                                  totalTax)
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontFamily:
                                                                "UbuntuBold",
                                                            color:
                                                                customHeadingText,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              : const SizedBox.shrink(),
                                          const Divider(),
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 0),
                                                child: Row(
                                                  children: [
                                                    Transform.scale(
                                                      scale: 0.8,
                                                      child: Checkbox(
                                                        value: controller
                                                            .isCheckedRound
                                                            .value,
                                                        onChanged:
                                                            (bool? value) {
                                                          setState(() {
                                                            controller
                                                                .isCheckedRound
                                                                .value = value!;
                                                          });
                                                        },
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Rounding',
                                                      style: TextStyle(
                                                        fontSize: 12.sp,
                                                        fontFamily:
                                                            "UbuntuBold",
                                                        color:
                                                            customHeadingText,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                numberFormat(
                                                        'IDR',
                                                        !controller
                                                                .isCheckedRound
                                                                .value
                                                            ? 0
                                                            : rounding.toInt())
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontFamily: "UbuntuBold",
                                                  color: primaryColor,
                                                ),
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
                                              Text(
                                                numberFormat('IDR', totalDue)
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontFamily: "UbuntuBold",
                                                  color: primaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            alignment: Alignment.center,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  minimumSize:
                                                      const Size(500, 0),
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 14.h,
                                                    horizontal: 20,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  backgroundColor: primaryColor,
                                                  foregroundColor:
                                                      Colors.white),
                                              onPressed: outletType == 'Quick'
                                                  ? null
                                                  : () async {
                                                      final primaryPrinter =
                                                          await localStorage
                                                              .getPrimaryPrinter();

                                                      if (primaryPrinter
                                                              .first ==
                                                          'BluetoothPrinter') {
                                                        print("print bill 2");
                                                        _printBillOfflineController
                                                            .printBillBluetooth(
                                                                transactionNumber:
                                                                    isTransactionNumber);
                                                      } else {
                                                        print(
                                                            "print bill LAN 2");
                                                        _printBillOfflineController
                                                            .printBillLan(
                                                                transactionNumber:
                                                                    isTransactionNumber,
                                                                printerIP:
                                                                    primaryPrinter[
                                                                        1]);
                                                      }
                                                    },
                                              child: Text(
                                                "Print Bill",
                                                style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontFamily: 'UbuntuBold',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return const SizedBox.shrink();
                                  }
                                },
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void _showConfirmDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Clear Order?')), // Centered title
          // actionsPadding: EdgeInsets.symmetric(horizontal: 0),
          contentPadding:
              EdgeInsets.only(top: 20, bottom: 20), // Optional: spacing control
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // ✅ Centered buttons
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                  },
                  child: Text('No'),
                ),
                SizedBox(width: 10), // Spacing between buttons
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    // isTransactionNumber = isTransactionNumber ?? '00';
                    final cekItem = await dbHelper.getTransactionDetailClear(
                        transactionNumber: isTransactionNumber);
                    final itemCount = cekItem.length;
                    await Future.delayed(const Duration(milliseconds: 500));
                    final dateTime = DateFormatter.format(
                        date: DateTime.now(),
                        pattern: DateFormatter.fullDateTime);
                    final pinStaff = await localStorage.getStaffPinId();
                    //kalau tidak ada detail yang di send maka trans number di hapus.
                    //tapi kalau ada detail yang di send maka trans number dan detail di buat cancel
                    if (itemCount > 0) {
                      await dbHelper
                          .updateTransactionCancel(isTransactionNumber);
                      await dbHelper
                          .updateTransactionDetailCancel(isTransactionNumber);
                      final activityDesc =
                          "Cancel Transaction : ${isTransactionNumber}";

                      await dbHelper.insertLogActLite(
                          dateTime,
                          isTransactionNumber,
                          deviceName,
                          activityDesc,
                          ipAddress,
                          "CANCEL TRANSACTION",
                          int.parse(pinStaff),
                          "system");
                    } else {
                      await dbHelper
                          .deleteTransactionUnsend(isTransactionNumber);
                      await dbHelper
                          .deleteTransactionDetailUnsend(isTransactionNumber);
                      final activityDesc =
                          "Clear Transaction : ${isTransactionNumber}";

                      await dbHelper.insertLogActLite(
                          dateTime,
                          isTransactionNumber,
                          deviceName,
                          activityDesc,
                          ipAddress,
                          "CLEAR TRANSACTION",
                          int.parse(pinStaff),
                          "system");
                    }

                    await _getTransactionDetail();
                    _countTotal();
                    await Future.delayed(const Duration(milliseconds: 500));
                    Navigator.of(context).pop();
                    Get.offAllNamed(RouteName.topNavigation);
                  },
                  child: Text('Yes'),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  void _onConfirm(context, response) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
              child: Text('Confirm deletion of this item?')), // Centered title
          // actionsPadding: EdgeInsets.symmetric(horizontal: 0),
          contentPadding:
              EdgeInsets.only(top: 20, bottom: 20), // Optional: spacing control
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // ✅ Centered buttons
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                  },
                  child: Text('No'),
                ),
                SizedBox(width: 10), // Spacing between buttons
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    await dbHelper
                        .upadateTransactionDetail(response.transactionDetailID);
                    await dbHelper.updateTransactionDetailAddOn(
                        response.transactionDetailID);

                    await Future.delayed(const Duration(milliseconds: 500));
                    await _getTransactionDetail();
                    final activityDesc =
                        "Cancel Menu Item id: ${response.menuID}";
                    final dateTime = DateFormatter.format(
                        date: DateTime.now(),
                        pattern: DateFormatter.fullDateTime);
                    final pinStaff = await localStorage.getStaffPinId();

                    await dbHelper.insertLogActLite(
                        dateTime,
                        isTransactionNumber,
                        deviceName,
                        activityDesc,
                        ipAddress,
                        "CANCEL ITEM",
                        int.parse(pinStaff),
                        "system");

                    _countTotal();
                    Navigator.of(context).pop();

                    // Get.offAllNamed(RouteName.topNavigation);
                  },
                  child: Text('Yes'),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  Widget cartList(response) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                response.menuName.toString(),
                maxLines: 2,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontFamily: 'NanumGothic',
                  overflow: TextOverflow.ellipsis,
                  color: customHeadingText,
                ),
              ),
            ),
            currentPageIndex == 0
                ? response.statusSend == 0 || isAdmin == true
                    ? InkWell(
                        onTap: () async {
                          if (response.statusSend == 0 || isAdmin == true) {
                            _onConfirm(context, response);
                          }
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
                      )
                : InkWell(
                    onTap: () async {
                      await dbHelper.updateTransactionDiscount(
                          isTransactionNumber, 0, '[]');

                      _countTotal();
                      _discountList(response.transactionDetailID,
                          response.menuPrice, response.menuID, response.qty);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: customRegularGrey,
                        border: Border.all(
                          color: customRegularGrey,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.fromLTRB(20.r, 2.r, 20.r, 2.r),
                      child: Icon(
                        Icons.percent,
                        color: Colors.black,
                        size: 16,
                      ),
                    ),
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
                currentPageIndex == 0
                    ? GestureDetector(
                        onTap:
                            response.statusSend == 0 && currentPageIndex == 0 ||
                                    isAdmin == true
                                ? () async {
                                    if (response.qty > 1) {
                                      setState(() {
                                        final newQty = response.qty - 1;
                                        final updated =
                                            response.copyWith(qty: newQty);

                                        _updateTransactionDetail(
                                          id: response.transactionDetailID,
                                          qty: updated.qty,
                                          notes: response.notes,
                                        );

                                        _countTotal();
                                      });
                                    }
                                  }
                                : null,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: response.statusSend == 0 &&
                                        currentPageIndex == 0 ||
                                    isAdmin == true
                                ? Colors.white
                                : customGrey2,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              width: 1,
                              color: customRegularGrey,
                            ),
                          ),
                          child: Icon(Icons.remove,
                              size: 15,
                              color: response.statusSend == 0 &&
                                          currentPageIndex == 0 ||
                                      isAdmin == true
                                  ? Colors.black
                                  : Colors.white),
                        ),
                      )
                    : const SizedBox.shrink(),
                currentPageIndex == 0
                    ? Container(
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
                      )
                    : Text(
                        response.qty.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'UbuntuBold',
                          color: customHeadingText,
                        ),
                      ),
                currentPageIndex == 0
                    ? GestureDetector(
                        onTap:
                            response.statusSend == 0 && currentPageIndex == 0 ||
                                    isAdmin == true
                                ? () async {
                                    setState(() {
                                      final newQty = response.qty + 1;
                                      final updated =
                                          response.copyWith(qty: newQty);

                                      _updateTransactionDetail(
                                        id: response.transactionDetailID,
                                        qty: updated.qty,
                                        notes: response.notes,
                                      );

                                      _countTotal();
                                    });
                                  }
                                : null,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: response.statusSend == 0 &&
                                        currentPageIndex == 0 ||
                                    isAdmin == true
                                ? primaryColor
                                : customGrey2,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              width: 1,
                              color: response.statusSend == 0 &&
                                          currentPageIndex == 0 ||
                                      isAdmin == true
                                  ? primaryColor
                                  : customGrey2,
                            ),
                          ),
                          child: const Icon(Icons.add,
                              size: 15, color: Colors.white),
                        ),
                      )
                    : Text("x"),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                response.discountDetail.length > 0
                    ? Text(
                        numberFormat('IDR', response.menuPrice * response.qty)
                            .toString(),
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
                  numberFormat(' IDR',
                          response.menuPriceAfterDiscount * response.qty)
                      .toString(),
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
        response.addOn.length > 0
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var value in response.addOn)
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
                                    value['menuName'],
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
                                    'IDR', value['menuPrice'] * response.qty)
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
        response.noteOption != ''
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 7.h),
                  Text(
                    "Note : ${response.noteOption.toString()}",
                    style: TextStyle(
                      fontSize: 7.5.sp,
                      fontFamily: 'NanumGothic',
                      color: customHeadingText,
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
        response.notes.isNotEmpty
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
                        onTap: response.statusSend > 0
                            ? null
                            : () async => await _popupUpdateNotes(
                                id: response.transactionDetailID,
                                qty: response.qty,
                                notes: response.notes),
                        child: response.statusSend > 0
                            ? const SizedBox.shrink()
                            : Icon(Icons.create_rounded,
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

  Widget _searchItem(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          focusNode: _orderOfflineController.searchFocusNode,
          controller: _orderOfflineController.searchController,
          onChanged: (value) {
            _orderOfflineController.filterMenuByParam(val: value.toLowerCase());
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
            prefixIcon: Icon(Icons.search, color: customHeadingText),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTab(BuildContext context, String title, int categoryId) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        _orderOfflineController.filterMenuByCategory(categoryId: categoryId);
      },
      child: Obx(() {
        final path = _orderOfflineController.pathImageTab[categoryId] ?? '';
        final file = File(path);
        final fileExists = path.isNotEmpty && file.existsSync();

        bool isSelected =
            categoryId == _orderOfflineController.selectedCategory.value;

        return Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            color: isSelected ? primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              width: 2,
              color: customRegularGrey,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              outletID != 0
                  ? categoryId == 0
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
                                  image: FileImage(file),
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
                  : const SizedBox.shrink(),
              SizedBox(width: 10.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 9.5.sp,
                  fontFamily: "UbuntuBold",
                  color: isSelected ? Colors.white : customHeadingText,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildMenuItem(
      {required int menuId,
      required String menuName,
      required String menuDesc,
      required String menuImage,
      required int menuPrice,
      String? menuAddOn,
      String? menuNotes}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          qtyItemDetail = 1;
          selectedNoteIndex = -1;
          selectedAddonID = -1;
          selectedAddonPerCategory.clear();
        });

        _popupAddItem(
            menuId,
            menuName,
            menuDesc,
            _orderOfflineController.pathImageMenu[menuId],
            menuImage,
            menuPrice,
            menuAddOn,
            menuNotes);
      },
      child: Obx(() {
        final path = _orderOfflineController.pathImageMenu[menuId] ?? '';
        final file = File(path);
        final fileExists = path.isNotEmpty && file.existsSync();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: fileExists
                    ? Image.file(
                        file,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )
                    : Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          menuName,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "UbuntuBold",
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800),
                          textAlign: TextAlign.center,
                        )),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              menuName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'UbuntuBold',
                fontSize: 18,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5),
            Text(
              numberFormat('IDR', menuPrice),
              style: TextStyle(
                color: primaryColor,
                fontFamily: 'UbuntuBold',
                fontSize: 16,
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildTextNotes(BuildContext context) {
    return TextField(
      controller: notesController,
      focusNode: notesFocusNode,
      maxLines: 2,
      decoration: InputDecoration(
        filled: true,
        fillColor: customLightGrey,
        labelText: 'Notes',
        hintText: "Example: Less ice",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 1,
            color: customLightGrey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 1,
            color: customLightGrey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 1,
            color: customRed1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 1,
            color: customLightGrey,
          ),
        ),
      ),
    );
  }

  String _formatTime(String? dateTime) {
    if (dateTime == null || dateTime.isEmpty) return "-";

    final dt = DateTime.parse(dateTime);

    return "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}:${dt.second.toString().padLeft(2, '0')}";
  }
}
