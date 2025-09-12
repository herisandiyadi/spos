// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiscountLiteModelImpl _$$DiscountLiteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DiscountLiteModelImpl(
      masterDiscountID: (json['masterDiscountID'] as num).toInt(),
      masterDiscountName: json['masterDiscountName'] as String,
      discountType: (json['discountType'] as num).toInt(),
      valueType: json['valueType'] as String,
      discountValue: (json['discountValue'] as num).toInt(),
      spesificMenuID: const ListMapConverter().fromJson(json['spesificMenuID']),
      discountValidFrom: json['discountValidFrom'] as String,
      discountValidUntil: json['discountValidUntil'] as String,
      minTransDiscount: (json['minTransDiscount'] as num).toInt(),
      outletID: (json['outletID'] as num).toInt(),
      maxDiscount: (json['maxDiscount'] as num).toInt(),
      qtyDiscount: (json['qtyDiscount'] as num).toInt(),
      availableDay: (json['availableDay'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$DiscountLiteModelImplToJson(
        _$DiscountLiteModelImpl instance) =>
    <String, dynamic>{
      'masterDiscountID': instance.masterDiscountID,
      'masterDiscountName': instance.masterDiscountName,
      'discountType': instance.discountType,
      'valueType': instance.valueType,
      'discountValue': instance.discountValue,
      'spesificMenuID':
          const ListMapConverter().toJson(instance.spesificMenuID),
      'discountValidFrom': instance.discountValidFrom,
      'discountValidUntil': instance.discountValidUntil,
      'minTransDiscount': instance.minTransDiscount,
      'outletID': instance.outletID,
      'maxDiscount': instance.maxDiscount,
      'qtyDiscount': instance.qtyDiscount,
      'availableDay': instance.availableDay,
    };

_$DiscountMenuLiteImpl _$$DiscountMenuLiteImplFromJson(
        Map<String, dynamic> json) =>
    _$DiscountMenuLiteImpl(
      menuID: json['menuID'] as String?,
      menuCode: json['menuCode'] as String?,
      menuImage: json['menuImage'] as String?,
      categoryID: json['categoryID'] as String?,
      subCategoryID: json['subCategoryID'] as String?,
      stationID: json['stationID'] as String?,
      menuName: json['menuName'] as String?,
      menuDesc: json['menuDesc'] as String?,
      menuPrice: json['menuPrice'] as String?,
      menuDiscount: json['menuDiscount'] as String?,
      menuType: json['menuType'] as String?,
      addOn: _parseAddOns(json['addOn']),
      noteOption: _parseNoteOptions(json['noteOption']),
      variant: _parseVariants(json['varian']),
      availOutlet: _parseAvailOutlets(json['availOutlet']),
      showStatusPos: json['showStatusPos'] as String?,
      showStatusApps: json['showStatusApps'] as String?,
      companyCode: json['companyCode'] as String?,
      availableDay: _parseAvailableDay(json['availableDay']),
    );

Map<String, dynamic> _$$DiscountMenuLiteImplToJson(
        _$DiscountMenuLiteImpl instance) =>
    <String, dynamic>{
      'menuID': instance.menuID,
      'menuCode': instance.menuCode,
      'menuImage': instance.menuImage,
      'categoryID': instance.categoryID,
      'subCategoryID': instance.subCategoryID,
      'stationID': instance.stationID,
      'menuName': instance.menuName,
      'menuDesc': instance.menuDesc,
      'menuPrice': instance.menuPrice,
      'menuDiscount': instance.menuDiscount,
      'menuType': instance.menuType,
      'addOn': instance.addOn,
      'noteOption': instance.noteOption,
      'varian': instance.variant,
      'availOutlet': instance.availOutlet,
      'showStatusPos': instance.showStatusPos,
      'showStatusApps': instance.showStatusApps,
      'companyCode': instance.companyCode,
      'availableDay': instance.availableDay,
    };

_$MenuAddOnGroupLiteImpl _$$MenuAddOnGroupLiteImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuAddOnGroupLiteImpl(
      title: json['title'] as String?,
      addOnIDs: (json['addOnIDs'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      multiply: (json['multiply'] as num?)?.toInt(),
      required: (json['required'] as num?)?.toInt(),
      min: (json['min'] as num?)?.toInt(),
      max: (json['max'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MenuAddOnGroupLiteImplToJson(
        _$MenuAddOnGroupLiteImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'addOnIDs': instance.addOnIDs,
      'multiply': instance.multiply,
      'required': instance.required,
      'min': instance.min,
      'max': instance.max,
    };
