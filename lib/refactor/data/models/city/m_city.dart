import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_city.freezed.dart';
part 'm_city.g.dart';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));
String cityModelToJson(CityModel data) => json.encode(data.toJson());

@freezed
class CityModel with _$CityModel {
  const factory CityModel({
    required String status,
    String? message,
    @Default([]) List<CityData> data,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);
}

@freezed
class CityData with _$CityData {
  const factory CityData({
    @JsonKey(name: 'ArrID') String? arrId,
    @JsonKey(name: 'CityID') String? cityId,
    @JsonKey(name: 'ProvinceID') String? provinceId,
    @JsonKey(name: 'CityName') String? cityName,
  }) = _CityData;

  factory CityData.fromJson(Map<String, dynamic> json) => _$CityDataFromJson(json);
}
