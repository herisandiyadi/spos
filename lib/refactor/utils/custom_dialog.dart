import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class CustomDialog {
  static void show(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          titlePadding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          insetPadding: const EdgeInsets.all(15),
          contentPadding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
          actionsPadding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Center(
            child: Icon(Icons.warning,
              size: 50,
              color: primaryColor,
            ),
          ),
          content: Text(message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'NanumGothic',
            ),
          ),
          actions: <Widget>[
            Center(
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(80, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () => Get.back(),
                  child: const Text('Ok',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'UbuntuBold',
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}