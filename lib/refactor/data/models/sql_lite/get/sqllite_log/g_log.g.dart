// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogLiteModelImpl _$$LogLiteModelImplFromJson(Map<String, dynamic> json) =>
    _$LogLiteModelImpl(
      logID: (json['logID'] as num).toInt(),
      dateTime: json['dateTime'] as String,
      transactionNumber: json['transactionNumber'] as String,
      statusReturn: json['statusReturn'] as String,
      statusMessage: json['statusMessage'] as String,
    );

Map<String, dynamic> _$$LogLiteModelImplToJson(_$LogLiteModelImpl instance) =>
    <String, dynamic>{
      'logID': instance.logID,
      'dateTime': instance.dateTime,
      'transactionNumber': instance.transactionNumber,
      'statusReturn': instance.statusReturn,
      'statusMessage': instance.statusMessage,
    };
