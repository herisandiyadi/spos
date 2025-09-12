// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StationModelImpl _$$StationModelImplFromJson(Map<String, dynamic> json) =>
    _$StationModelImpl(
      status: json['status'] as String,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => StationData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StationModelImplToJson(_$StationModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$StationDataImpl _$$StationDataImplFromJson(Map<String, dynamic> json) =>
    _$StationDataImpl(
      stationID: json['StationID'] as String?,
      stationName: json['StationName'] as String?,
      outletID: json['OutletID'] as String?,
      companyCode: json['CompanyCode'] as String?,
    );

Map<String, dynamic> _$$StationDataImplToJson(_$StationDataImpl instance) =>
    <String, dynamic>{
      'StationID': instance.stationID,
      'StationName': instance.stationName,
      'OutletID': instance.outletID,
      'CompanyCode': instance.companyCode,
    };
