import 'models/api_result.dart';
import 'models/network_model.dart';

abstract class Network {
  Future<ApiResult> callApi({required NetworkModel method});
}