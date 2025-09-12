import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_tax.freezed.dart';
part 'g_tax.g.dart';

@freezed
class TaxLiteModel with _$TaxLiteModel {
  const factory TaxLiteModel({
    @JsonKey(name: 'taxID') required int taxID,
    @JsonKey(name: 'taxName') required String taxName,
    @JsonKey(name: 'taxPercent') required double taxPercent,
  }) = _TaxLiteModel;

  factory TaxLiteModel.fromJson(Map<String, dynamic> json) =>
      _$TaxLiteModelFromJson(json);
}
