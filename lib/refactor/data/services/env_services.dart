import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get filename {
    if (kReleaseMode) {
      return "assets/.env.production";
    } else {
      return "assets/.env.production";
    }
  }

  static String get apiUrl {
    return dotenv.env['API_BASE_URL'] ?? 'API_BASE_URL not found!';
  }

  static String get basePath {
    return dotenv.env['BASE_PATH_URL_IMG'] ?? 'BASE_PATH_URL_IMG not found!';
  }

  static String get debugMode {
    return dotenv.env['DEBUG'] ?? '';
  }
}