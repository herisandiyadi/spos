import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/providers/contract.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/data/respositories_impl/impl_download_image.dart';
import 'package:squadra_pos/refactor/data/respositories_impl/impl_send_data.dart';
import 'package:squadra_pos/refactor/data/respositories_impl/impl_sync_data.dart';
import 'package:squadra_pos/refactor/data/respositories_impl/smenu/impl_smenu.dart';
import 'package:squadra_pos/refactor/domain/repositories/r_download_image.dart';
import 'package:squadra_pos/refactor/domain/repositories/r_send_data.dart';
import 'package:squadra_pos/refactor/domain/repositories/r_sync_data.dart';
import 'package:squadra_pos/refactor/domain/repositories/transactions/smenu/r_smenu.dart';
import 'package:squadra_pos/refactor/presentation/controllers/auth/c_screen_lock.dart';
import 'package:squadra_pos/refactor/presentation/controllers/auth/c_sign_out.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_header.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_printer.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_send_data.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_sync_data.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_top_navigation.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/printer/c_bluetooth.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/printer/c_lan.dart';

class ScreenLockBinding extends Bindings {
  @override
  void dependencies() {
    // :: Repository
    Get.lazyPut<SMenuRepository>(() =>
        SMenuRepositoryImpl(Get.find<Network>(), Get.find<LocalStorage>()));
    Get.lazyPut<SendDataRepository>(
        () => SendDataRepositoryImpl(
            Get.find<Network>(), Get.find<LocalStorage>()),
        fenix: true);
    Get.lazyPut<SyncDataRepository>(() =>
        SyncDataRepositoryImpl(Get.find<Network>(), Get.find<LocalStorage>()));
    Get.lazyPut<DownloadImageRepository>(() => DownloadImageRepositoryImpl(
        Get.find<Network>(), Get.find<LocalStorage>()));

    // :: Controllers
    Get.lazyPut<LanController>(() => LanController(Get.find<LocalStorage>()));
    Get.lazyPut<SignOutController>(
        () => SignOutController(Get.find<LocalStorage>()));
    Get.lazyPut<PrinterController>(
        () => PrinterController(Get.find<LocalStorage>()));

    Get.lazyPut<SendDataController>(
        () => SendDataController(Get.find<SendDataRepository>()),
        fenix: true);

    Get.lazyPut<BluetoothController>(() => BluetoothController(
        Get.find<LocalStorage>(), Get.find<PrinterController>()));
    Get.lazyPut<ScreenLockController>(() => ScreenLockController(
        Get.find<LocalStorage>(), Get.find<SignOutController>()));
    Get.lazyPut<TopNavigationController>(() => TopNavigationController(
        Get.find<LocalStorage>(),
        Get.find<SignOutController>(),
        Get.find<DownloadImageRepository>()));
    Get.lazyPut<SyncDataController>(() => SyncDataController(
        Get.find<LocalStorage>(),
        Get.find<DownloadImageRepository>(),
        Get.find<SyncDataRepository>()));
    Get.lazyPut<TransactionHeaderSMController>(
        () => TransactionHeaderSMController(Get.find<SMenuRepository>()),
        fenix: true);
  }
}
