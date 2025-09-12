import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class LoaderGeneral {
  static void show({String? message, required String tag}) {
    SmartDialog.show(
      tag: tag,
      alignment: Alignment.center,
      clickMaskDismiss: false,
      keepSingle: true,
      usePenetrate: false,
      useSystem: false,
      permanent: false,
      useAnimation: true,
      bindPage: true,
      backType: SmartBackType.block,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: message != null ? 20.0 : 30.0, vertical: 30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    color: primaryColor,
                    strokeWidth: 6.0,
                    strokeCap: StrokeCap.round,
                  ),
            
                  message != null ? Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(message, style: const TextStyle(color: Colors.black)),
                  ) : const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        );
      }
    );
  }

  static void hide({required String tag}) {
    SmartDialog.dismiss(tag: tag);
  }
}