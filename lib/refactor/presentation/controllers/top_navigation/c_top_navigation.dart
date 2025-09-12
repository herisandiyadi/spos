import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_header.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/printer_setup/bluetooth_connection.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/printer_setup/lan_connection.dart';
import 'package:squadra_pos/refactor/data/providers/models/api_result.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_exception.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/domain/repositories/r_download_image.dart';
import 'package:squadra_pos/refactor/presentation/controllers/auth/c_sign_out.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/printer/c_bluetooth.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/printer/c_lan.dart';
import 'package:squadra_pos/refactor/presentation/routes/app_routes.dart';
import 'package:squadra_pos/refactor/presentation/widgets/auto_print_toggle.dart';
import 'package:squadra_pos/refactor/presentation/widgets/auto_print_dialog.dart';
import 'package:squadra_pos/report/troubleshoot.dart';

class TopNavigationController extends GetxController {
  TopNavigationController(
      this.localStorage, this.signOutController, this.downloadImageRepository);

  final LocalStorage localStorage;
  final SignOutController signOutController;
  final DownloadImageRepository downloadImageRepository;

  final pageController = PageController();
  final _lanController = Get.find<LanController>();
  final _bluetoothController = Get.find<BluetoothController>();
  Timer? _timer;
  RxInt currentPageIndex = 0.obs;

  RxString versionNumber = ''.obs;
  RxString buildNumber = ''.obs;
  RxString outletName = ''.obs;
  RxString outletType = ''.obs;
  RxString outletImagePath = ''.obs;
  RxBool isWaiters = false.obs;
  RxBool isAdmin = false.obs;
  final controller = Get.find<TransactionHeaderSMController>();

  var status = RxStatus.empty().obs;

  void handleMenuSelection(String value) async {
    switch (value) {
      case 'pos':
        Get.offAllNamed(RouteName.topNavigation);
        break;
      case 'report':
        _navigateToPage(pageIndex: 1);
        break;
      case 'printBluetooth':
        showDialog(
          context: Get.context!,
          barrierDismissible: true,
          builder: (BuildContext context) {
            _bluetoothController.initPrinterBluetooths();

            return BluetoothConnection();
          },
        );
        break;
      case 'printLan':
        showDialog(
          context: Get.context!,
          barrierDismissible: true,
          builder: (BuildContext context) {
            //_lanController.getPrinterIPDevices();

            return LanConnection();
          },
        );
        // Navigator.push(
        //   Get.context!,
        //   PageRouteBuilder(
        //     opaque: false,
        //     pageBuilder: (_, __, ___) => const LanConnection(),
        //   ),
        // );
        break;
      case 'autoPrint':
        showDialog(
          context: Get.context!,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AutoPrintDialog();
          },
        );

        break;
      case 'log':
        _navigateToPage(pageIndex: 2);
        break;
      case 'senddb':
        showDialog(
          context: Get.context!,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return Troubleshoot();
          },
        );
        break;
      case 'logout':
        await signOutController.logoutSystem();
        break;
      default:
        break;
    }
  }

  Future<void> _getDataStaff() async {
    String dataStaff = await localStorage.getDataStaff();
    String actionName = await localStorage.getActionName();

    for (var staff in jsonDecode(dataStaff)) {
      String data = staff['AuthLevelID']?['ActionName'];

      if (data.toLowerCase() == "waiters") {
        if (data.toLowerCase() == actionName.toLowerCase()) {
          isWaiters.value = true;
        }
      }
      if (data.toLowerCase() == "spv" || data.toLowerCase() == "manager") {
        if (data.toLowerCase() == actionName.toLowerCase()) {
          isAdmin.value = true;
        }
      }
    }
  }

  Future<void> _getVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();

    versionNumber.value = packageInfo.version;
    buildNumber.value = packageInfo.buildNumber;
  }

  Future<void> _getOutletData() async {
    final name = await localStorage.getOutletName();
    final outlettype = await localStorage.getOutletType();
    final outletImage = await localStorage.getOutletImage();

    if (outletImage.isNotEmpty) {
      await downloadLogo(url: outletImage);
    }

    outletName.value = name;
    outletType.value = outlettype;
  }

  Future<void> downloadLogo({required String url}) async {
    status.value = RxStatus.loading();

    ApiResult result = await downloadImageRepository.getDownloadImage(url: url);

    result.when(
      success: (data, url, headers, statusCode) async {
        final bytes = Uint8List.fromList(data.codeUnits);

        final directory = await getApplicationDocumentsDirectory();
        final timestamp = DateTime.now().millisecondsSinceEpoch;
        final filePath = '${directory.path}/logo_$timestamp';
        final file = File(filePath);

        await file.writeAsBytes(bytes);
        await localStorage.saveImageUrl(filePath);

        outletImagePath.value = filePath;

        status.value = RxStatus.success();
      },
      error: (data, url, headers, statusCode) {
        status.value = RxStatus.error(jsonDecode(data)["message"]);
      },
      failure: (exception) {
        final response = getContentErrorHTTP(exception);

        status.value = RxStatus.error(response["error_message"]);
      },
    );
  }

  Future<void> _navigateToPage({required int pageIndex}) async {
    currentPageIndex.value = pageIndex;
    pageController.jumpToPage(pageIndex);
  }

  @override
  void onInit() {
    super.onInit();

    _getVersion();
    _getDataStaff();
    _getOutletData();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      controller.getTransactionHeaderSMCall(cron: true);
    });
  }
}
