// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationLiteModelImpl _$$LocationLiteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LocationLiteModelImpl(
      locationID: (json['locationID'] as num).toInt(),
      outletID: (json['outletID'] as num).toInt(),
      locationCode: json['locationCode'] as String,
      locationLabel: json['locationLabel'] as String,
    );

Map<String, dynamic> _$$LocationLiteModelImplToJson(
        _$LocationLiteModelImpl instance) =>
    <String, dynamic>{
      'locationID': instance.locationID,
      'outletID': instance.outletID,
      'locationCode': instance.locationCode,
      'locationLabel': instance.locationLabel,
    };
