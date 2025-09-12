// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiscountModelImpl _$$DiscountModelImplFromJson(Map<String, dynamic> json) =>
    _$DiscountModelImpl(
      status: json['status'] as String,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => DiscountData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DiscountModelImplToJson(_$DiscountModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_$DiscountDataImpl _$$DiscountDataImplFromJson(Map<String, dynamic> json) =>
    _$DiscountDataImpl(
      masterDiscountID: json['MasterDiscountID'] as String?,
      masterDiscountName: json['MasterDiscountName'] as String?,
      discountType: json['DiscountType'] as String?,
      valueType: json['ValueType'] as String?,
      discountValue: json['DiscountValue'] as String?,
      qtyDiscount: json['QtyDiscount'] as String?,
      spesificMenu: (json['SpesificMenuID'] as List<dynamic>?)
              ?.map((e) => DiscountMenu.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      discountValidFrom: json['DiscountValidFrom'] as String?,
      discountValidUntil: json['DiscountValidUntil'] as String?,
      minTransDiscount: json['MinTransDiscount'] as String?,
      outletId: json['OutletID'] as String?,
      maxDiscount: json['MaxDiscount'] as String?,
      companyCode: json['CompanyCode'] as String?,
      availableDay: json['AvailableDay'] == null
          ? const []
          : _parseAvailableDay(json['AvailableDay']),
    );

Map<String, dynamic> _$$DiscountDataImplToJson(_$DiscountDataImpl instance) =>
    <String, dynamic>{
      'MasterDiscountID': instance.masterDiscountID,
      'MasterDiscountName': instance.masterDiscountName,
      'DiscountType': instance.discountType,
      'ValueType': instance.valueType,
      'DiscountValue': instance.discountValue,
      'QtyDiscount': instance.qtyDiscount,
      'SpesificMenuID': instance.spesificMenu,
      'DiscountValidFrom': instance.discountValidFrom,
      'DiscountValidUntil': instance.discountValidUntil,
      'MinTransDiscount': instance.minTransDiscount,
      'OutletID': instance.outletId,
      'MaxDiscount': instance.maxDiscount,
      'CompanyCode': instance.companyCode,
      'AvailableDay': _writeAvailableDay(instance.availableDay),
    };

_$DiscountMenuImpl _$$DiscountMenuImplFromJson(Map<String, dynamic> json) =>
    _$DiscountMenuImpl(
      menuID: json['MenuID'] as String?,
      menuCode: json['MenuCode'] as String?,
      menuImage: json['MenuImage'] as String?,
      categoryID: json['CategoryID'] as String?,
      subCategoryID: json['SubCategoryID'] as String?,
      stationID: json['StationID'] as String?,
      menuName: json['MenuName'] as String?,
      menuDesc: json['MenuDesc'] as String?,
      menuPrice: json['MenuPrice'] as String?,
      menuDiscount: json['MenuDiscount'] as String?,
      menuType: json['MenuType'] as String?,
      addOn: _parseAddOns(json['AddOn']),
      noteOption: _parseNoteOptions(json['NoteOption']),
      variant: _parseVariants(json['Varian']),
      availOutlet: _parseAvailOutlets(json['AvailOutlet']),
      showStatusPos: json['ShowStatusPos'] as String?,
      showStatusApps: json['ShowStatusApps'] as String?,
      companyCode: json['CompanyCode'] as String?,
      availableDay: _parseAvailableDay(json['AvailableDay']),
    );

Map<String, dynamic> _$$DiscountMenuImplToJson(_$DiscountMenuImpl instance) =>
    <String, dynamic>{
      'MenuID': instance.menuID,
      'MenuCode': instance.menuCode,
      'MenuImage': instance.menuImage,
      'CategoryID': instance.categoryID,
      'SubCategoryID': instance.subCategoryID,
      'StationID': instance.stationID,
      'MenuName': instance.menuName,
      'MenuDesc': instance.menuDesc,
      'MenuPrice': instance.menuPrice,
      'MenuDiscount': instance.menuDiscount,
      'MenuType': instance.menuType,
      'AddOn': instance.addOn,
      'NoteOption': instance.noteOption,
      'Varian': instance.variant,
      'AvailOutlet': instance.availOutlet,
      'ShowStatusPos': instance.showStatusPos,
      'ShowStatusApps': instance.showStatusApps,
      'CompanyCode': instance.companyCode,
      'AvailableDay': instance.availableDay,
    };

_$MenuAddOnGroupImpl _$$MenuAddOnGroupImplFromJson(Map<String, dynamic> json) =>
    _$MenuAddOnGroupImpl(
      title: json['title'] as String?,
      addOnIDs: (json['addOn'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      multiply: (json['multiply'] as num?)?.toInt(),
      required: (json['required'] as num?)?.toInt(),
      min: (json['min'] as num?)?.toInt(),
      max: (json['max'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MenuAddOnGroupImplToJson(
        _$MenuAddOnGroupImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'addOn': instance.addOnIDs,
      'multiply': instance.multiply,
      'required': instance.required,
      'min': instance.min,
      'max': instance.max,
    };
