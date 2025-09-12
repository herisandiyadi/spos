import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';

class InternetController extends GetxController {
  /// Observable connection status
  final RxBool isConnected = false.obs;

  /// Internal debouncer
  Timer? _debounceTimer;

  /// Periodic timer for real-time checking
  Timer? _periodicTimer;

  @override
  void onInit() {
    super.onInit();
    // Start periodic check every 2 seconds
    _periodicTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      _check();
    });
    // Optionally, check immediately on start
    _check();
  }

  /// Check connection with debouncing (default 2 seconds)
  void checkConnection({Duration debounce = const Duration(seconds: 2)}) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(debounce, _check);
  }

  /// Actual check logic (ping google.com)
  Future<void> _check() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 3));
      isConnected.value = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isConnected.value = false;
    } on TimeoutException catch (_) {
      isConnected.value = false;
    }
  }

  /// Optionally, call this to check immediately (no debounce)
  Future<void> checkNow() async {
    await _check();
  }

  @override
  void onClose() {
    _debounceTimer?.cancel();
    _periodicTimer?.cancel();
    super.onClose();
  }
}
