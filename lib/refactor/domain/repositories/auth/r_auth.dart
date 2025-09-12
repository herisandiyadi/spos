import 'package:squadra_pos/refactor/data/providers/models/api_result.dart';

abstract class AuthRepository {
  Future<ApiResult> postSignIn({required Map<String, dynamic> body});
}