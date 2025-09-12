import 'package:squadra_pos/refactor/data/providers/contract.dart';
import 'package:squadra_pos/refactor/data/providers/models/api_result.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_exception.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_model.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_parameter.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/data/services/api_service.dart';
import 'package:squadra_pos/refactor/data/services/env_services.dart';
import 'package:squadra_pos/refactor/domain/repositories/r_send_data.dart';

class SendDataRepositoryImpl extends SendDataRepository {
  SendDataRepositoryImpl(this.network, this.localStorage);

  final Network network;
  final LocalStorage localStorage;

  @override
  Future<ApiResult> createCustomer({required Map<String, dynamic> body}) async {
    ApiResult apiResult;

    final token = await localStorage.getToken();
    final url = Environment.apiUrl + ApiEndPoints.createCustomer;

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      apiResult = await network.callApi(
        method: NetworkModel.post(
            networkParameter:
                NetworkParameter(url: url, header: headers, requestBody: body)),
      );
    } catch (exception) {
      apiResult = const ApiResult.failure(
          networkException: NetworkException.unknownException());
    }

    return apiResult;
  }

  @override
  Future<ApiResult> createTransactionClose(
      {required Map<String, dynamic> body}) async {
    ApiResult apiResult;

    final token = await localStorage.getToken();
    final url = Environment.apiUrl + ApiEndPoints.createTransactionClose;

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      apiResult = await network.callApi(
        method: NetworkModel.post(
            networkParameter:
                NetworkParameter(url: url, header: headers, requestBody: body)),
      );
    } catch (exception) {
      apiResult = const ApiResult.failure(
          networkException: NetworkException.unknownException());
    }

    return apiResult;
  }

  @override
  Future<ApiResult> createActivityLog(
      {required Map<String, dynamic> body}) async {
    ApiResult apiResult;

    final token = await localStorage.getToken();
    final url = Environment.apiUrl + ApiEndPoints.createLogAct;

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      apiResult = await network.callApi(
        method: NetworkModel.post(
            networkParameter:
                NetworkParameter(url: url, header: headers, requestBody: body)),
      );
    } catch (exception) {
      apiResult = const ApiResult.failure(
          networkException: NetworkException.unknownException());
    }

    return apiResult;
  }
}
