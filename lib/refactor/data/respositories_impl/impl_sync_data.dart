import 'package:squadra_pos/refactor/data/providers/contract.dart';
import 'package:squadra_pos/refactor/data/providers/models/api_result.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_exception.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_model.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_parameter.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/data/services/api_service.dart';
import 'package:squadra_pos/refactor/data/services/env_services.dart';
import 'package:squadra_pos/refactor/domain/repositories/r_sync_data.dart';

class SyncDataRepositoryImpl extends SyncDataRepository {
  final Network network;
  final LocalStorage localStorage;

  SyncDataRepositoryImpl(this.network, this.localStorage);

  @override
  Future<ApiResult> getMasterData() async {
    ApiResult apiResult;

    final token = await localStorage.getToken();
    final url = Environment.apiUrl;

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
  Future<ApiResult> getCategory() async {
    ApiResult apiResult;

    final token = await localStorage.getToken();
    final url = Environment.apiUrl + ApiEndPoints.category;

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
  Future<ApiResult> getCity() async {
    ApiResult apiResult;

    final token = await localStorage.getToken();
    final url = Environment.apiUrl + ApiEndPoints.city;

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
  Future<ApiResult> getCustomer() async {
    ApiResult apiResult;

    final token = await localStorage.getToken();
    final url = Environment.apiUrl + ApiEndPoints.customer;

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
  Future<ApiResult> getLocation() async {
    ApiResult apiResult;

    final token = await localStorage.getToken();
    final url = Environment.apiUrl + ApiEndPoints.location;

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
  Future<ApiResult> getMenu() async {
    ApiResult apiResult;

    final token = await localStorage.getToken();
    final url = Environment.apiUrl + ApiEndPoints.menu;

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
  Future<ApiResult> getPaymentMethod() async {
    ApiResult apiResult;

    final token = await localStorage.getToken();
    final url = Environment.apiUrl + ApiEndPoints.paymentMethod;

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
  Future<ApiResult> getProvince() async {
    ApiResult apiResult;

    final token = await localStorage.getToken();
    final url = Environment.apiUrl + ApiEndPoints.province;

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
  Future<ApiResult> getStation() async {
    ApiResult apiResult;

    final token = await localStorage.getToken();
    final url = Environment.apiUrl + ApiEndPoints.station;

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
  Future<ApiResult> getTax() async {
    ApiResult apiResult;

    final token = await localStorage.getToken();
    final url = Environment.apiUrl + ApiEndPoints.tax;

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
  Future<ApiResult> getTable() async {
    ApiResult apiResult;

    final token = await localStorage.getToken();
    final url = Environment.apiUrl + ApiEndPoints.table;

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
  Future<ApiResult> getTransactionType() async {
    ApiResult apiResult;

    final token = await localStorage.getToken();
    final url = Environment.apiUrl + ApiEndPoints.transactionType;

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
  Future<ApiResult> getDiscount() async {
    ApiResult apiResult;

    final token = await localStorage.getToken();
    final url = Environment.apiUrl + ApiEndPoints.discount;

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
