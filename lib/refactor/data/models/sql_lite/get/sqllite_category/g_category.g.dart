// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryLiteModelImpl _$$CategoryLiteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryLiteModelImpl(
      categoryID: (json['categoryID'] as num).toInt(),
      categoryName: json['categoryName'] as String,
      categoryImage: json['categoryImage'] as String,
    );

Map<String, dynamic> _$$CategoryLiteModelImplToJson(
        _$CategoryLiteModelImpl instance) =>
    <String, dynamic>{
      'categoryID': instance.categoryID,
      'categoryName': instance.categoryName,
      'categoryImage': instance.categoryImage,
    };
