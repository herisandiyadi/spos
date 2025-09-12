import 'package:http/http.dart' as http;
import 'package:squadra_pos/refactor/data/providers/models/api_result.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_model.dart';

abstract class HttpNetwork {
  Future<http.Response> getResponse({required NetworkModel method});

  bool validStatusCode(int statusCode);

  late ApiResult unknownException;
}