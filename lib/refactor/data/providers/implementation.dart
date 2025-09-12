import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'contract.dart';
import 'http/http_contract.dart';
import 'models/api_result.dart';
import 'models/network_exception.dart';
import 'models/network_model.dart';

class NetworkImplementation extends Network {
  HttpNetwork httpNetwork;

  NetworkImplementation(this.httpNetwork);

  @override
  Future<ApiResult> callApi({required NetworkModel method}) async {
    try {
      http.Response response = await httpNetwork.getResponse(method: method);

      String body = response.body;
      String url = response.request != null ? response.request!.url.toString() : "";

      int statusCode = response.statusCode;

      Map<String, dynamic> headers = response.headers;

      if (httpNetwork.validStatusCode(statusCode)) {
        return ApiResult.success(data: body, url: url, header: headers, statusCode: statusCode);
      } else {
        return ApiResult.error(data: body, url: url, header: headers, statusCode: statusCode);
      }
    } on TimeoutException {
      return const ApiResult.failure(networkException: NetworkException.timeOutException());
    } on SocketException {
      return const ApiResult.failure(networkException: NetworkException.socketException());
    } on HttpException {
      return const ApiResult.failure(networkException: NetworkException.httpException());
    } on FormatException {
      return const ApiResult.failure(networkException: NetworkException.formatException());
    } catch (exception) {
      rethrow;
    }
  }
}