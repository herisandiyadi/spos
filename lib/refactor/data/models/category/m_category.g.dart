// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      status: json['status'] as String,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$CategoryDataImpl _$$CategoryDataImplFromJson(Map<String, dynamic> json) =>
    _$CategoryDataImpl(
      categoryID: json['CategoryID'] as String?,
      categoryName: json['CategoryName'] as String?,
      categoryImage: json['CategoryImage'] as String?,
      outletID: json['OutletID'] as String?,
      companyCode: json['CompanyCode'] as String?,
      isDeleted: json['is_deleted'] as String?,
      showPOS: json['ShowPOS'] as String?,
    );

Map<String, dynamic> _$$CategoryDataImplToJson(_$CategoryDataImpl instance) =>
    <String, dynamic>{
      'CategoryID': instance.categoryID,
      'CategoryName': instance.categoryName,
      'CategoryImage': instance.categoryImage,
      'OutletID': instance.outletID,
      'CompanyCode': instance.companyCode,
      'is_deleted': instance.isDeleted,
      'ShowPOS': instance.showPOS,
    };
