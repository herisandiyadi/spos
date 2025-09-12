import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_discount.freezed.dart';
part 'g_discount.g.dart';

class ListMapConverter
    implements JsonConverter<List<Map<String, dynamic>>, dynamic> {
  const ListMapConverter();

  @override
  List<Map<String, dynamic>> fromJson(dynamic json) {
    try {
      if (json == null || (json is String && json.trim().isEmpty)) return [];

      if (json is String) {
        final decoded = jsonDecode(json);
        if (decoded is List) {
          return List<Map<String, dynamic>>.from(decoded);
        }
      }

      if (json is List) {
        return List<Map<String, dynamic>>.from(json);
      }
    } catch (e) {
      throw Exception("Error list map converter: $e, raw: $json");
    }

    return [];
  }

  @override
  dynamic toJson(List<Map<String, dynamic>> object) => object;
}

@freezed
class DiscountLiteModel with _$DiscountLiteModel {
  const factory DiscountLiteModel({
    @JsonKey(name: 'masterDiscountID') required int masterDiscountID,
    @JsonKey(name: 'masterDiscountName') required String masterDiscountName,
    @JsonKey(name: 'discountType') required int discountType,
    @JsonKey(name: 'valueType') required String valueType,
    @JsonKey(name: 'discountValue') required int discountValue,
    @JsonKey(name: 'spesificMenuID')
    @ListMapConverter()
    required List<Map<String, dynamic>> spesificMenuID,
    @JsonKey(name: 'discountValidFrom') required String discountValidFrom,
    @JsonKey(name: 'discountValidUntil') required String discountValidUntil,
    @JsonKey(name: 'minTransDiscount') required int minTransDiscount,
    @JsonKey(name: 'outletID') required int outletID,
    @JsonKey(name: 'maxDiscount') required int maxDiscount,
    @JsonKey(name: 'qtyDiscount') required int qtyDiscount,
    @JsonKey(name: 'availableDay') required List<String> availableDay,
  }) = _DiscountLiteModel;

  factory DiscountLiteModel.fromJson(Map<String, dynamic> json) =>
      _$DiscountLiteModelFromJson(json);
}

@freezed
class DiscountMenuLite with _$DiscountMenuLite {
  const factory DiscountMenuLite({
    @JsonKey(name: 'menuID') String? menuID,
    @JsonKey(name: 'menuCode') String? menuCode,
    @JsonKey(name: 'menuImage') String? menuImage,
    @JsonKey(name: 'categoryID') String? categoryID,
    @JsonKey(name: 'subCategoryID') String? subCategoryID,
    @JsonKey(name: 'stationID') String? stationID,
    @JsonKey(name: 'menuName') String? menuName,
    @JsonKey(name: 'menuDesc') String? menuDesc,
    @JsonKey(name: 'menuPrice') String? menuPrice,
    @JsonKey(name: 'menuDiscount') String? menuDiscount,
    @JsonKey(name: 'menuType') String? menuType,
    @JsonKey(name: 'addOn', fromJson: _parseAddOns)
    List<MenuAddOnGroupLite>? addOn,
    @JsonKey(name: 'noteOption', fromJson: _parseNoteOptions)
    List<String>? noteOption,
    @JsonKey(name: 'varian', fromJson: _parseVariants) List<dynamic>? variant,
    @JsonKey(name: 'availOutlet', fromJson: _parseAvailOutlets)
    List<String>? availOutlet,
    @JsonKey(name: 'showStatusPos') String? showStatusPos,
    @JsonKey(name: 'showStatusApps') String? showStatusApps,
    @JsonKey(name: 'companyCode') String? companyCode,
    @JsonKey(name: 'availableDay', fromJson: _parseAvailableDay)
    List<String>? availableDay,
  }) = _DiscountMenuLite;

  factory DiscountMenuLite.fromJson(Map<String, dynamic> json) =>
      _$DiscountMenuLiteFromJson(json);
}

@freezed
class MenuAddOnGroupLite with _$MenuAddOnGroupLite {
  const factory MenuAddOnGroupLite({
    String? title,
    @JsonKey(name: 'addOnIDs') List<int>? addOnIDs,
    int? multiply,
    int? required,
    int? min,
    int? max,
  }) = _MenuAddOnGroupLite;

  factory MenuAddOnGroupLite.fromJson(Map<String, dynamic> json) =>
      _$MenuAddOnGroupLiteFromJson(json);
}

// :: Custom JSON decoders for stringified fields
List<MenuAddOnGroupLite> _parseAddOns(dynamic value) {
  if (value is String && value.isNotEmpty) {
    final List parsed = json.decode(value);
    return parsed.map((e) => MenuAddOnGroupLite.fromJson(e)).toList();
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

List<String> _parseAvailableDay(dynamic value) {
  if (value is String && value.isNotEmpty) {
    try {
      final List parsed = json.decode(value);
      return parsed.map((e) => e.toString()).toList();
    } catch (e) {
      return [];
    }
  }
  return [];
}

List<dynamic> _parseVariants(dynamic value) {
  if (value is String && value.isNotEmpty) {
    return json.decode(value);
  }
  return [];
}

List<String> _parseAvailOutlets(dynamic value) {
  if (value is String && value.isNotEmpty) {
    final List parsed = json.decode(value);
    return parsed.map((e) => e.toString()).toList();
  }
  return [];
}
