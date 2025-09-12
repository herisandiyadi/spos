import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_sync_data.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class SyncRowItem extends StatelessWidget {
  final String title;
  final RxMap<SyncStatus, SyncProcessState> syncState;
  final SyncStatus syncKey;
  final String syncType;
  final void Function({required int data, required String type}) onRefresh;

  const SyncRowItem({
    super.key,
    required this.title,
    required this.syncState,
    required this.syncKey,
    required this.syncType,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$title ",
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: "UbuntuBold",
            color: customHeadingText,
          ),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              final state = syncState[syncKey];

              Widget icon;
              switch (state) {
                case SyncProcessState.loading:
                  icon = SizedBox(
                    height: 18.0,
                    width: 18.0,
                    child: CircularProgressIndicator(
                      color: primaryColor,
                      strokeCap: StrokeCap.round,
                    ),
                  );
                  break;
                case SyncProcessState.success:
                  icon = Icon(CupertinoIcons.checkmark_alt_circle_fill, color: Colors.green);
                  break;
                case SyncProcessState.failure:
                  icon = Icon(CupertinoIcons.clear_circled_solid, color: Colors.red);
                  break;
                default:
                  icon = const SizedBox.shrink();
              }

              return Row(
                children: [
                  icon,
                  IconButton(
                    icon: Icon(Icons.refresh_outlined, color: primaryColor),
                    onPressed: () => onRefresh(data: 1, type: syncType),
                  ),
                ],
              );
            }),
          ],
        ),
      ],
    );
  }
}
