import 'package:squadra_pos/refactor/data/providers/models/api_result.dart';

abstract class SummaryReportRepository {
  Future<ApiResult> postSummaryReport({required Map<String, dynamic> body});
}