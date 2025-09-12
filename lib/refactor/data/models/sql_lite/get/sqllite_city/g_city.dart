import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_city.freezed.dart';
part 'g_city.g.dart';

@freezed
class CityLiteModel with _$CityLiteModel {
  const factory CityLiteModel({
    @JsonKey(name: 'cityID') required int cityID,
    @JsonKey(name: 'provinceID') required int provinceID,
    @JsonKey(name: 'cityName') required String cityName,
  }) = _CityLiteModel;

  factory CityLiteModel.fromJson(Map<String, dynamic> json) => _$CityLiteModelFromJson(json);
}
