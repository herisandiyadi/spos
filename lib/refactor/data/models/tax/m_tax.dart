import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_tax.freezed.dart';
part 'm_tax.g.dart';

TaxModel taxFromJson(String str) => TaxModel.fromJson(json.decode(str));
String taxToJson(TaxModel data) => json.encode(data.toJson());

@freezed
class TaxModel with _$TaxModel {
  const factory TaxModel({
    required String status,
    String? message,
    @Default([]) List<TaxData> data,
  }) = _TaxModel;

  factory TaxModel.fromJson(Map<String, dynamic> json) =>
      _$TaxModelFromJson(json);
}

@freezed
class TaxData with _$TaxData {
  const factory TaxData({
    @JsonKey(name: 'TaxID') String? taxID,
    @JsonKey(name: 'TaxName') String? taxName,
    @JsonKey(name: 'TaxPercent') String? taxPercent,
    @JsonKey(name: 'CompanyCode') String? companyCode,
  }) = _TaxData;

  factory TaxData.fromJson(Map<String, dynamic> json) =>
      _$TaxDataFromJson(json);
}
