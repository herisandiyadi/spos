// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuLiteModelImpl _$$MenuLiteModelImplFromJson(Map<String, dynamic> json) =>
    _$MenuLiteModelImpl(
      menuID: (json['menuID'] as num).toInt(),
      menuCode: json['menuCode'] as String,
      menuImage: json['menuImage'] as String,
      categoryID: (json['categoryID'] as num).toInt(),
      stationID: (json['stationID'] as num).toInt(),
      menuName: json['menuName'] as String,
      menuDesc: json['menuDesc'] as String,
      menuPrice: (json['menuPrice'] as num).toInt(),
      menuDiscount: (json['menuDiscount'] as num).toInt(),
      menuType: json['menuType'] as String,
      addOn: json['addOn'] as String?,
      noteOption: json['noteOption'] as String?,
      arrange: (json['arrange'] as num).toInt(),
    );

Map<String, dynamic> _$$MenuLiteModelImplToJson(_$MenuLiteModelImpl instance) =>
    <String, dynamic>{
      'menuID': instance.menuID,
      'menuCode': instance.menuCode,
      'menuImage': instance.menuImage,
      'categoryID': instance.categoryID,
      'stationID': instance.stationID,
      'menuName': instance.menuName,
      'menuDesc': instance.menuDesc,
      'menuPrice': instance.menuPrice,
      'menuDiscount': instance.menuDiscount,
      'menuType': instance.menuType,
      'addOn': instance.addOn,
      'noteOption': instance.noteOption,
      'arrange': instance.arrange,
    };
