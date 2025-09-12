import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_menu/g_menu.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_order.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';

class SMItemDescription extends StatelessWidget {
  SMItemDescription({required this.data, required this.transaction, super.key});

  final MenuLiteModel data;
  final Map<String, dynamic> transaction;
  final transactionSMOrderController = Get.find<TransactionOrderSMController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pathImage = transactionSMOrderController.menuImagePath[data.menuID];
    final fileExists = pathImage != null && File(pathImage).existsSync();

    final addOnList = jsonDecode(data.addOn ?? '');
    final noteOptionList = jsonDecode(data.noteOption ?? '');

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
                          child: fileExists ? Image.file(File(pathImage),
                            height: 200,
                            fit: BoxFit.cover,
                          ) : Text(data.menuName,
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "UbuntuBold",
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(data.menuName,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'UbuntuBold',
                          color: customHeadingText,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(data.menuDesc,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 8.sp,
                          fontFamily: 'NanumGothic',
                          color: customBodyText,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(numberFormat('IDR', data.menuPrice).toString(),
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
                            onTap: () => transactionSMOrderController.createDecrementQtyItem(),
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
                              child: const Icon(Icons.remove,
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
                            child: Obx(() {
                              return Text(transactionSMOrderController.qtyItemDetail.toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'UbuntuBold',
                                  color: customHeadingText,
                                ),
                              );
                            }),
                          ),
                          GestureDetector(
                            onTap: () => transactionSMOrderController.createIncrementQty(),
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
                              child: const Icon(Icons.add,
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
                  flex: 2,
                  child: SizedBox(
                    height: 450.h,
                    width: 10,
                    child: ListView(
                      children: [
                        // :: AddOn Header
                        ...(addOnList.isNotEmpty? addOnList.map((addOnHead) {
                          String key = addOnHead['title'].toString();

                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(addOnHead['title'],
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontFamily: 'UbuntuBold',
                                        color: Colors.black,
                                      ),
                                    ),
                                    addOnHead['required'] == 1 ? addOnHead['multiply'] == 1 && addOnHead['min'] > 1 ? Text('(Required ${addOnHead['min']})',
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        fontFamily: 'NanumGothic',
                                        color: customRed1,
                                      ),
                                    ) : Text('(Required)',
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        fontFamily: 'NanumGothic',
                                        color: customRed1,
                                      ),
                                    ) : const SizedBox.shrink(),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                // :: AddOn List
                                ...addOnHead['MenuAddOn'].map<Widget>((addOnRes) {
                                  int menuID = int.parse(addOnRes['MenuID']);

                                  return Container(
                                    padding: EdgeInsets.symmetric(vertical: 6),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        // :: Menu name
                                        Expanded(
                                          child: Text(
                                            addOnRes['MenuName'].toString(),
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontFamily: 'NanumGothic',
                                              color: customBodyText,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8.0),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text("+ ${numberFormat('IDR', int.parse(addOnRes['MenuPrice']))}",
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                fontFamily: 'NanumGothic',
                                                color: customBodyText,
                                              ),
                                            ),
                                            const SizedBox(width: 3.0),

                                            // Checkbox or Radio
                                            addOnHead['multiply'] == 1 ? Theme(
                                              data: Theme.of(context).copyWith(
                                                checkboxTheme: CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(6),
                                                  ),
                                                  visualDensity: VisualDensity.compact,
                                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                ),
                                              ),
                                              child: Obx(() {
                                                final isChecked = transactionSMOrderController.selectedAddonPerCategory[key]?.contains(menuID) ?? false;

                                                return Checkbox(
                                                  value: isChecked,
                                                  activeColor: primaryColor,
                                                  onChanged: (checked) {
                                                    if (checked != null) transactionSMOrderController.toggleAddon(key, menuID, checked);
                                                  },
                                                );
                                              }),
                                            ) : Obx(() {
                                              final selectedSet = transactionSMOrderController.selectedAddonPerCategory[key];
                                              final selectedValue = selectedSet?.isNotEmpty == true ? selectedSet!.first : null;

                                              return Radio<int>(
                                                value: menuID,
                                                groupValue: selectedValue,
                                                activeColor: primaryColor,
                                                visualDensity: VisualDensity.compact,
                                                onChanged: (value) {
                                                  if (value != null) transactionSMOrderController.selectSingleAddon(key, value);
                                                },
                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                              );
                                            }),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                          );
                        }).toList() : []),
                        
                        addOnList.length > 0 && noteOptionList.length > 0 ? const Column(
                          children: [
                            Divider(),
                            SizedBox(height: 15),
                          ],
                        ) : const SizedBox.shrink(),

                        // :: Note Options
                        noteOptionList.length > 0 ? Text('Note Option',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontFamily: 'UbuntuBold',
                            color: Colors.black,
                          ),
                        ) : const SizedBox.shrink(),
                        
                        ...noteOptionList.asMap().entries.map((noteRes) {
                          int index = noteRes.key + 1;

                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            visualDensity: const VisualDensity(
                              vertical: -4,
                              horizontal: 0, 
                            ),
                            title: Text(noteRes.value.toString(),
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: 'NanumGothic',
                                color: customBodyText,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min, 
                              children: [
                                // Text('',
                                //   style: TextStyle(
                                //     fontSize: 16,
                                //     fontFamily: 'NanumGothic',
                                //     color:customBodyText,
                                //   ),
                                // ),
                                Obx(() {
                                  return Radio(
                                    value: index,
                                    groupValue: transactionSMOrderController.selectedNoteIndex.value,
                                    activeColor: primaryColor,
                                    onChanged: (value) {
                                      if (value != null) transactionSMOrderController.updateSelectedNoteIndex(value);
                                    },
                                  );
                                }),
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
            Align(
              alignment: Alignment.centerRight,
              child: Obx(() {
                final state = transactionSMOrderController.status.value;

                if (state.isError) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0
                    ),
                    child: Text(state.errorMessage ?? '',
                      style: TextStyle(
                        fontSize: 8.sp,
                        color: customRed1,
                        fontFamily: 'NanumGothic',
                      ),
                    ),
                  );
                }
                return const SizedBox(height: 20);
              }),
            ),
            _buildTextNotes(context),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async => await transactionSMOrderController.addToCartCall(addOn: addOnList, menu: data, transaction: transaction),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                minimumSize: Size((size.width / 1.5), 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Obx(() {
                final qty = transactionSMOrderController.qtyItemDetail.value;

                return  Text("Add • ${numberFormat('IDR', qty * data.menuPrice).toString()} ",
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: 'UbuntuBold',
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextNotes(BuildContext context) {
    return TextField(
      controller: transactionSMOrderController.notesController,
      focusNode: transactionSMOrderController.notesFocusNode,
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
}