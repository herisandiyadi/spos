import 'package:squadra_pos/refactor/data/providers/models/api_result.dart';

abstract class SMenuRepository {
  Future<ApiResult> getTransactionSM();
  Future<ApiResult> getTransactionDetailSM({required String param});
  Future<ApiResult> postCreateTransactionSM(
      {required Map<String, dynamic> body});
  Future<ApiResult> postAddToCartSM({required Map<String, dynamic> body});
  Future<ApiResult> getRemoveCartSM({required String param});
  Future<ApiResult> getClearCartSM({required String param});
  Future<ApiResult> postUpdateCartSM({required Map<String, dynamic> body});
  Future<ApiResult> postSendOrderSM({required Map<String, dynamic> body});
  Future<ApiResult> postUpdatePrintSM({required String param});
  Future<ApiResult> postCheckOutSM({required Map<String, dynamic> body});
}
