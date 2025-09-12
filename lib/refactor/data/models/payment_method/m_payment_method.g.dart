// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentMethodModelImpl _$$PaymentMethodModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentMethodModelImpl(
      status: json['status'] as String,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
              ?.map(
                  (e) => PaymentMethodData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PaymentMethodModelImplToJson(
        _$PaymentMethodModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$PaymentMethodDataImpl _$$PaymentMethodDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentMethodDataImpl(
      paymentMethodID: json['PaymentMethodID'] as String?,
      paymentMethodName: json['PaymentMethodName'] as String?,
      paymentFee: json['PaymentFee'] as String?,
      companyCode: json['CompanyCode'] as String?,
    );

Map<String, dynamic> _$$PaymentMethodDataImplToJson(
        _$PaymentMethodDataImpl instance) =>
    <String, dynamic>{
      'PaymentMethodID': instance.paymentMethodID,
      'PaymentMethodName': instance.paymentMethodName,
      'PaymentFee': instance.paymentFee,
      'CompanyCode': instance.companyCode,
    };
