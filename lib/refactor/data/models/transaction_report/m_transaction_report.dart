import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_transaction_report.freezed.dart';
part 'm_transaction_report.g.dart';

TransactionReportModel? transactionReportFromJson(String str) {
  final jsonData = jsonDecode(str);

  if (jsonData['data'] == null) return null;

  return TransactionReportModel.fromJson(jsonData['data']);
}

String transactionReportToJson(TransactionReportModel data) =>
    json.encode(data.toJson());

@freezed
class TransactionReportModel with _$TransactionReportModel {
  const factory TransactionReportModel({
    @JsonKey(name: 'discount_total') int? discountTotal,
    @JsonKey(name: 'grand_total_before_tax') int? grandTotalBeforeTax,
    @JsonKey(name: 'grand_total_after_tax') int? grandTotalAfterTax,
    @JsonKey(name: 'total_rounding') int? totalRounding,
    @JsonKey(name: 'grand_total_final') int? grandTotalFinal,
    @JsonKey(name: 'total_transaction_close') int? totalTransactionClose,
    @JsonKey(name: 'total_payment_method') int? totalPaymentMethod,
    @JsonKey(name: 'average_spent_per_transaction')
    int? averageSpentTransaction,
    @JsonKey(name: 'percentage_grand_total_final')
    double? percentageGrandTotalFinal,
    @JsonKey(name: 'percentage_avg') double? percentageAVG,
    @JsonKey(name: 'percentage_total_transaction')
    double? percentageTotalTransaction,
    @JsonKey(name: 'percentage_total_discount') double? percentageTotalDiscount,
    @JsonKey(name: 'payment_method')
    @Default([])
    List<PaymentMethod> paymentMethod,
    @JsonKey(name: 'detatilTrans') @Default([]) List<Product> detatilTrans,
    @JsonKey(name: 'grand_total_tax') int? grand_total_tax,
    @JsonKey(name: 'grand_total_tax1') int? grand_total_tax1,
  }) = _TransactionReportModel;

  factory TransactionReportModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionReportModelFromJson(json);
}

@freezed
class PaymentMethod with _$PaymentMethod {
  const factory PaymentMethod({
    String? method,
    @JsonKey(name: 'total_amount') int? totalAmount,
    int? total,
  }) = _PaymentMethod;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    @JsonKey(name: 'menu_name') String? menuName,
    @JsonKey(name: 'total_qty') String? totalQty,
    @JsonKey(name: 'total_price') String? totalPrice,
    @JsonKey(name: 'type') String? typeProduct,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
