// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:squadra_pos/database/database_helper.dart';
// import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_city/g_city.dart';
// import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_customer/g_customer.dart';
// import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_province/g_province.dart';
// import 'package:squadra_pos/refactor/presentation/screens/offline/component_offline_order/customer_add.dart';

// class AddCustomerController extends GetxController {
//   final _dbHelper = DatabaseHelper();

//   final cityList = <CityLiteModel>[].obs;
//   final provinceList = <ProvinceLiteModel>[].obs;
//   final customerList = <CustomerLiteModel>[].obs;
  
//   Rxn<CustomerLiteModel> selectedCustomer = Rxn<CustomerLiteModel>();
//   RxInt selectedProvince = 0.obs;
//   RxInt selectedCity = 0.obs;

//   final provinceLoading = false.obs;
//   final cityLoading = false.obs;

//   final searchCustomerController = TextEditingController();
//   final fullNameController = TextEditingController();
//   final emailController = TextEditingController();
//   final mobileNoController = TextEditingController();
//   final birthDateController = TextEditingController();
//   final addressController = TextEditingController();

//   String customerCode = "";

//   Future<void> _getCity({required int provinceId}) async {
//     final results = await _dbHelper.getCityByProvinceId(provinceId: provinceId);

//     cityList.assignAll(results);
//   }

//   Future<void> _getProvince() async {
//     final results = await _dbHelper.getProvince();

//     provinceList.assignAll(results);
//   }
  
//   Future<void> _getCustomer() async {
//     final results = await _dbHelper.getCustomer();

//     customerList.assignAll(results);
//   }

//   void addCustomer() {
//     showDialog(
//       context: Get.context!,
//       barrierDismissible: true,
//       builder: (BuildContext context) {
//         return CustomerAdd();
//       }
//     );
//   }

//   @override
//   void onInit() {
//     super.onInit();

//     _getProvince();
//     _getCustomer();
//   }
// }