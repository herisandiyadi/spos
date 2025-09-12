import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/presentation/controllers/c_initial.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({super.key});

  final splashController = Get.find<InitialController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: SizedBox(
        height: size.height,
        child: Center(
          child: Hero(
            tag: "Splash Screen",
            child: Image.asset("assets/images/logoText.png", width: size.width * 0.15),
          ),
        ),
      ),
    );
  }
}