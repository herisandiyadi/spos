import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_order.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class SMNotesDescription extends StatelessWidget {
  SMNotesDescription({required this.cartDetailId, required this.uniqueNumber, super.key, this.notes, required this.qty});

  final int cartDetailId;
  final int uniqueNumber;
  final String? notes;
  final int qty;

  final transactionOrderSMController = Get.find<TransactionOrderSMController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    transactionOrderSMController.notesController.text = notes ?? "";

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
              onPressed: () async {
                Get.back();

                await transactionOrderSMController.updateItemCall(cartDetailId: cartDetailId, qty: qty, uniqueNumber: uniqueNumber);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                minimumSize: Size(double.infinity, 50),
                backgroundColor: primaryColor,
              ),
              child: Text("Save",
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
  }

  Widget _buildTextNotes(BuildContext context) {
    return TextField(
      controller: transactionOrderSMController.notesController,
      focusNode: transactionOrderSMController.notesFocusNode,
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