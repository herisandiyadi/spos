import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/presentation/routes/app_routes.dart';
import 'package:squadra_pos/refactor/utils/loader/loader_general.dart';

class SignOutController extends GetxController {
  SignOutController(this.localStorage);

  final LocalStorage localStorage;

  Future<void> logoutSystem() async {
    LoaderGeneral.show(tag: "logout_system");

    await Future.delayed(const Duration(seconds: 1));
    
    await localStorage.removeToken();
    await localStorage.removeScreenLocked();

    Get.offAllNamed(RouteName.signIn);

    LoaderGeneral.hide(tag: "logout_system");
  }
}