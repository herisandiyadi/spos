import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_location.freezed.dart';
part 'g_location.g.dart';

@freezed
class LocationLiteModel with _$LocationLiteModel {
  const factory LocationLiteModel({
    @JsonKey(name: 'locationID') required int locationID,
    @JsonKey(name: 'outletID') required int outletID,
    @JsonKey(name: 'locationCode') required String locationCode,
    @JsonKey(name: 'locationLabel') required String locationLabel,
  }) = _LocationLiteModel;

  factory LocationLiteModel.fromJson(Map<String, dynamic> json) => _$LocationLiteModelFromJson(json);
}
