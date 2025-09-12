// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_activity_pos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActPOSLiteModelImpl _$$ActPOSLiteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ActPOSLiteModelImpl(
      logID: (json['logID'] as num).toInt(),
      userID: (json['userID'] as num).toInt(),
      datetime: json['datetime'] as String,
      activityType: json['activityType'] as String,
      reffID: json['reffID'] as String,
      activityDesc: json['activityDesc'] as String,
      ipAddress: json['ipAddress'] as String,
      deviceName: json['deviceName'] as String,
      companyCode: json['companyCode'] as String,
    );

Map<String, dynamic> _$$ActPOSLiteModelImplToJson(
        _$ActPOSLiteModelImpl instance) =>
    <String, dynamic>{
      'logID': instance.logID,
      'userID': instance.userID,
      'datetime': instance.datetime,
      'activityType': instance.activityType,
      'reffID': instance.reffID,
      'activityDesc': instance.activityDesc,
      'ipAddress': instance.ipAddress,
      'deviceName': instance.deviceName,
      'companyCode': instance.companyCode,
    };
