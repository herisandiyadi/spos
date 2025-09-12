import 'package:squadra_pos/refactor/data/providers/contract.dart';
import 'package:squadra_pos/refactor/data/providers/models/api_result.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_exception.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_model.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_parameter.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/data/services/api_service.dart';
import 'package:squadra_pos/refactor/data/services/env_services.dart';
import 'package:squadra_pos/refactor/domain/repositories/transactions/smenu/r_smenu.dart';

class SMenuRepositoryImpl extends SMenuRepository {
  final Network network;
  final LocalStorage localStorage;

  SMenuRepositoryImpl(this.network, this.localStorage);

  @override
  Future<ApiResult> getTransactionSM() async {
    ApiResult apiResult;

    String token = await localStorage.getToken();
    String url = Environment.apiUrl + ApiEndPoints.transactionSM;

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      apiResult = await network.callApi(
        method: NetworkModel.get(
            networkParameter: NetworkParameter(url: url, header: headers)),
      );
    } catch (exception) {
      apiResult = const ApiResult.failure(
          networkException: NetworkException.unknownException());
    }

    return apiResult;
  }

  @override
  Future<ApiResult> getTransactionDetailSM({required String param}) async {
    ApiResult apiResult;

    String token = await localStorage.getToken();
    String url = Environment.apiUrl +
        ApiEndPoints.transactionDetailSM.replaceFirst(':id', param.toString());

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      apiResult = await network.callApi(
        method: NetworkModel.get(
            networkParameter: NetworkParameter(url: url, header: headers)),
      );
    } catch (exception) {
      apiResult = const ApiResult.failure(
          networkException: NetworkException.unknownException());
    }

    return apiResult;
  }

  @override
  Future<ApiResult> postCreateTransactionSM(
      {required Map<String, dynamic> body}) async {
    ApiResult apiResult;

    String token = await localStorage.getToken();
    String url = Environment.apiUrl + ApiEndPoints.createTransactionSM;

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
  Future<ApiResult> postAddToCartSM(
      {required Map<String, dynamic> body}) async {
    ApiResult apiResult;

    String token = await localStorage.getToken();
    String url = Environment.apiUrl + ApiEndPoints.cartAddSM;

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
  Future<ApiResult> postUpdatePrintSM({required String param}) async {
    ApiResult apiResult;

    String token = await localStorage.getToken();
    String url = Environment.apiUrl +
        ApiEndPoints.updatePrintSM.replaceFirst(':id', param.toString());

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      apiResult = await network.callApi(
        method: NetworkModel.get(
            networkParameter: NetworkParameter(url: url, header: headers)),
      );
    } catch (exception) {
      apiResult = const ApiResult.failure(
          networkException: NetworkException.unknownException());
    }

    return apiResult;
  }

  @override
  Future<ApiResult> getRemoveCartSM({required String param}) async {
    ApiResult apiResult;

    String token = await localStorage.getToken();
    String url = Environment.apiUrl +
        ApiEndPoints.cartRemoveSM.replaceFirst(':id', param.toString());

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      apiResult = await network.callApi(
        method: NetworkModel.get(
            networkParameter: NetworkParameter(url: url, header: headers)),
      );
    } catch (exception) {
      apiResult = const ApiResult.failure(
          networkException: NetworkException.unknownException());
    }

    return apiResult;
  }

  @override
  Future<ApiResult> postUpdateCartSM(
      {required Map<String, dynamic> body}) async {
    ApiResult apiResult;

    String token = await localStorage.getToken();
    String url = Environment.apiUrl + ApiEndPoints.cartUpdateSM;

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
  Future<ApiResult> postSendOrderSM(
      {required Map<String, dynamic> body}) async {
    ApiResult apiResult;

    String token = await localStorage.getToken();
    String url = Environment.apiUrl + ApiEndPoints.orderSendSM;

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
  Future<ApiResult> postCheckOutSM({required Map<String, dynamic> body}) async {
    ApiResult apiResult;

    String token = await localStorage.getToken();
    String url = Environment.apiUrl + ApiEndPoints.checkOutSM;

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
  Future<ApiResult> getClearCartSM({required String param}) async {
    ApiResult apiResult;

    String token = await localStorage.getToken();
    String url = Environment.apiUrl +
        ApiEndPoints.cartClearSM.replaceFirst(':id', param.toString());

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      apiResult = await network.callApi(
        method: NetworkModel.get(
            networkParameter: NetworkParameter(url: url, header: headers)),
      );
    } catch (exception) {
      apiResult = const ApiResult.failure(
          networkException: NetworkException.unknownException());
    }

    return apiResult;
  }
}
