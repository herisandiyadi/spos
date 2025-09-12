import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/data/services/env_services.dart';
import 'package:squadra_pos/refactor/presentation/controllers/auth/c_auto_lock.dart';
import 'package:squadra_pos/refactor/presentation/routes/app_pages.dart';
import 'package:squadra_pos/refactor/presentation/routes/app_routes.dart';

class App extends StatelessWidget {
  App({super.key});

  final _localStorage = Get.find<LocalStorage>();
  final _autoLockController = Get.find<AutoLockController>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(768, 1024),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          getPages: AppPages.pages,
          initialRoute: RouteName.splash,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: const Locale('id', 'ID'),
          supportedLocales: const [
            Locale('id', 'ID'),
            Locale('en', 'US'),
          ],
          builder: (context, child) {
            return Listener(
              behavior: HitTestBehavior.translucent,
              onPointerDown: (_) async {
                if (!await _localStorage.getScreenLocked()) {
                  debugPrint("User interaction detected, reset timer");
                  _autoLockController.resetTimer();
                }
              },
              child: FlutterSmartDialog.init()(context, child),
            );
          },
          navigatorObservers: [FlutterSmartDialog.observer],
          transitionDuration: const Duration(milliseconds: 500),
          debugShowCheckedModeBanner: bool.parse(Environment.debugMode),
        );
      },
    );
  }
}
