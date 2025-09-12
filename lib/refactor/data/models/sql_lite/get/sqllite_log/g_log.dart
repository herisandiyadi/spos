import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_log.freezed.dart';
part 'g_log.g.dart';

@freezed
class LogLiteModel with _$LogLiteModel {
  const factory LogLiteModel({
    @JsonKey(name: 'logID') required int logID,
    @JsonKey(name: 'dateTime') required String dateTime,
    @JsonKey(name: 'transactionNumber') required String transactionNumber,
    @JsonKey(name: 'statusReturn') required String statusReturn,
    @JsonKey(name: 'statusMessage') required String statusMessage,
  }) = _LogLiteModel;

  factory LogLiteModel.fromJson(Map<String, dynamic> json) => _$LogLiteModelFromJson(json);
}
