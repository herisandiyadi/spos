import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squadra_pos/refactor/presentation/widgets/internet_status_widget.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class BottomInfoBar extends StatelessWidget {
  final RxString printerLabel;
  final RxString versionNumber;

  const BottomInfoBar(
      {super.key, required this.printerLabel, required this.versionNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 15.0,
          ),
          alignment: Alignment.bottomRight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(() {
                    return Text(
                      "v ${versionNumber.value}",
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontFamily: 'NanumGothic',
                        color: customHeadingText,
                      ),
                    );
                  }),
                ],
              ),
              Obx(() {
                return Text(
                  printerLabel.value,
                  style: TextStyle(
                    fontSize: 8.sp,
                    fontFamily: 'NanumGothic',
                    color: customHeadingText,
                  ),
                );
              })
            ],
          ),
        ),
      ],
    );
  }
}
