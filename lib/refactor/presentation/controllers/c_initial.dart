import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/presentation/routes/app_routes.dart';

class InitialController extends GetxController {
  final LocalStorage localStorage;

  InitialController(this.localStorage);

  RxBool isLoggedIn = false.obs;

  Future<void> getStatusLoggedIn() async {
    final token = await localStorage.getToken();

    if (token.isNotEmpty) await localStorage.saveScreenLocked(true);
    await Future.delayed(const Duration(milliseconds: 1500));

    final lock = await localStorage.getScreenLocked();

    isLoggedIn.value = lock && token.isNotEmpty;

    if (lock && token.isNotEmpty) {
      Get.offAllNamed(RouteName.screenLock);
    } else {
      Get.offAllNamed(RouteName.signIn);
    }
  }

  @override
  void onInit() {
    super.onInit();

    getStatusLoggedIn();
  }
}