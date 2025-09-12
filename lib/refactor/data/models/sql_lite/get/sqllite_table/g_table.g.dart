// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TableLiteModelImpl _$$TableLiteModelImplFromJson(Map<String, dynamic> json) =>
    _$TableLiteModelImpl(
      tableID: (json['tableID'] as num).toInt(),
      locationID: (json['locationID'] as num).toInt(),
      tableNumber: (json['tableNumber'] as num).toInt(),
      tableLabel: json['tableLabel'] as String,
      outletID: (json['outletID'] as num).toInt(),
      tableStatus: json['tableStatus'] as String,
      dateTime: json['datetime'] as String?,
      transactionNumber: json['transactionNumber'] as String?,
      statusTransaction: json['statusTransaction'] as String?,
      uniqueNumberSM: (json['uniqueNumberSM'] as num?)?.toInt(),
      dateTimeSM: json['dateTimeSM'] as String?,
    );

Map<String, dynamic> _$$TableLiteModelImplToJson(
        _$TableLiteModelImpl instance) =>
    <String, dynamic>{
      'tableID': instance.tableID,
      'locationID': instance.locationID,
      'tableNumber': instance.tableNumber,
      'tableLabel': instance.tableLabel,
      'outletID': instance.outletID,
      'tableStatus': instance.tableStatus,
      'datetime': instance.dateTime,
      'transactionNumber': instance.transactionNumber,
      'statusTransaction': instance.statusTransaction,
      'uniqueNumberSM': instance.uniqueNumberSM,
      'dateTimeSM': instance.dateTimeSM,
    };
