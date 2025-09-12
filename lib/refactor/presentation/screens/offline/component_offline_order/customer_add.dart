// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_customer/g_customer.dart';
// import 'package:squadra_pos/refactor/presentation/controllers/home/offline/request/c_add_customer.dart';
// import 'package:squadra_pos/refactor/presentation/screens/offline/component_offline_order/input_decoration.dart';
// import 'package:squadra_pos/refactor/utils/constants.dart';

// class CustomerAdd extends StatelessWidget {
//   CustomerAdd({super.key});

//   final _addCustomerController = Get.find<AddCustomerController>();

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(30),
//         side: BorderSide(
//           color: customBlue1,
//         ),
//       ),
//       backgroundColor: Colors.white,
//       titlePadding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
//       insetPadding: const EdgeInsets.all(15),
//       contentPadding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
//       actionsPadding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
//       content: SingleChildScrollView(
//         child: Column(
//           children: [
//             Autocomplete<CustomerLiteModel>(
//               optionsBuilder: (TextEditingValue textEditingValue) {
//                 final query = textEditingValue.text.toLowerCase();

//                 if (query.isEmpty) {
//                   return const Iterable<CustomerLiteModel>.empty();
//                 }

//                 final filtered = customers.where((c) => c.fullname.toLowerCase().contains(query));

//                 final unique = <String, CustomerLiteModel>{};

//                 for (var c in filtered) {
//                   unique[c.fullname] = c; 
//                 }

//                 return unique.values;
//               },
//               displayStringForOption: (CustomerLiteModel option) => option.fullname,
//               onSelected: (CustomerLiteModel selection) async {
//                 setState(() {
//                   final provinceId = selection.provinceID ?? 0;
//                   final cityId = selection.cityID ?? 0;

//                   if (provinceId > 0) {
//                     selectedProvince = provinceId;
//                     selectedCity = cityId;
//                   }

//                   customerCode = selection.customerCode;
//                   fullNameController.text = selection.fullname;
//                   emailController.text = selection.email ?? '';
//                   mobileNoController.text = selection.mobileNo ?? '';
//                   birthDateController.text = selection.birthDate ?? '';
//                   addressController.text = selection.address ?? '';
//                 });

//                 await _getCity(id: selection.provinceID ?? 0);
//               },
//               fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
//                 return TextField(
//                   controller: controller,
//                   focusNode: focusNode,
//                   decoration: InputDecoration(
//                     contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
//                     labelText: 'Search Customer',
//                     labelStyle: TextStyle(
//                       fontFamily: 'NanumGothic',
//                       color: customBodyText,
//                     ),
//                     filled: true,
//                     fillColor: customLightGrey,
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(50),
//                       borderSide: BorderSide(
//                         width: 1,
//                         color: customLightGrey,
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(50),
//                       borderSide: BorderSide(
//                         width: 1,
//                         color: customLightGrey, 
//                       ),
//                     ),
//                   ),
//                 );
//               },
//               optionsViewBuilder: (context, onSelected, options) {
//                 return Align(
//                   alignment: Alignment.topLeft,
//                   child: Material(
//                     color: Colors.white,
//                     elevation: 1,
//                     borderRadius: BorderRadius.circular(30),
//                     child: SizedBox(
//                       width: 400.w,
//                       child: ListView.builder(
//                         padding: EdgeInsets.zero,
//                         shrinkWrap: true,
//                         itemCount: options.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           final CustomerLiteModel option = options.elementAt(index);
//                           return ListTile(
//                             title: Text(option.fullname,
//                               style: TextStyle(
//                                 fontFamily: 'NanumGothic',
//                               ),
//                             ),
//                             onTap: () => onSelected(option),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//             SizedBox(height: 10.h),
//             Opacity(opacity: 0.2, child: Divider()),
//             SizedBox(height: 10.h),
//             Center(
//               child: Text("Add New Customer",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: customHeadingText,
//                   fontSize: 14.sp,
//                   fontFamily: "NanumGothic",
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.h),
//             SizedBox(
//               width: 500.w,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: _buildTextField(
//                       controller: _addCustomerController.fullNameController,
//                       hint: 'Full Name',
//                       readOnly: _addCustomerController.customerCode.isNotEmpty,
//                       hasError: _addCustomerController.validateFullName,
//                     ),
//                   ),
//                   SizedBox(width: 10.w),
//                   Expanded(
//                     child: _buildTextField(
//                       controller: _addCustomerController.emailController,
//                       hint: 'Email',
//                       readOnly: _addCustomerController.customerCode.isNotEmpty,
//                     ),
//                   ),
//                   SizedBox(width: 10.w),
//                   Expanded(
//                     child: _buildTextField(
//                       controller: _addCustomerController.mobileNoController,
//                       hint: 'Mobile No',
//                       readOnly: _addCustomerController.customerCode.isNotEmpty,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20.h),
//             SizedBox(
//               width: 500.w,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: _buildTextField(
//                       controller: _addCustomerController.birthDateController,
//                       hint: 'Date of Birth',
//                       onTap: _addCustomerController.customerCode.isEmpty ? () => _selectDate(context) : null,
//                       readOnly: true,
//                     ),
//                   ),
//                   SizedBox(width: 10.w),
//                   Expanded(
//                     child: _buildDropdown(
//                       items: _addCustomerController.provinceList.map((e) => DropdownMenuItem<int>(
//                         value: e.provinceID,
//                         child: Text(e.provinceName),
//                       )).toList(),
//                       value: _addCustomerController.selectedProvince.value,
//                       hint: "Province",
//                       isLoading: provinceLoading,
//                       onChanged: _addCustomerController.customerCode.isEmpty ? (val) async {
//                         selectedProvince = val ?? 0;
//                         selectedCity = 0;
//                         cityList.clear();

