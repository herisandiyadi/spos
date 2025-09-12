import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_menu.freezed.dart';
part 'm_menu.g.dart';

MenuModel menuModelFromJson(String str) => MenuModel.fromJson(json.decode(str));
String menuModelToJson(MenuModel data) => json.encode(data.toJson());

@freezed
class MenuModel with _$MenuModel {
  const factory MenuModel({
    required String status,
    String? message,
    @Default([]) List<MenuData> data,
  }) = _MenuModel;

  factory MenuModel.fromJson(Map<String, dynamic> json) =>
      _$MenuModelFromJson(json);
}

@freezed
class MenuData with _$MenuData {
  const factory MenuData({
    @JsonKey(name: 'MenuID') String? menuID,
    @JsonKey(name: 'MenuCode') String? menuCode,
    @JsonKey(name: 'CategoryID') String? categoryID,
    @JsonKey(name: 'MenuImage') String? menuImage,
    @JsonKey(name: 'CategoryName') String? categoryName,
    @JsonKey(name: 'SubCategoryID') String? subCategoryID,
    @JsonKey(name: 'SubCategoryName') String? subCategoryName,
    @JsonKey(name: 'StationID') String? stationID,
    @JsonKey(name: 'StationName') String? stationName,
    @JsonKey(name: 'MenuName') String? menuName,
    @JsonKey(name: 'MenuDesc') String? menuDesc,
    @JsonKey(name: 'MenuPrice') String? menuPrice,
    @JsonKey(name: 'MenuDiscount') String? menuDiscount,
    @JsonKey(name: 'MenuType') String? menuType,
    @JsonKey(name: 'AddOn') @Default([]) List<MenuAddOnGroup> addOn,
    @JsonKey(name: 'NoteOption') @Default([]) List<String> noteOption,
    @JsonKey(name: 'Variant') @Default([]) List<dynamic> variant,
    @JsonKey(name: 'ShowStatusPos') String? showStatusPos,
    @JsonKey(name: 'ShowStatusApps') String? showStatusApps,
    @JsonKey(name: 'AvailOutlet') @Default([]) List<AvailOutlet> availOutlet,
    @JsonKey(name: 'Arrange') int? arrange,
  }) = _MenuData;

  factory MenuData.fromJson(Map<String, dynamic> json) =>
      _$MenuDataFromJson(json);
}

@freezed
class MenuAddOnGroup with _$MenuAddOnGroup {
  const factory MenuAddOnGroup({
    @JsonKey(name: 'MenuAddOn') @Default([]) List<MenuAddOnItem> menuAddOn,
    String? title,
    int? multiply,
    int? required,
    int? min,
    int? max,
  }) = _MenuAddOnGroup;

  factory MenuAddOnGroup.fromJson(Map<String, dynamic> json) =>
      _$MenuAddOnGroupFromJson(json);
}

@freezed
class MenuAddOnItem with _$MenuAddOnItem {
  const factory MenuAddOnItem({
    @JsonKey(name: 'MenuID') String? menuID,
    @JsonKey(name: 'MenuName') String? menuName,
    @JsonKey(name: 'MenuDesc') String? menuDesc,
    @JsonKey(name: 'MenuPrice') String? menuPrice,
    @JsonKey(name: 'MenuDiscount') String? menuDiscount,
  }) = _MenuAddOnItem;

  factory MenuAddOnItem.fromJson(Map<String, dynamic> json) =>
      _$MenuAddOnItemFromJson(json);
}

@freezed
class AvailOutlet with _$AvailOutlet {
  const factory AvailOutlet({
    @JsonKey(name: 'OutletID') String? outletID,
    @JsonKey(name: 'OutletCode') String? outletCode,
    @JsonKey(name: 'OutletName') String? outletName,
    @JsonKey(name: 'OutletAddress') String? outletAddress,
    @JsonKey(name: 'OutletImage') String? outletImage,
    @JsonKey(name: 'OutletOpen') String? outletOpen,
    @JsonKey(name: 'OutletClose') String? outletClose,
    @JsonKey(name: 'OutletFB') String? outletFB,
    @JsonKey(name: 'OutletIG') String? outletIG,
    @JsonKey(name: 'OutletTIKTOK') String? outletTiktok,
    @JsonKey(name: 'OutletWeb') String? outletWeb,
    @JsonKey(name: 'ApiKey') String? apiKey,
    @JsonKey(name: 'CompanyCode') String? companyCode,
    @JsonKey(name: 'is_deleted') String? isDeleted,
  }) = _AvailOutlet;

  factory AvailOutlet.fromJson(Map<String, dynamic> json) =>
      _$AvailOutletFromJson(json);
}
