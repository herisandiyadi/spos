import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_station.freezed.dart';
part 'g_station.g.dart';

@freezed
class StationLiteModel with _$StationLiteModel {
  const factory StationLiteModel({
    @JsonKey(name: 'stationID') required int stationID,
    @JsonKey(name: 'stationName') required String stationName,
    @JsonKey(name: 'outletID') required int outletID,
  }) = _StationLiteModel;

  factory StationLiteModel.fromJson(Map<String, dynamic> json) => _$StationLiteModelFromJson(json);
}
