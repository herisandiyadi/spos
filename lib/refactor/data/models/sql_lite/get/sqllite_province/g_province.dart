import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_province.freezed.dart';
part 'g_province.g.dart';

@freezed
class ProvinceLiteModel with _$ProvinceLiteModel {
  const factory ProvinceLiteModel({
    @JsonKey(name: 'provinceID') required int provinceID,
    @JsonKey(name: 'provinceName') required String provinceName,
  }) = _ProvinceLiteModel;

  factory ProvinceLiteModel.fromJson(Map<String, dynamic> json) => _$ProvinceLiteModelFromJson(json);
}
