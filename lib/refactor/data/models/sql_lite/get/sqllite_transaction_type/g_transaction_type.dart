import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_transaction_type.freezed.dart';
part 'g_transaction_type.g.dart';

@freezed
class TransactionTypeLiteModel with _$TransactionTypeLiteModel {
  const factory TransactionTypeLiteModel({
    @JsonKey(name: 'transactionTypeJuncID') required int transactionTypeJuncID,
    @JsonKey(name: 'transJuncName') required String transJuncName,
    @JsonKey(name: 'transTypeID') required int transTypeID,
    @JsonKey(name: 'chargeType') required String chargeType,
    @JsonKey(name: 'chargeValue') required int chargeValue,
    @JsonKey(name: 'outletID') required int outletID,
  }) = _TransactionTypeLiteModel;

  factory TransactionTypeLiteModel.fromJson(Map<String, dynamic> json) => _$TransactionTypeLiteModelFromJson(json);
}
