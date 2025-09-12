import 'package:squadra_pos/refactor/data/providers/contract.dart';
import 'package:squadra_pos/refactor/data/providers/models/api_result.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_exception.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_model.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_parameter.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/data/services/api_service.dart';
import 'package:squadra_pos/refactor/data/services/env_services.dart';
import 'package:squadra_pos/refactor/domain/repositories/auth/r_auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this.network, this.localStorage);

  final Network network;
  final LocalStorage localStorage;
  
  @override
  Future<ApiResult> postSignIn({required Map<String, dynamic> body}) async {
    ApiResult apiResult;

    final token = await localStorage.getToken();
    final url = Environment.apiUrl + ApiEndPoints.login;

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      apiResult = await network.callApi(
        method: NetworkModel.post(networkParameter: NetworkParameter(url: url, header: headers, requestBody: body)),
      );
    } catch (exception) {
      apiResult = const ApiResult.failure(networkException: NetworkException.unknownException());
    }

    return apiResult;
  }
}