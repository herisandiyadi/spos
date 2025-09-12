// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuModelImpl _$$MenuModelImplFromJson(Map<String, dynamic> json) =>
    _$MenuModelImpl(
      status: json['status'] as String,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => MenuData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MenuModelImplToJson(_$MenuModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$MenuDataImpl _$$MenuDataImplFromJson(Map<String, dynamic> json) =>
    _$MenuDataImpl(
      menuID: json['MenuID'] as String?,
      menuCode: json['MenuCode'] as String?,
      categoryID: json['CategoryID'] as String?,
      menuImage: json['MenuImage'] as String?,
      categoryName: json['CategoryName'] as String?,
      subCategoryID: json['SubCategoryID'] as String?,
      subCategoryName: json['SubCategoryName'] as String?,
      stationID: json['StationID'] as String?,
      stationName: json['StationName'] as String?,
      menuName: json['MenuName'] as String?,
      menuDesc: json['MenuDesc'] as String?,
      menuPrice: json['MenuPrice'] as String?,
      menuDiscount: json['MenuDiscount'] as String?,
      menuType: json['MenuType'] as String?,
      addOn: (json['AddOn'] as List<dynamic>?)
              ?.map((e) => MenuAddOnGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      noteOption: (json['NoteOption'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      variant: json['Variant'] as List<dynamic>? ?? const [],
      showStatusPos: json['ShowStatusPos'] as String?,
      showStatusApps: json['ShowStatusApps'] as String?,
      availOutlet: (json['AvailOutlet'] as List<dynamic>?)
              ?.map((e) => AvailOutlet.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      arrange: (json['Arrange'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MenuDataImplToJson(_$MenuDataImpl instance) =>
    <String, dynamic>{
      'MenuID': instance.menuID,
      'MenuCode': instance.menuCode,
      'CategoryID': instance.categoryID,
      'MenuImage': instance.menuImage,
      'CategoryName': instance.categoryName,
      'SubCategoryID': instance.subCategoryID,
      'SubCategoryName': instance.subCategoryName,
      'StationID': instance.stationID,
      'StationName': instance.stationName,
      'MenuName': instance.menuName,
      'MenuDesc': instance.menuDesc,
      'MenuPrice': instance.menuPrice,
      'MenuDiscount': instance.menuDiscount,
      'MenuType': instance.menuType,
      'AddOn': instance.addOn,
      'NoteOption': instance.noteOption,
      'Variant': instance.variant,
      'ShowStatusPos': instance.showStatusPos,
      'ShowStatusApps': instance.showStatusApps,
      'AvailOutlet': instance.availOutlet,
      'Arrange': instance.arrange,
    };

_$MenuAddOnGroupImpl _$$MenuAddOnGroupImplFromJson(Map<String, dynamic> json) =>
    _$MenuAddOnGroupImpl(
      menuAddOn: (json['MenuAddOn'] as List<dynamic>?)
              ?.map((e) => MenuAddOnItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      title: json['title'] as String?,
      multiply: (json['multiply'] as num?)?.toInt(),
      required: (json['required'] as num?)?.toInt(),
      min: (json['min'] as num?)?.toInt(),
      max: (json['max'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MenuAddOnGroupImplToJson(
        _$MenuAddOnGroupImpl instance) =>
    <String, dynamic>{
      'MenuAddOn': instance.menuAddOn,
      'title': instance.title,
      'multiply': instance.multiply,
      'required': instance.required,
      'min': instance.min,
      'max': instance.max,
    };

_$MenuAddOnItemImpl _$$MenuAddOnItemImplFromJson(Map<String, dynamic> json) =>
    _$MenuAddOnItemImpl(
      menuID: json['MenuID'] as String?,
      menuName: json['MenuName'] as String?,
      menuDesc: json['MenuDesc'] as String?,
      menuPrice: json['MenuPrice'] as String?,
      menuDiscount: json['MenuDiscount'] as String?,
    );

Map<String, dynamic> _$$MenuAddOnItemImplToJson(_$MenuAddOnItemImpl instance) =>
    <String, dynamic>{
      'MenuID': instance.menuID,
      'MenuName': instance.menuName,
      'MenuDesc': instance.menuDesc,
      'MenuPrice': instance.menuPrice,
      'MenuDiscount': instance.menuDiscount,
    };

_$AvailOutletImpl _$$AvailOutletImplFromJson(Map<String, dynamic> json) =>
    _$AvailOutletImpl(
      outletID: json['OutletID'] as String?,
      outletCode: json['OutletCode'] as String?,
      outletName: json['OutletName'] as String?,
      outletAddress: json['OutletAddress'] as String?,
      outletImage: json['OutletImage'] as String?,
      outletOpen: json['OutletOpen'] as String?,
      outletClose: json['OutletClose'] as String?,
      outletFB: json['OutletFB'] as String?,
      outletIG: json['OutletIG'] as String?,
      outletTiktok: json['OutletTIKTOK'] as String?,
      outletWeb: json['OutletWeb'] as String?,
      apiKey: json['ApiKey'] as String?,
      companyCode: json['CompanyCode'] as String?,
      isDeleted: json['is_deleted'] as String?,
    );

Map<String, dynamic> _$$AvailOutletImplToJson(_$AvailOutletImpl instance) =>
    <String, dynamic>{
      'OutletID': instance.outletID,
      'OutletCode': instance.outletCode,
      'OutletName': instance.outletName,
      'OutletAddress': instance.outletAddress,
      'OutletImage': instance.outletImage,
      'OutletOpen': instance.outletOpen,
      'OutletClose': instance.outletClose,
      'OutletFB': instance.outletFB,
      'OutletIG': instance.outletIG,
      'OutletTIKTOK': instance.outletTiktok,
      'OutletWeb': instance.outletWeb,
      'ApiKey': instance.apiKey,
      'CompanyCode': instance.companyCode,
      'is_deleted': instance.isDeleted,
    };
