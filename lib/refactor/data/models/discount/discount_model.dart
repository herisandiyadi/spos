import 'package:freezed_annotation/freezed_annotation.dart';

part 'discount_model.freezed.dart';
part 'discount_model.g.dart';

@freezed
class DiscountModel with _$DiscountModel {
  const factory DiscountModel({
    required int masterDiscountID,
    required String masterDiscountName,
    required int discountType,
    required String valueType,
    required int discountValue,
    String? spesificMenuID,
    String? discountValidFrom,
    String? discountValidUntil,
    int? minTransDiscount,
    int? outletID,
    int? maxDiscount,
    int? qtyDiscount,
    String? availableDay,
  }) = _DiscountModel;

  factory DiscountModel.fromJson(Map<String, dynamic> json) =>
      _$DiscountModelFromJson(json);
}
