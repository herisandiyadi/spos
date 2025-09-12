import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_table.freezed.dart';
part 'g_table.g.dart';

@freezed
class TableLiteModel with _$TableLiteModel {
  const factory TableLiteModel({
    @JsonKey(name: 'tableID') required int tableID,
    @JsonKey(name: 'locationID') required int locationID,
    @JsonKey(name: 'tableNumber') required int tableNumber,
    @JsonKey(name: 'tableLabel') required String tableLabel,
    @JsonKey(name: 'outletID') required int outletID,
    @JsonKey(name: 'tableStatus') required String tableStatus,
    @JsonKey(name: 'datetime') String? dateTime,
    @JsonKey(name: 'transactionNumber') String? transactionNumber,
    @JsonKey(name: 'statusTransaction') String? statusTransaction,
    @JsonKey(name: 'uniqueNumberSM') int? uniqueNumberSM,
    @JsonKey(name: 'dateTimeSM') String? dateTimeSM,
  }) = _TableLiteModel;

  factory TableLiteModel.fromJson(Map<String, dynamic> json) => _$TableLiteModelFromJson(json);
}
