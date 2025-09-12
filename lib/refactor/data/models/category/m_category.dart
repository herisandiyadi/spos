import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'm_category.freezed.dart';
part 'm_category.g.dart';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));
String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String status,
    String? message,
    @Default([]) List<CategoryData> data,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
}

@freezed
class CategoryData with _$CategoryData {
  const factory CategoryData({
    @JsonKey(name: 'CategoryID') String? categoryID,
    @JsonKey(name: 'CategoryName') String? categoryName,
    @JsonKey(name: 'CategoryImage') String? categoryImage,
    @JsonKey(name: 'OutletID') String? outletID,
    @JsonKey(name: 'CompanyCode') String? companyCode,
    @JsonKey(name: 'is_deleted') String? isDeleted,
    @JsonKey(name: 'ShowPOS') String? showPOS,
  }) = _CategoryData;

  factory CategoryData.fromJson(Map<String, dynamic> json) => _$CategoryDataFromJson(json);
}
