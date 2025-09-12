// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_transaction_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionReportModelImpl _$$TransactionReportModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionReportModelImpl(
      discountTotal: (json['discount_total'] as num?)?.toInt(),
      grandTotalBeforeTax: (json['grand_total_before_tax'] as num?)?.toInt(),
      grandTotalAfterTax: (json['grand_total_after_tax'] as num?)?.toInt(),
      totalRounding: (json['total_rounding'] as num?)?.toInt(),
      grandTotalFinal: (json['grand_total_final'] as num?)?.toInt(),
      totalTransactionClose: (json['total_transaction_close'] as num?)?.toInt(),
      totalPaymentMethod: (json['total_payment_method'] as num?)?.toInt(),
      averageSpentTransaction:
          (json['average_spent_per_transaction'] as num?)?.toInt(),
      percentageGrandTotalFinal:
          (json['percentage_grand_total_final'] as num?)?.toDouble(),
      percentageAVG: (json['percentage_avg'] as num?)?.toDouble(),
      percentageTotalTransaction:
          (json['percentage_total_transaction'] as num?)?.toDouble(),
      percentageTotalDiscount:
          (json['percentage_total_discount'] as num?)?.toDouble(),
      paymentMethod: (json['payment_method'] as List<dynamic>?)
              ?.map((e) => PaymentMethod.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      detatilTrans: (json['detatilTrans'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      grand_total_tax: (json['grand_total_tax'] as num?)?.toInt(),
      grand_total_tax1: (json['grand_total_tax1'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TransactionReportModelImplToJson(
        _$TransactionReportModelImpl instance) =>
    <String, dynamic>{
      'discount_total': instance.discountTotal,
      'grand_total_before_tax': instance.grandTotalBeforeTax,
      'grand_total_after_tax': instance.grandTotalAfterTax,
      'total_rounding': instance.totalRounding,
      'grand_total_final': instance.grandTotalFinal,
      'total_transaction_close': instance.totalTransactionClose,
      'total_payment_method': instance.totalPaymentMethod,
      'average_spent_per_transaction': instance.averageSpentTransaction,
      'percentage_grand_total_final': instance.percentageGrandTotalFinal,
      'percentage_avg': instance.percentageAVG,
      'percentage_total_transaction': instance.percentageTotalTransaction,
      'percentage_total_discount': instance.percentageTotalDiscount,
      'payment_method': instance.paymentMethod,
      'detatilTrans': instance.detatilTrans,
      'grand_total_tax': instance.grand_total_tax,
      'grand_total_tax1': instance.grand_total_tax1,
    };

_$PaymentMethodImpl _$$PaymentMethodImplFromJson(Map<String, dynamic> json) =>
    _$PaymentMethodImpl(
      method: json['method'] as String?,
      totalAmount: (json['total_amount'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PaymentMethodImplToJson(_$PaymentMethodImpl instance) =>
    <String, dynamic>{
      'method': instance.method,
      'total_amount': instance.totalAmount,
      'total': instance.total,
    };

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      menuName: json['menu_name'] as String?,
      totalQty: json['total_qty'] as String?,
      totalPrice: json['total_price'] as String?,
      typeProduct: json['type'] as String?,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'menu_name': instance.menuName,
      'total_qty': instance.totalQty,
      'total_price': instance.totalPrice,
      'type': instance.typeProduct,
    };
