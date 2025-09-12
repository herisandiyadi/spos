// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_transaction_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionTypeModelImpl _$$TransactionTypeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionTypeModelImpl(
      status: json['status'] as String,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  TransactionTypeData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TransactionTypeModelImplToJson(
        _$TransactionTypeModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$TransactionTypeDataImpl _$$TransactionTypeDataImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionTypeDataImpl(
      transactionTypeJuncID: json['TransactionTypeJuncID'] as String?,
      transJuncName: json['TransJuncName'] as String?,
      transTypeID: json['TransTypeID'] as String?,
      chargeType: json['ChargeType'] as String?,
      chargeValue: json['ChargeValue'] as String?,
      outletID: json['OutletID'] as String?,
      typeName: json['TypeName'] as String?,
    );

Map<String, dynamic> _$$TransactionTypeDataImplToJson(
        _$TransactionTypeDataImpl instance) =>
    <String, dynamic>{
      'TransactionTypeJuncID': instance.transactionTypeJuncID,
      'TransJuncName': instance.transJuncName,
      'TransTypeID': instance.transTypeID,
      'ChargeType': instance.chargeType,
      'ChargeValue': instance.chargeValue,
      'OutletID': instance.outletID,
      'TypeName': instance.typeName,
    };
