import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/models/sign_in/m_sign_in.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_exception.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/domain/repositories/auth/r_auth.dart';
import 'package:squadra_pos/refactor/presentation/routes/app_routes.dart';
import 'package:squadra_pos/refactor/utils/loader/loader_general.dart';

class SignInController extends GetxController {
  SignInController(this.authRepository, this.localStorage);

  final AuthRepository authRepository;
  final LocalStorage localStorage;

  final signInKey = GlobalKey<FormState>();
  final usernameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  late List<FocusNode> focusNodes;

  var status = RxStatus.empty().obs;

  RxBool isObscurePassword = true.obs;

  Future<void> signInCall() async {
    dismissKeyboardIfFocused();

    bool isFormValid = signInKey.currentState?.validate() ?? false;

    if (!isFormValid) {
      status.value = RxStatus.empty();

      return;
    }
    ;

    LoaderGeneral.show(tag: "sign_in");

    final requestBody = {
      "username": usernameController.text,
      "password": passwordController.text,
    };

    final result = await authRepository.postSignIn(body: requestBody);

    result.when(
      success: (data, url, headers, statusCode) async {
        final parsed = signInFromJson(data);

        if (parsed.status == "success") {
          int posLoginId = int.tryParse(parsed.data?.posLoginID ?? '') ?? 0;
          int outletID = int.tryParse(parsed.data?.outlet?.outletID ?? '') ?? 0;
          String outletImage = parsed.data?.outlet?.outletImage ?? '';
          String outletType = parsed.data?.outlet?.outletType ?? '';
          String companyCode = parsed.data?.outlet?.companyCode ?? '';
          String latestCompanyCode = await localStorage.getCompanyCode();

          if (companyCode != latestCompanyCode) {
            await localStorage.removeFirstSync();
          }

          await localStorage.saveToken(parsed.token ?? '');
          await localStorage.savePosLoginID(posLoginId);
          await localStorage.saveOutletID(outletID);
          await localStorage.saveOutletType(outletType);
          await localStorage
              .saveCompanyCode(parsed.data?.outlet?.companyCode ?? '');
          await localStorage
              .saveOutletName(parsed.data?.outlet?.outletName ?? '');
          await localStorage
              .saveOutletCode(parsed.data?.outlet?.outletCode ?? '');
          await localStorage.saveOutletImage(outletImage);
          await localStorage.saveOutletFB(parsed.data?.outlet?.outletFB ?? '');
          await localStorage.saveOutletIG(parsed.data?.outlet?.outletIG ?? '');
          await localStorage
              .saveOutletTiktok(parsed.data?.outlet?.outletTIKTOK ?? '');
          await localStorage
              .saveOutletWeb(parsed.data?.outlet?.outletWeb ?? '');
          await localStorage.saveDataStaff(jsonEncode(parsed.data?.dataStaff));

          await localStorage.saveSelectedTrans(0);
          await localStorage.saveScreenLocked(true);
          await localStorage.saveTableMap(true);

          await localStorage.savePrimaryPrinter(["", ""]);

          Get.offAllNamed(RouteName.screenLock);
        } else {
          status.value = RxStatus.error(parsed.message ?? '');
          LoaderGeneral.hide(tag: "sign_in");
        }
      },
      error: (data, url, headers, statusCode) {
        final parsed = signInFromJson(data);

        status.value = RxStatus.error(parsed.message ?? '');
        LoaderGeneral.hide(tag: "sign_in");
      },
      failure: (exception) {
        final response = getContentErrorHTTP(exception);

        status.value = RxStatus.error(response["error_message"]);
        LoaderGeneral.hide(tag: "sign_in");
      },
    );
  }

  void dismissKeyboardIfFocused() {
    if (_isAnyNodeFocused()) {
      for (var node in focusNodes) {
        node.unfocus();
      }
    }
  }

  void _resetForm() {
    usernameController.clear();
    passwordController.clear();
  }

  bool _isAnyNodeFocused() {
    return focusNodes.any((focusNode) => focusNode.hasFocus);
  }

  @override
  void onInit() {
    super.onInit();

    focusNodes = [
      usernameFocusNode,
      passwordFocusNode,
    ];
  }

  @override
  void onClose() {
    _resetForm();

    usernameController.dispose();
    passwordController.dispose();

    super.onClose();
  }
}
