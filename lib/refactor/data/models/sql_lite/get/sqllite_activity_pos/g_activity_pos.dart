import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_activity_pos.freezed.dart';
part 'g_activity_pos.g.dart';

@freezed
class ActPOSLiteModel with _$ActPOSLiteModel {
  const factory ActPOSLiteModel({
    @JsonKey(name: 'logID') required int logID,
    @JsonKey(name: 'userID') required int userID,
    @JsonKey(name: 'datetime') required String datetime,
    @JsonKey(name: 'activityType') required String activityType,
    @JsonKey(name: 'reffID') required String reffID,
    @JsonKey(name: 'activityDesc') required String activityDesc,
    @JsonKey(name: 'ipAddress') required String ipAddress,
    @JsonKey(name: 'deviceName') required String deviceName,
    @JsonKey(name: 'companyCode') required String companyCode,
  }) = _ActPOSLiteModel;

  factory ActPOSLiteModel.fromJson(Map<String, dynamic> json) =>
      _$ActPOSLiteModelFromJson(json);
}
