import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_parameter.freezed.dart';

@freezed
class NetworkParameter with _$NetworkParameter {
  const factory NetworkParameter({
    required String url,
    Map<String, dynamic>? requestBody,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParameter,
  }) = _NetworkParameter;
}