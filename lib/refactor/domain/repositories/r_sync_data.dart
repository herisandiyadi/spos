import 'package:squadra_pos/refactor/data/providers/models/api_result.dart';

abstract class SyncDataRepository {
  Future<ApiResult> getMasterData();
  Future<ApiResult> getMenu();
  Future<ApiResult> getCity();
  Future<ApiResult> getTable();
  Future<ApiResult> getStation();
  Future<ApiResult> getDiscount();
  Future<ApiResult> getLocation();
  Future<ApiResult> getProvince();
  Future<ApiResult> getCustomer();
  Future<ApiResult> getCategory();
  Future<ApiResult> getPaymentMethod();
  Future<ApiResult> getTransactionType();
  Future<ApiResult> getTax();
}
