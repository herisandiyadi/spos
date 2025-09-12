import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_discount.freezed.dart';
part 'm_discount.g.dart';

DiscountModel discountModelFromJson(String str) =>
    DiscountModel.fromJson(json.decode(str));
String discountModelToJson(DiscountModel data) => json.encode(data.toJson());

@freezed
class DiscountModel with _$DiscountModel {
  const factory DiscountModel({
    required String status,
    String? message,
    @Default([]) List<DiscountData> data,
  }) = _DiscountModel;

  factory DiscountModel.fromJson(Map<String, dynamic> json) =>
      _$DiscountModelFromJson(json);
}

@freezed
class DiscountData with _$DiscountData {
  const factory DiscountData(
      {@JsonKey(name: 'MasterDiscountID') String? masterDiscountID,
      @JsonKey(name: 'MasterDiscountName') String? masterDiscountName,
      @JsonKey(name: 'DiscountType') String? discountType,
      @JsonKey(name: 'ValueType') String? valueType,
      @JsonKey(name: 'DiscountValue') String? discountValue,
      @JsonKey(name: 'QtyDiscount') String? qtyDiscount,
      @JsonKey(name: 'SpesificMenuID')
      @Default([])
      List<DiscountMenu> spesificMenu,
      @JsonKey(name: 'DiscountValidFrom') String? discountValidFrom,
      @JsonKey(name: 'DiscountValidUntil') String? discountValidUntil,
      @JsonKey(name: 'MinTransDiscount') String? minTransDiscount,
      @JsonKey(name: 'OutletID') String? outletId,
      @JsonKey(name: 'MaxDiscount') String? maxDiscount,
      @JsonKey(name: 'CompanyCode') String? companyCode,
      @Default([])
      @JsonKey(
          name: 'AvailableDay',
          fromJson: _parseAvailableDay,
          toJson: _writeAvailableDay)
      List<String> availableDay}) = _DiscountData;

  factory DiscountData.fromJson(Map<String, dynamic> json) =>
      _$DiscountDataFromJson(json);
}

@freezed
class DiscountMenu with _$DiscountMenu {
  const factory DiscountMenu(
      {@JsonKey(name: 'MenuID') String? menuID,
      @JsonKey(name: 'MenuCode') String? menuCode,
      @JsonKey(name: 'MenuImage') String? menuImage,
      @JsonKey(name: 'CategoryID') String? categoryID,
      @JsonKey(name: 'SubCategoryID') String? subCategoryID,
      @JsonKey(name: 'StationID') String? stationID,
      @JsonKey(name: 'MenuName') String? menuName,
      @JsonKey(name: 'MenuDesc') String? menuDesc,
      @JsonKey(name: 'MenuPrice') String? menuPrice,
      @JsonKey(name: 'MenuDiscount') String? menuDiscount,
      @JsonKey(name: 'MenuType') String? menuType,
      @JsonKey(name: 'AddOn', fromJson: _parseAddOns)
      List<MenuAddOnGroup>? addOn,
      @JsonKey(name: 'NoteOption', fromJson: _parseNoteOptions)
      List<String>? noteOption,
      @JsonKey(name: 'Varian', fromJson: _parseVariants) List<dynamic>? variant,
      @JsonKey(name: 'AvailOutlet', fromJson: _parseAvailOutlets)
      List<String>? availOutlet,
      @JsonKey(name: 'ShowStatusPos') String? showStatusPos,
      @JsonKey(name: 'ShowStatusApps') String? showStatusApps,
      @JsonKey(name: 'CompanyCode') String? companyCode,
      @JsonKey(name: 'AvailableDay', fromJson: _parseAvailableDay)
      List<String>? availableDay}) = _DiscountMenu;

  factory DiscountMenu.fromJson(Map<String, dynamic> json) =>
      _$DiscountMenuFromJson(json);
}

@freezed
class MenuAddOnGroup with _$MenuAddOnGroup {
  const factory MenuAddOnGroup({
    String? title,
    @JsonKey(name: 'addOn') List<int>? addOnIDs,
    int? multiply,
    int? required,
    int? min,
    int? max,
  }) = _MenuAddOnGroup;

  factory MenuAddOnGroup.fromJson(Map<String, dynamic> json) =>
      _$MenuAddOnGroupFromJson(json);
}

// :: Custom JSON decoders for stringified fields
List<MenuAddOnGroup> _parseAddOns(dynamic value) {
  if (value is String && value.isNotEmpty) {
    final List parsed = json.decode(value);
    return parsed.map((e) => MenuAddOnGroup.fromJson(e)).toList();
  }
  return [];
}

List<String> _parseNoteOptions(dynamic value) {
  if (value is String && value.isNotEmpty) {
    final List parsed = json.decode(value);
    return parsed.map((e) => e.toString()).toList();
  }
  return [];
}

List<dynamic> _parseVariants(dynamic value) {
  if (value is String && value.isNotEmpty) {
    return json.decode(value);
  }
  return [];
}

List<String> _parseAvailableDay(dynamic value) {
  if (value is String && value.isNotEmpty) {
    final List parsed = json.decode(value);
    return parsed.map((e) => e.toString()).toList();
  }
  return [];
}

dynamic _writeAvailableDay(List<String> days) {
  return json.encode(days);
}

List<String> _parseAvailOutlets(dynamic value) {
  if (value is String && value.isNotEmpty) {
    final List parsed = json.decode(value);
    return parsed.map((e) => e.toString()).toList();
  }
  return [];
}
