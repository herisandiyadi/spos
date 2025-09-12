import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_category.freezed.dart';
part 'g_category.g.dart';

@freezed
class CategoryLiteModel with _$CategoryLiteModel {
  const factory CategoryLiteModel({
    @JsonKey(name: 'categoryID') required int categoryID,
    @JsonKey(name: 'categoryName') required String categoryName,
    @JsonKey(name: 'categoryImage') required String categoryImage,
  }) = _CategoryLiteModel;

  factory CategoryLiteModel.fromJson(Map<String, dynamic> json) => _$CategoryLiteModelFromJson(json);
}
