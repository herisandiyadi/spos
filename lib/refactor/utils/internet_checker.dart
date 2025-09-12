import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';

/// Simple debouncer utility
class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer({required this.delay});

  void call(void Function() action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  void dispose() {
    _timer?.cancel();
  }
}

/// A utility class to check internet connectivity with GetX and debouncing.
/// Usage:
///   final checker = InternetChecker();
///   checker.isConnected.listen((connected) { ... });
///   checker.checkConnection(); // Call this to trigger a check (debounced)
class InternetChecker {
  // Observable connection status
  final RxBool isConnected = false.obs;

  // Debouncer for connection checks
  final _debouncer = Debouncer(delay: Duration(seconds: 2));

  // Last check future to avoid overlapping checks
  Future<void>? _lastCheck;

  /// Call this method to check internet connection (debounced)
  void checkConnection() {
    _debouncer(() async {
      // Prevent overlapping checks
      if (_lastCheck != null) return;
      _lastCheck = _check();
      await _lastCheck;
      _lastCheck = null;
    });
  }

  /// Actual check logic (ping google.com)
  Future<void> _check() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(Duration(seconds: 3));
      isConnected.value = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isConnected.value = false;
    } on TimeoutException catch (_) {
      isConnected.value = false;
    }
  }

  /// Dispose resources if needed
  void dispose() {
    // No resources to dispose for now
  }
}
