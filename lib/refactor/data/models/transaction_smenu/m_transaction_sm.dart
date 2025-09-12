import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_transaction_sm.freezed.dart';
part 'm_transaction_sm.g.dart';

TransactionSMModel? transactionSMFromJson(String str) {
  final jsonData = jsonDecode(str);

  if (jsonData['data'] == null) return null;

  return TransactionSMModel(
    data: List<TransactionSMData>.from(
        jsonData['data'].map((x) => TransactionSMData.fromJson(x))),
  );
}

String transactionSMToJson(TransactionSMModel data) =>
    json.encode(data.toJson());

@freezed
class TransactionSMModel with _$TransactionSMModel {
  const factory TransactionSMModel({
    String? status,
    required List<TransactionSMData> data,
  }) = _TransactionSMModel;

  factory TransactionSMModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionSMModelFromJson(json);
}

@freezed
class TransactionSMData with _$TransactionSMData {
  const factory TransactionSMData({
    @JsonKey(name: 'TransactionID') int? transactionID,
    @JsonKey(name: 'TransactionNumber') String? transactionNumber,
    @JsonKey(name: 'UrlQrCode') String? urlQRCode,
    @JsonKey(name: 'Datetime') String? datetime,
    @JsonKey(name: 'TableNumber') String? tableNumber,
    @JsonKey(name: 'TableID') String? tableID,
    @JsonKey(name: 'TableLabel') String? tableLabel,
    @JsonKey(name: 'TransactionType') String? transactionType,
    @JsonKey(name: 'CustomerID') dynamic customerID,
    @JsonKey(name: 'CustomerName') String? customerName,
    @JsonKey(name: 'PPN') int? ppn,
    @JsonKey(name: 'Rounding') int? rounding,
    @JsonKey(name: 'SubTotal') int? subTotal,
    @JsonKey(name: 'GrandTotalFinal') int? grandTotalFinal,
    @JsonKey(name: 'UniqeNumber', fromJson: _toNum) num? uniqeNumber,
    @JsonKey(name: 'StatusTransaction') String? statusTransaction,
  }) = _TransactionSMData;

  factory TransactionSMData.fromJson(Map<String, dynamic> json) =>
      _$TransactionSMDataFromJson(json);
}

// :: UniqeNumber Terkadang bertipe String
num? _toNum(dynamic value) {
  if (value == null) return null;
  if (value is num) return value;
  if (value is String) return num.tryParse(value);
  return null;
}
