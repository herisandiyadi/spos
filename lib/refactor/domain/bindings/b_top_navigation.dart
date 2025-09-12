import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/providers/contract.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/data/respositories_impl/impl_download_image.dart';
import 'package:squadra_pos/refactor/data/respositories_impl/impl_send_data.dart';
import 'package:squadra_pos/refactor/data/respositories_impl/impl_summary_report.dart';
import 'package:squadra_pos/refactor/data/respositories_impl/impl_sync_data.dart';
import 'package:squadra_pos/refactor/data/respositories_impl/smenu/impl_smenu.dart';
import 'package:squadra_pos/refactor/domain/repositories/r_download_image.dart';
import 'package:squadra_pos/refactor/domain/repositories/r_send_data.dart';
import 'package:squadra_pos/refactor/domain/repositories/r_sync_data.dart';
import 'package:squadra_pos/refactor/domain/repositories/r_summary_report.dart';
import 'package:squadra_pos/refactor/domain/repositories/transactions/smenu/r_smenu.dart';
import 'package:squadra_pos/refactor/presentation/controllers/auth/c_screen_lock.dart';
import 'package:squadra_pos/refactor/presentation/controllers/auth/c_sign_out.dart';
import 'package:squadra_pos/refactor/presentation/controllers/c_home.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/reserve/c_reserve_list.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/transaction/c_transaction_all.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/transaction/c_transaction_close.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/transaction/c_transaction_open.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_detail.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_order.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/request/c_create_transaction_sm.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_printer.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_send_data.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_sync_data.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_top_navigation.dart';
import 'package:squadra_pos/refactor/presentation/controllers/c_summary_report.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/reserve/c_reserve_offline.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/transaction/c_transaction_offline.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/request/c_create_customer.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_header.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/printer/c_bluetooth.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/printer/c_lan.dart';

class TopNavigationBinding extends Bindings {
  @override
  void dependencies() {
    // :: Repositories
    Get.lazyPut<SMenuRepository>(() =>
        SMenuRepositoryImpl(Get.find<Network>(), Get.find<LocalStorage>()));
    Get.lazyPut<SyncDataRepository>(() =>
        SyncDataRepositoryImpl(Get.find<Network>(), Get.find<LocalStorage>()));
    Get.lazyPut<DownloadImageRepository>(() => DownloadImageRepositoryImpl(
        Get.find<Network>(), Get.find<LocalStorage>()));
    Get.lazyPut<SummaryReportRepository>(() => SummaryReportRepositoryImpl(
        Get.find<Network>(), Get.find<LocalStorage>()));
    Get.lazyPut<SendDataRepository>(
        () => SendDataRepositoryImpl(
            Get.find<Network>(), Get.find<LocalStorage>()),
        fenix: true);

    // :: Controllers
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ReserveOfflineController>(() => ReserveOfflineController());
    Get.lazyPut<TransactionAllController>(() => TransactionAllController());
    Get.lazyPut<TransactionOpenController>(() => TransactionOpenController());
    Get.lazyPut<LanController>(() => LanController(Get.find<LocalStorage>()));
    Get.lazyPut<TransactionCloseController>(() => TransactionCloseController());
    Get.lazyPut<TransactionOfflineController>(
        () => TransactionOfflineController());
    Get.lazyPut<SignOutController>(
        () => SignOutController(Get.find<LocalStorage>()));
    Get.lazyPut<PrinterController>(
        () => PrinterController(Get.find<LocalStorage>()));
    Get.lazyPut<ReserveListController>(
        () => ReserveListController(Get.find<SMenuRepository>()));
    Get.lazyPut<SendDataController>(
        () => SendDataController(Get.find<SendDataRepository>()),
        fenix: true);
    Get.lazyPut<TransactionOrderSMController>(
        () => TransactionOrderSMController(
            Get.find<LocalStorage>(),
            Get.find<SMenuRepository>(),
            Get.find<TransactionDetailSMController>()),
        fenix: true);

    Get.lazyPut<TransactionHeaderSMController>(
        () => TransactionHeaderSMController(Get.find<SMenuRepository>()),
        fenix: true);

    Get.lazyPut<TransactionDetailSMController>(
        () => TransactionDetailSMController(Get.find<SMenuRepository>()),
        fenix: true);
    Get.lazyPut<BluetoothController>(() => BluetoothController(
        Get.find<LocalStorage>(), Get.find<PrinterController>()));
    Get.lazyPut<ScreenLockController>(() => ScreenLockController(
        Get.find<LocalStorage>(), Get.find<SignOutController>()));
    Get.lazyPut<CreateCustomerController>(() => CreateCustomerController(
        Get.find<LocalStorage>(), Get.find<ReserveOfflineController>()));
    Get.lazyPut<TopNavigationController>(() => TopNavigationController(
        Get.find<LocalStorage>(),
        Get.find<SignOutController>(),
        Get.find<DownloadImageRepository>()));
    Get.lazyPut<CreateTransactionSMController>(() =>
        CreateTransactionSMController(Get.find<LocalStorage>(),
            Get.find<SMenuRepository>(), Get.find<ReserveOfflineController>()));
    Get.lazyPut<SyncDataController>(() => SyncDataController(
        Get.find<LocalStorage>(),
        Get.find<DownloadImageRepository>(),
        Get.find<SyncDataRepository>()));
    Get.lazyPut<SummaryReportController>(() => SummaryReportController(
        Get.find<LocalStorage>(),
        Get.find<ScreenLockController>(),
        Get.find<SummaryReportRepository>()));
  }
}
