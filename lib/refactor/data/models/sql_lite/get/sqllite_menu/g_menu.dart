import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_menu.freezed.dart';
part 'g_menu.g.dart';

@freezed
class MenuLiteModel with _$MenuLiteModel {
  const factory MenuLiteModel({
    @JsonKey(name: 'menuID') required int menuID,
    @JsonKey(name: 'menuCode') required String menuCode,
    @JsonKey(name: 'menuImage') required String menuImage,
    @JsonKey(name: 'categoryID') required int categoryID,
    @JsonKey(name: 'stationID') required int stationID,
    @JsonKey(name: 'menuName') required String menuName,
    @JsonKey(name: 'menuDesc') required String menuDesc,
    @JsonKey(name: 'menuPrice') required int menuPrice,
    @JsonKey(name: 'menuDiscount') required int menuDiscount,
    @JsonKey(name: 'menuType') required String menuType,
    @JsonKey(name: 'addOn') String? addOn,
    @JsonKey(name: 'noteOption') String? noteOption,
    @JsonKey(name: 'arrange') required int arrange,
  }) = _MenuLiteModel;

  factory MenuLiteModel.fromJson(Map<String, dynamic> json) =>
      _$MenuLiteModelFromJson(json);
}
