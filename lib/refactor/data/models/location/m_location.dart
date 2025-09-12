import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_location.freezed.dart';
part 'm_location.g.dart';

LocationModel locationFromJson(String str) => LocationModel.fromJson(json.decode(str));
String locationToJson(LocationModel data) => json.encode(data.toJson());

@freezed
class LocationModel with _$LocationModel {
  const factory LocationModel({
    required String status,
    String? message,
    @Default([]) List<LocationData> data,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);
}

@freezed
class LocationData with _$LocationData {
  const factory LocationData({
    @JsonKey(name: 'LocationID') String? locationID,
    @JsonKey(name: 'OutletID') String? outletID,
    @JsonKey(name: 'LocationCode') String? locationCode,
    @JsonKey(name: 'LocationLabel') String? locationLabel,
    @JsonKey(name: 'is_deleted') String? isDeleted,
  }) = _LocationData;

  factory LocationData.fromJson(Map<String, dynamic> json) => _$LocationDataFromJson(json);
}
