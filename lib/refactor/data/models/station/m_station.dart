import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_station.freezed.dart';
part 'm_station.g.dart';

StationModel stationFromJson(String str) => StationModel.fromJson(json.decode(str));
String stationToJson(StationModel data) => json.encode(data.toJson());

@freezed
class StationModel with _$StationModel {
  const factory StationModel({
    required String status,
    String? message,
    @Default([]) List<StationData> data,
  }) = _StationModel;

  factory StationModel.fromJson(Map<String, dynamic> json) => _$StationModelFromJson(json);
}

@freezed
class StationData with _$StationData {
  const factory StationData({
    @JsonKey(name: 'StationID') String? stationID,
    @JsonKey(name: 'StationName') String? stationName,
    @JsonKey(name: 'OutletID') String? outletID,
    @JsonKey(name: 'CompanyCode') String? companyCode,
  }) = _StationData;

  factory StationData.fromJson(Map<String, dynamic> json) => _$StationDataFromJson(json);
}
