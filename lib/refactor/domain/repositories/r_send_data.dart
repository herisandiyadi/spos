import 'package:squadra_pos/refactor/data/providers/models/api_result.dart';

abstract class SendDataRepository {
  Future<ApiResult> createCustomer({required Map<String, dynamic> body});
  Future<ApiResult> createTransactionClose(
      {required Map<String, dynamic> body});
  Future<ApiResult> createActivityLog({required Map<String, dynamic> body});
}
