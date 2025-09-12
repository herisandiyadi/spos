import 'package:squadra_pos/refactor/data/providers/models/api_result.dart';

abstract class DownloadImageRepository {
  Future<ApiResult> getDownloadImage({required String url});
}