//                         await _getCity(id: val ?? 0);
//                       } : null,
//                     ),
//                   ),
//                   SizedBox(width: 10.w),
//                   Expanded(
//                     child: _buildDropdown(
//                       items: cityList.map((e) => DropdownMenuItem<int>(
//                         value: e.cityID,
//                         child: Text(e.cityName),
//                       )).toList(),
//                       value: selectedCity,
//                       hint: "City",
//                       isLoading: cityLoading,
//                       onChanged: customerCode.isEmpty ? (val) {
//                         setState(() {
//                           selectedCity = val ?? 0;
//                         });
//                       } : null,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20.h),
//             SizedBox(
//               width: 500.w,
//               child: _buildTextField(
//                 controller: addressController,
//                 hint: 'Address',
//                 readOnly: customerCode.isNotEmpty,
//               ),
//             ),
//           ],
//         ),
//       ),
//       actions: <Widget>[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white,
//                 foregroundColor: Colors.black,
//                 minimumSize: const Size(100, 50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//                 side: BorderSide(
//                   width: 2,
//                   color: customRegularGrey, 
//                 ),
//               ),
//               onPressed: () => Get.back(),
//               child: Text("Cancel",
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontFamily: "UbuntuBold",
//                 ),
//               ),
//             ),
//             SizedBox(width: 10.w),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 elevation: 0,
//                 minimumSize: const Size(100, 50),
//                 backgroundColor: primaryColor,
//                 foregroundColor: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//               ),
//               onPressed: () async {
//                 setState(() {
//                   fullNameController.text.isEmpty ? validateFullName = true : validateFullName = false;
//                 });

//                 if (!validateFullName) await _insertCustomer(code: customerCode);
//               },
//               child: Text(customerCode.isEmpty ? "Save" : "Assign",
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontFamily: "UbuntuBold",
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildTextField({required TextEditingController controller, required String hint, bool readOnly = false, bool hasError = false, VoidCallback? onTap}) {
//     return TextField(
//       controller: controller,
//       readOnly: readOnly || onTap != null,
//       onTap: onTap,
//       style: const TextStyle(color: Colors.black),
//       decoration: inputDecoration(hint: hint, hasError: hasError),
//     );
//   }

//   Widget _buildDropdown({required List<DropdownMenuItem<int>> items, required int? value, required String hint, void Function(int?)? onChanged, bool isLoading = false}) {
//     return Container(
//       height: 60,
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       decoration: BoxDecoration(
//         color: customLightGrey,
//         border: Border.all(color: customLightGrey),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton2<int>(
//           isExpanded: true,
//           hint: Text(hint, style: const TextStyle(fontFamily: 'NexaRegular', color: Colors.grey)),
//           value: value,
//           items: isLoading ? [
//             const DropdownMenuItem<int>(
//               value: null,
//               enabled: false,
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: 18,
//                     height: 18,
//                     child: CircularProgressIndicator(strokeWidth: 2),
//                   ),
//                   SizedBox(width: 10),
//                   Text("Loading..."),
//                 ],
//               ),
//             ),
//           ] : items,
//           onChanged: onChanged,
//           dropdownStyleData: DropdownStyleData(
//             width: 300,
//             maxHeight: 200,
//             padding: const EdgeInsets.all(10),
//             offset: const Offset(-20, -10),
//             decoration: BoxDecoration(
//               color: customLightGrey.withAlpha(230),
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }