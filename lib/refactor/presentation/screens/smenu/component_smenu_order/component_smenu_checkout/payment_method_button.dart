import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_payment_method/g_payment_method.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class PaymentMethodButton extends StatelessWidget {
  final bool isOther;
  final PaymentMethodLiteModel method;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodButton({
    super.key,
    required this.isOther,
    required this.method,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(
            width: 2,
            color: isSelected ? primaryColor : customRegularGrey,
          ),
        ),
        backgroundColor: isSelected ? primaryColor : Colors.white,
        foregroundColor: isSelected ? Colors.white : customBodyText,
      ),
      child: Text(isOther ? 'Others' : method.paymentMethodName,
        style: TextStyle(
          fontSize: 11.sp,
          fontFamily: 'UbuntuBold',
          color: isSelected ? Colors.white : customBodyText,
        ),
      ),
    );
  }
}
