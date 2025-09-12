import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_transaction_type.freezed.dart';
part 'm_transaction_type.g.dart';

TransactionTypeModel transactionTypeFromJson(String str) => TransactionTypeModel.fromJson(json.decode(str));
String transactionTypeToJson(TransactionTypeModel data) => json.encode(data.toJson());

@freezed
class TransactionTypeModel with _$TransactionTypeModel {
  const factory TransactionTypeModel({
    required String status,
    String? message,
    @Default([]) List<TransactionTypeData> data,
  }) = _TransactionTypeModel;

  factory TransactionTypeModel.fromJson(Map<String, dynamic> json) => _$TransactionTypeModelFromJson(json);
}

@freezed
class TransactionTypeData with _$TransactionTypeData {
  const factory TransactionTypeData({
    @JsonKey(name: 'TransactionTypeJuncID') String? transactionTypeJuncID,
    @JsonKey(name: 'TransJuncName') String? transJuncName,
    @JsonKey(name: 'TransTypeID') String? transTypeID,
    @JsonKey(name: 'ChargeType') String? chargeType,
    @JsonKey(name: 'ChargeValue') String? chargeValue,
    @JsonKey(name: 'OutletID') String? outletID,
    @JsonKey(name: 'TypeName') String? typeName,
  }) = _TransactionTypeData;

  factory TransactionTypeData.fromJson(Map<String, dynamic> json) => _$TransactionTypeDataFromJson(json);
}
