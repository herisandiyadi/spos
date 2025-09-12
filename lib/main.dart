import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';
import 'package:squadra_pos/refactor/data/dependency.dart';
import 'package:squadra_pos/refactor/data/services/env_services.dart';
import 'package:squadra_pos/refactor/presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Dependency.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);

  HttpOverrides.global = MyHttpOverrides();

  await dotenv.load(fileName: Environment.filename);

  runApp(App());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);

    if (kDebugMode)
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

    return client;
  }
}
