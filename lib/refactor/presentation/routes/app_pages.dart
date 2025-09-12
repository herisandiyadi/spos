import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/pos/success_page.dart';
import 'package:squadra_pos/refactor/domain/bindings/b_offline_check_out.dart';
import 'package:squadra_pos/refactor/domain/bindings/b_sm_checkout.dart';
import 'package:squadra_pos/refactor/domain/bindings/b_offline_order.dart';
import 'package:squadra_pos/refactor/domain/bindings/b_sm_order.dart';
import 'package:squadra_pos/refactor/domain/bindings/b_screen_lock.dart';
import 'package:squadra_pos/refactor/domain/bindings/b_sign_in.dart';
import 'package:squadra_pos/refactor/presentation/screens/auth/screen_lock.dart';
import 'package:squadra_pos/refactor/presentation/screens/auth/sign_in.dart';
import 'package:squadra_pos/refactor/presentation/screens/offline/offline_order.dart';
import 'package:squadra_pos/refactor/presentation/screens/smenu/component_smenu_order/smenu_checkout.dart';
import 'package:squadra_pos/refactor/presentation/screens/smenu/component_smenu_order/smenu_payment_success.dart';
import 'package:squadra_pos/refactor/presentation/screens/smenu/smenu_order.dart';
import 'package:squadra_pos/refactor/presentation/screens/top_navigation.dart';
import 'package:squadra_pos/refactor/domain/bindings/b_top_navigation.dart';
import 'package:squadra_pos/refactor/domain/bindings/b_splash.dart';
import 'package:squadra_pos/refactor/presentation/routes/app_routes.dart';
import 'package:squadra_pos/refactor/presentation/screens/splash_screen.dart';

class AppPages {
  static final pages = [
    // :: Splash
    GetPage(
      name: RouteName.splash, 
      page: () => SplashScreenPage(),
      binding: SplashBinding(),
      transition: Transition.cupertino,
      curve: Curves.fastEaseInToSlowEaseOut,
      showCupertinoParallax: false
    ),

    // :: Auth
    GetPage(
      name: RouteName.signIn, 
      page: () => SignInPage(),
      binding: SignInBinding(),
      transition: Transition.cupertino,
      curve: Curves.fastEaseInToSlowEaseOut,
      showCupertinoParallax: false
    ),
    GetPage(
      name: RouteName.screenLock, 
      page: () => ScreenLockPage(),
      binding: ScreenLockBinding(),
      transition: Transition.cupertino,
      curve: Curves.fastEaseInToSlowEaseOut,
      showCupertinoParallax: false
    ),

    // :: Home
    GetPage(
      name: RouteName.topNavigation, 
      page: () => TopNavigationBar(),
      binding: TopNavigationBinding(),
      transition: Transition.noTransition,
      curve: Curves.fastEaseInToSlowEaseOut,
      showCupertinoParallax: false
    ),

    // :: Order SMenu
    GetPage(
      name: RouteName.orderSM, 
      page: () => SMOrderPage(),
      binding: SMOrderBinding(),
      transition: Transition.cupertino,
      curve: Curves.fastEaseInToSlowEaseOut,
      showCupertinoParallax: false,
      arguments: Get.arguments
    ),
    GetPage(
      name: RouteName.checkOutSM, 
      page: () => SMCheckoutPage(),
      binding: SMCheckOutBinding(),
      transition: Transition.cupertino,
      curve: Curves.fastEaseInToSlowEaseOut,
      showCupertinoParallax: false,
      arguments: Get.arguments
    ),
    GetPage(
      name: RouteName.successPaymentSM, 
      page: () => SMPaymentSuccessPage(),
      transition: Transition.cupertino,
      curve: Curves.fastEaseInToSlowEaseOut,
      showCupertinoParallax: false,
      arguments: Get.arguments
    ),
    // :: Order Offline
    GetPage(
      name: RouteName.orderOffline, 
      page: () => OfflineOrderPage(),
      binding: OfflineOrderBinding(),
      transition: Transition.cupertino,
      curve: Curves.fastEaseInToSlowEaseOut,
      showCupertinoParallax: false,
      arguments: Get.arguments
    ),

    // :: Report Summary
    // GetPage(
    //   name: RouteName.reportSummary, 
    //   page: () => const SuccessPage(),
    //   transition: Transition.cupertino,
    //   curve: Curves.fastEaseInToSlowEaseOut,
    //   showCupertinoParallax: false,
    //   arguments: Get.arguments
    // ),

    // :: Payment Success
    GetPage(
      name: RouteName.successPaymentOffline, 
      page: () => SuccessPage(),
      binding: OfflineCheckOutBinding(),
      transition: Transition.cupertino,
      curve: Curves.fastEaseInToSlowEaseOut,
      showCupertinoParallax: false,
      arguments: Get.arguments
    ),
  ];
}