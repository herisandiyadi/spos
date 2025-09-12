import 'package:squadra_pos/refactor/data/providers/contract.dart';
import 'package:squadra_pos/refactor/data/providers/models/api_result.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_exception.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_model.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_parameter.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/data/services/api_service.dart';
import 'package:squadra_pos/refactor/data/services/env_services.dart';
import 'package:squadra_pos/refactor/domain/repositories/r_summary_report.dart';

class SummaryReportRepositoryImpl extends SummaryReportRepository {
  final Network network;
  final LocalStorage localStorage;

  SummaryReportRepositoryImpl(this.network, this.localStorage);
  
  @override
  Future<ApiResult> postSummaryReport({required Map<String, dynamic> body}) async {
    ApiResult apiResult;

    final token = await localStorage.getToken();
    final url = Environment.apiUrl + ApiEndPoints.transactionReport;

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