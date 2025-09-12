import 'package:squadra_pos/refactor/data/providers/contract.dart';
import 'package:squadra_pos/refactor/data/providers/models/api_result.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_exception.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_model.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_parameter.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/domain/repositories/r_download_image.dart';

class DownloadImageRepositoryImpl extends DownloadImageRepository {
  DownloadImageRepositoryImpl(this.network, this.localStorage);

  final Network network;
  final LocalStorage localStorage;

  @override
  Future<ApiResult> getDownloadImage({required String url}) async {
    ApiResult apiResult;

    final token = await localStorage.getToken();

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      apiResult = await network.callApi(
        method: NetworkModel.get(networkParameter: NetworkParameter(url: url, header: headers)),
      );
    } catch (exception) {
      apiResult = const ApiResult.failure(networkException: NetworkException.unknownException());
    }
    
    return apiResult;
  }
}