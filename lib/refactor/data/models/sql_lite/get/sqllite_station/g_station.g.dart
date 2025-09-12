// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StationLiteModelImpl _$$StationLiteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StationLiteModelImpl(
      stationID: (json['stationID'] as num).toInt(),
      stationName: json['stationName'] as String,
      outletID: (json['outletID'] as num).toInt(),
    );

Map<String, dynamic> _$$StationLiteModelImplToJson(
        _$StationLiteModelImpl instance) =>
    <String, dynamic>{
      'stationID': instance.stationID,
      'stationName': instance.stationName,
      'outletID': instance.outletID,
    };
