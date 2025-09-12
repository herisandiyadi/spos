import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/models/transaction_smenu_detail/m_transaction_sm_detail.dart';
import 'package:squadra_pos/refactor/data/providers/models/api_result.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_exception.dart';
import 'package:squadra_pos/refactor/domain/repositories/transactions/smenu/r_smenu.dart';

class TransactionDetailSMController extends GetxController {
  TransactionDetailSMController(this.transactionSMRepository);

  final SMenuRepository transactionSMRepository;

  final transactionSMHeaderData = Rxn<TransactionSMHeaderData>();
  final transactionSMFooterData = Rxn<TransactionSMHeaderData>();
  final transactionSMDetailList = <TransactionSMDetailData>[].obs;

  RxInt cartId = 0.obs;
  RxBool isPrintBill = false.obs;

  var statusHeader = RxStatus.empty().obs;
  var statusDetail = RxStatus.empty().obs;

  Future<void> getTransactionSMHeaderCall({required int number}) async {
    statusHeader.value = RxStatus.loading();

    await Future.delayed(const Duration(milliseconds: 500));

    ApiResult result = await transactionSMRepository.getTransactionDetailSM(param: number.toString());

    result.when(
      success: (data, url, headers, statusCode) {
        final response = transactionSMDetailFromJson(data);
        final header = response.data;

        transactionSMHeaderData.value = header;
        
        statusHeader.value = RxStatus.success();
      },
      error: (data, url, headers, statusCode) async {
        final response = transactionSMDetailFromJson(data);
        final message = response.status ?? '';

        statusHeader.value = RxStatus.error(message);
      },
      failure: (exception) {
        final response = getContentErrorHTTP(exception);

        statusHeader.value = RxStatus.error(response["error_type"]);
      },
    );
  }

  Future<void> getTransactionSMDetailCall({required int number}) async {
    statusDetail.value = RxStatus.loading();

    await Future.delayed(const Duration(milliseconds: 500));

    ApiResult result = await transactionSMRepository.getTransactionDetailSM(param: number.toString());

    result.when(
      success: (data, url, headers, statusCode) {
        final response = transactionSMDetailFromJson(data);
        final footer = response.data;
        final detail = footer?.details ?? [];

        transactionSMFooterData.value = footer;
        transactionSMDetailList.value = detail;
        
        final uniformCartID = getUniformCartID(detail);

        if (detail.isNotEmpty) checkIfCanPrintBill();
        if (uniformCartID != null) cartId.value = uniformCartID;
        
        statusDetail.value = RxStatus.success();
      },
      error: (data, url, headers, statusCode) async {
        final response = transactionSMDetailFromJson(data);
        final message = response.status ?? '';

        statusDetail.value = RxStatus.error(message);
      },
      failure: (exception) {
        final response = getContentErrorHTTP(exception);

        statusDetail.value = RxStatus.error(response["error_type"]);
      },
    );
  }

  void checkIfCanPrintBill() {
    final hasUnsentOrder = transactionSMDetailList.any((item) => item.sendOrder == 0);

    isPrintBill.value = !hasUnsentOrder;
  }

  int? getUniformCartID(List<TransactionSMDetailData> details) {
    if (details.isEmpty) return null;

    final firstCartID = details.first.cartID;

    final allSame = details.every((item) => item.cartID == firstCartID);

    return allSame ? firstCartID : null;
  }

  void rebuild({required int uniqueNumber}) async {
    await getTransactionSMDetailCall(number: uniqueNumber);

    refresh();
  }
}