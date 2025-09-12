import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class LoaderTable extends StatelessWidget {
  const LoaderTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: {
        6: FixedColumnWidth(150.r),
        7: FixedColumnWidth(100.r),
      },
      children: List.generate(7, (index) {
        return TableRow(
          decoration: BoxDecoration(
            color: customBackground,
          ),
          children: List.generate(8, (colIndex) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade200,
                child: Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}