import 'dart:convert';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/presentation/controllers/auth/c_sign_out.dart';
import 'package:squadra_pos/refactor/presentation/routes/app_routes.dart';
import 'package:squadra_pos/refactor/utils/loader/loader_general.dart';

class ScreenLockController extends GetxController {
  ScreenLockController(this.localStorage, this.signOutController);
  
  final LocalStorage localStorage;
  final SignOutController signOutController;

  RxBool isLockScreen = true.obs;
  RxBool isWrongPin = false.obs;

  final staffPIN = <String>[].obs;

  var status = RxStatus.empty().obs;

  void addPin({ required String number}) {
    final data = staffPIN;

    if (data.length < 4) {
      isWrongPin.value = false;
      status.value = RxStatus.empty();

      data.add(number);
    }
  }

  void deletePin() {
    final data = staffPIN;

    if (data.isNotEmpty) {
      isWrongPin.value = false;
      status.value = RxStatus.empty();

      data.removeLast();
    }
  }

  void _checkScreenLock() async {
    print(await localStorage.getScreenLocked());
    isLockScreen.value = await localStorage.getScreenLocked();
  }

  void unlockScreen(pin) async {
    LoaderGeneral.show(tag: "unlock_screen");

    final data = await localStorage.getDataStaff();

    var staff = jsonDecode(data);
    var check = staff.where((staff) => staff["AccessPIN"] == pin.toString()).toList();

    await Future.delayed(const Duration(seconds: 1));

    if (check.length > 0) {
      await localStorage.saveScreenLocked(false);
      await localStorage.saveStaffName(check[0]['StaffName']);
      await localStorage.saveActionName(check[0]['AuthLevelID']['ActionName']);
      await localStorage.saveStaffPinId(check[0]['StaffPINID']);

      staffPIN.clear();
      isLockScreen.value = false;

      Get.offAllNamed(RouteName.topNavigation);

      status.value = RxStatus.success();
    } else {
      isWrongPin.value = true;

      status.value = RxStatus.error("Oops! That PIN doesn't look right!");
    }

    LoaderGeneral.hide(tag: "unlock_screen");
  }

  void lockSession() async {
    LoaderGeneral.show(tag: "lock_screen");
    
    await localStorage.saveScreenLocked(true);
    await Future.delayed(const Duration(seconds: 1));

    isLockScreen.value = true;

    Get.offAllNamed(RouteName.screenLock);

    LoaderGeneral.hide(tag: "lock_screen");
  }

  @override
  void onInit() {
    super.onInit();

    _checkScreenLock();
  }

  @override
  void onClose() {
    staffPIN.clear();

    super.onClose();
  }
}