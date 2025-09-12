import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final double percentage;

  const DashboardCard({super.key, required this.title, required this.value, this.percentage = 0.0});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(30.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
              style: TextStyle(
                fontSize: 9.sp,
                fontFamily: "UbuntuBold",
                color: customBodyText,
              ),
            ),
            const SizedBox(height: 8),
            Text(value,
              style: TextStyle(
                fontSize: 11.sp,
                fontFamily: "UbuntuBold",
                color: customHeadingText,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 8.0
                  ),
                  decoration: BoxDecoration(
                    color: percentage == 0.0 ? Colors.black45 : percentage < 0.0 ? Colors.red : primaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(percentage == 0.0 ? Icons.remove : percentage < 0.0 ? Icons.arrow_downward : Icons.arrow_upward, size: 10.sp, color: Colors.white),
                      const SizedBox(width: 5.0),
                      Text("$percentage%",
                        style: TextStyle(
                          fontSize: 8.sp,
                          color: Colors.white,
                          fontFamily: "UbuntuBold",
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
