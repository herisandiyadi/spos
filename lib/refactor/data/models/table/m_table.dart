import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_table.freezed.dart';
part 'm_table.g.dart';

TableModel tableFromJson(String str) => TableModel.fromJson(json.decode(str));
String tableToJson(TableModel data) => json.encode(data.toJson());

@freezed
class TableModel with _$TableModel {
  const factory TableModel({
    required String status,
    String? message,
    @Default([]) List<TableData> data,
  }) = _TableModel;

  factory TableModel.fromJson(Map<String, dynamic> json) => _$TableModelFromJson(json);
}

@freezed
class TableData with _$TableData {
  const factory TableData({
    @JsonKey(name: 'TableID') String? tableID,
    @JsonKey(name: 'LocationID') String? locationID,
    @JsonKey(name: 'TableNumber') String? tableNumber,
    @JsonKey(name: 'TableLabel') String? tableLabel,
    @JsonKey(name: 'Seat') String? seat,
    @JsonKey(name: 'is_deleted') String? isDeleted,
    @JsonKey(name: 'OutletID') String? outletID,
    @JsonKey(name: 'LocationCode') String? locationCode,
    @JsonKey(name: 'LocationLabel') String? locationLabel,
    @JsonKey(name: 'OutletCode') String? outletCode,
    @JsonKey(name: 'OutletName') String? outletName,
    @JsonKey(name: 'OutletAddress') String? outletAddress,
    @JsonKey(name: 'OutletImage') String? outletImage,
    @JsonKey(name: 'OutletOpen') String? outletOpen,
    @JsonKey(name: 'OutletClose') String? outletClose,
    @JsonKey(name: 'OutletFB') String? outletFB,
    @JsonKey(name: 'OutletIG') String? outletIG,
    @JsonKey(name: 'OutletTIKTOK') String? outletTiktok,
    @JsonKey(name: 'OutletWeb') String? outletWeb,
    @JsonKey(name: 'ApiKey') String? apiKey,
    @JsonKey(name: 'CompanyCode') String? companyCode,
  }) = _TableData;

  factory TableData.fromJson(Map<String, dynamic> json) => _$TableDataFromJson(json);
}
