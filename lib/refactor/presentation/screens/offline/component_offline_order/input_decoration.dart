import 'package:flutter/material.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

InputDecoration inputDecoration({required String hint, bool hasError = false}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
    filled: true,
    fillColor: customLightGrey,
    hintText: hint,
    hintStyle: TextStyle(
      fontFamily: 'NanumGothic',
      color: customBodyText,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(color: customLightGrey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(color: customLightGrey),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(color: customRed1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(color: customLightGrey),
    ),
    errorText: hasError ? '$hint cannot be empty' : null,
  );
}
