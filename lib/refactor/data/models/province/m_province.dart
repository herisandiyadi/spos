import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_province.freezed.dart';
part 'm_province.g.dart';

ProvinceModel provinceModelFromJson(String str) => ProvinceModel.fromJson(json.decode(str));
String provinceModelToJson(ProvinceModel data) => json.encode(data.toJson());

@freezed
class ProvinceModel with _$ProvinceModel {
  const factory ProvinceModel({
    required String status,
    String? message,
    @Default([]) List<ProvinceData> data,
  }) = _ProvinceModel;

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => _$ProvinceModelFromJson(json);
}

@freezed
class ProvinceData with _$ProvinceData {
  const factory ProvinceData({
    @JsonKey(name: 'ProvinceID') String? provinceId,
    @JsonKey(name: 'ProvinceName') String? provinceName,
    @JsonKey(name: 'Timezone') String? timezone,
    @JsonKey(name: 'Value') String? value,
  }) = _ProvinceData;

  factory ProvinceData.fromJson(Map<String, dynamic> json) => _$ProvinceDataFromJson(json);
}
