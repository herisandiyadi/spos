// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_transaction_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionTypeLiteModelImpl _$$TransactionTypeLiteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionTypeLiteModelImpl(
      transactionTypeJuncID: (json['transactionTypeJuncID'] as num).toInt(),
      transJuncName: json['transJuncName'] as String,
      transTypeID: (json['transTypeID'] as num).toInt(),
      chargeType: json['chargeType'] as String,
      chargeValue: (json['chargeValue'] as num).toInt(),
      outletID: (json['outletID'] as num).toInt(),
    );

Map<String, dynamic> _$$TransactionTypeLiteModelImplToJson(
        _$TransactionTypeLiteModelImpl instance) =>
    <String, dynamic>{
      'transactionTypeJuncID': instance.transactionTypeJuncID,
      'transJuncName': instance.transJuncName,
      'transTypeID': instance.transTypeID,
      'chargeType': instance.chargeType,
      'chargeValue': instance.chargeValue,
      'outletID': instance.outletID,
    };
