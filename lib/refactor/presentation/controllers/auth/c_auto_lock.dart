import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/presentation/controllers/auth/c_screen_lock.dart';

class AutoLockController extends GetxController {
  AutoLockController(this._screenLockController);

  final ScreenLockController _screenLockController;

  Timer? _inactivityTimer;

  final Duration _lockDelay = const Duration(minutes: 3);

  void resetTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(_lockDelay, _triggerAutoLock);
  }

  void _triggerAutoLock() {
    debugPrint("🔒 Auto-lock triggered after inactivity");
    _screenLockController.lockSession();
  }

  @override
  void onClose() {
    _inactivityTimer?.cancel();
    super.onClose();
  }
}