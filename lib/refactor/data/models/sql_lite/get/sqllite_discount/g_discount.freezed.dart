// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'g_discount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DiscountLiteModel _$DiscountLiteModelFromJson(Map<String, dynamic> json) {
  return _DiscountLiteModel.fromJson(json);
}

/// @nodoc
mixin _$DiscountLiteModel {
  @JsonKey(name: 'masterDiscountID')
  int get masterDiscountID => throw _privateConstructorUsedError;
  @JsonKey(name: 'masterDiscountName')
  String get masterDiscountName => throw _privateConstructorUsedError;
  @JsonKey(name: 'discountType')
  int get discountType => throw _privateConstructorUsedError;
  @JsonKey(name: 'valueType')
  String get valueType => throw _privateConstructorUsedError;
  @JsonKey(name: 'discountValue')
  int get discountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'spesificMenuID')
  @ListMapConverter()
  List<Map<String, dynamic>> get spesificMenuID =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'discountValidFrom')
  String get discountValidFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'discountValidUntil')
  String get discountValidUntil => throw _privateConstructorUsedError;
  @JsonKey(name: 'minTransDiscount')
  int get minTransDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'outletID')
  int get outletID => throw _privateConstructorUsedError;
  @JsonKey(name: 'maxDiscount')
  int get maxDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'qtyDiscount')
  int get qtyDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'availableDay')
  List<String> get availableDay => throw _privateConstructorUsedError;

  /// Serializes this DiscountLiteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiscountLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiscountLiteModelCopyWith<DiscountLiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountLiteModelCopyWith<$Res> {
  factory $DiscountLiteModelCopyWith(
          DiscountLiteModel value, $Res Function(DiscountLiteModel) then) =
      _$DiscountLiteModelCopyWithImpl<$Res, DiscountLiteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'masterDiscountID') int masterDiscountID,
      @JsonKey(name: 'masterDiscountName') String masterDiscountName,
      @JsonKey(name: 'discountType') int discountType,
      @JsonKey(name: 'valueType') String valueType,
      @JsonKey(name: 'discountValue') int discountValue,
      @JsonKey(name: 'spesificMenuID')
      @ListMapConverter()
      List<Map<String, dynamic>> spesificMenuID,
      @JsonKey(name: 'discountValidFrom') String discountValidFrom,
      @JsonKey(name: 'discountValidUntil') String discountValidUntil,
      @JsonKey(name: 'minTransDiscount') int minTransDiscount,
      @JsonKey(name: 'outletID') int outletID,
      @JsonKey(name: 'maxDiscount') int maxDiscount,
      @JsonKey(name: 'qtyDiscount') int qtyDiscount,
      @JsonKey(name: 'availableDay') List<String> availableDay});
}

/// @nodoc
class _$DiscountLiteModelCopyWithImpl<$Res, $Val extends DiscountLiteModel>
    implements $DiscountLiteModelCopyWith<$Res> {
  _$DiscountLiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiscountLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? masterDiscountID = null,
    Object? masterDiscountName = null,
    Object? discountType = null,
    Object? valueType = null,
    Object? discountValue = null,
    Object? spesificMenuID = null,
    Object? discountValidFrom = null,
    Object? discountValidUntil = null,
    Object? minTransDiscount = null,
    Object? outletID = null,
    Object? maxDiscount = null,
    Object? qtyDiscount = null,
    Object? availableDay = null,
  }) {
    return _then(_value.copyWith(
      masterDiscountID: null == masterDiscountID
          ? _value.masterDiscountID
          : masterDiscountID // ignore: cast_nullable_to_non_nullable
              as int,
      masterDiscountName: null == masterDiscountName
          ? _value.masterDiscountName
          : masterDiscountName // ignore: cast_nullable_to_non_nullable
              as String,
      discountType: null == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as int,
      valueType: null == valueType
          ? _value.valueType
          : valueType // ignore: cast_nullable_to_non_nullable
              as String,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as int,
      spesificMenuID: null == spesificMenuID
          ? _value.spesificMenuID
          : spesificMenuID // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      discountValidFrom: null == discountValidFrom
          ? _value.discountValidFrom
          : discountValidFrom // ignore: cast_nullable_to_non_nullable
              as String,
      discountValidUntil: null == discountValidUntil
          ? _value.discountValidUntil
          : discountValidUntil // ignore: cast_nullable_to_non_nullable
              as String,
      minTransDiscount: null == minTransDiscount
          ? _value.minTransDiscount
          : minTransDiscount // ignore: cast_nullable_to_non_nullable
              as int,
      outletID: null == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as int,
      maxDiscount: null == maxDiscount
          ? _value.maxDiscount
          : maxDiscount // ignore: cast_nullable_to_non_nullable
              as int,
      qtyDiscount: null == qtyDiscount
          ? _value.qtyDiscount
          : qtyDiscount // ignore: cast_nullable_to_non_nullable
              as int,
      availableDay: null == availableDay
          ? _value.availableDay
          : availableDay // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscountLiteModelImplCopyWith<$Res>
    implements $DiscountLiteModelCopyWith<$Res> {
  factory _$$DiscountLiteModelImplCopyWith(_$DiscountLiteModelImpl value,
          $Res Function(_$DiscountLiteModelImpl) then) =
      __$$DiscountLiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'masterDiscountID') int masterDiscountID,
      @JsonKey(name: 'masterDiscountName') String masterDiscountName,
      @JsonKey(name: 'discountType') int discountType,
      @JsonKey(name: 'valueType') String valueType,
      @JsonKey(name: 'discountValue') int discountValue,
      @JsonKey(name: 'spesificMenuID')
      @ListMapConverter()
      List<Map<String, dynamic>> spesificMenuID,
      @JsonKey(name: 'discountValidFrom') String discountValidFrom,
      @JsonKey(name: 'discountValidUntil') String discountValidUntil,
      @JsonKey(name: 'minTransDiscount') int minTransDiscount,
      @JsonKey(name: 'outletID') int outletID,
      @JsonKey(name: 'maxDiscount') int maxDiscount,
      @JsonKey(name: 'qtyDiscount') int qtyDiscount,
      @JsonKey(name: 'availableDay') List<String> availableDay});
}

/// @nodoc
class __$$DiscountLiteModelImplCopyWithImpl<$Res>
    extends _$DiscountLiteModelCopyWithImpl<$Res, _$DiscountLiteModelImpl>
    implements _$$DiscountLiteModelImplCopyWith<$Res> {
  __$$DiscountLiteModelImplCopyWithImpl(_$DiscountLiteModelImpl _value,
      $Res Function(_$DiscountLiteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiscountLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? masterDiscountID = null,
    Object? masterDiscountName = null,
    Object? discountType = null,
    Object? valueType = null,
    Object? discountValue = null,
    Object? spesificMenuID = null,
    Object? discountValidFrom = null,
    Object? discountValidUntil = null,
    Object? minTransDiscount = null,
    Object? outletID = null,
    Object? maxDiscount = null,
    Object? qtyDiscount = null,
    Object? availableDay = null,
  }) {
    return _then(_$DiscountLiteModelImpl(
      masterDiscountID: null == masterDiscountID
          ? _value.masterDiscountID
          : masterDiscountID // ignore: cast_nullable_to_non_nullable
              as int,
      masterDiscountName: null == masterDiscountName
          ? _value.masterDiscountName
          : masterDiscountName // ignore: cast_nullable_to_non_nullable
              as String,
      discountType: null == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as int,
      valueType: null == valueType
          ? _value.valueType
          : valueType // ignore: cast_nullable_to_non_nullable
              as String,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as int,
      spesificMenuID: null == spesificMenuID
          ? _value._spesificMenuID
          : spesificMenuID // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      discountValidFrom: null == discountValidFrom
          ? _value.discountValidFrom
          : discountValidFrom // ignore: cast_nullable_to_non_nullable
              as String,
      discountValidUntil: null == discountValidUntil
          ? _value.discountValidUntil
          : discountValidUntil // ignore: cast_nullable_to_non_nullable
              as String,
      minTransDiscount: null == minTransDiscount
          ? _value.minTransDiscount
          : minTransDiscount // ignore: cast_nullable_to_non_nullable
              as int,
      outletID: null == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as int,
      maxDiscount: null == maxDiscount
          ? _value.maxDiscount
          : maxDiscount // ignore: cast_nullable_to_non_nullable
              as int,
      qtyDiscount: null == qtyDiscount
          ? _value.qtyDiscount
          : qtyDiscount // ignore: cast_nullable_to_non_nullable
              as int,
      availableDay: null == availableDay
          ? _value._availableDay
          : availableDay // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscountLiteModelImpl implements _DiscountLiteModel {
  const _$DiscountLiteModelImpl(
      {@JsonKey(name: 'masterDiscountID') required this.masterDiscountID,
      @JsonKey(name: 'masterDiscountName') required this.masterDiscountName,
      @JsonKey(name: 'discountType') required this.discountType,
      @JsonKey(name: 'valueType') required this.valueType,
      @JsonKey(name: 'discountValue') required this.discountValue,
      @JsonKey(name: 'spesificMenuID')
      @ListMapConverter()
      required final List<Map<String, dynamic>> spesificMenuID,
      @JsonKey(name: 'discountValidFrom') required this.discountValidFrom,
      @JsonKey(name: 'discountValidUntil') required this.discountValidUntil,
      @JsonKey(name: 'minTransDiscount') required this.minTransDiscount,
      @JsonKey(name: 'outletID') required this.outletID,
      @JsonKey(name: 'maxDiscount') required this.maxDiscount,
      @JsonKey(name: 'qtyDiscount') required this.qtyDiscount,
      @JsonKey(name: 'availableDay') required final List<String> availableDay})
      : _spesificMenuID = spesificMenuID,
        _availableDay = availableDay;

  factory _$DiscountLiteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscountLiteModelImplFromJson(json);

  @override
  @JsonKey(name: 'masterDiscountID')
  final int masterDiscountID;
  @override
  @JsonKey(name: 'masterDiscountName')
  final String masterDiscountName;
  @override
  @JsonKey(name: 'discountType')
  final int discountType;
  @override
  @JsonKey(name: 'valueType')
  final String valueType;
  @override
  @JsonKey(name: 'discountValue')
  final int discountValue;
  final List<Map<String, dynamic>> _spesificMenuID;
  @override
  @JsonKey(name: 'spesificMenuID')
  @ListMapConverter()
  List<Map<String, dynamic>> get spesificMenuID {
    if (_spesificMenuID is EqualUnmodifiableListView) return _spesificMenuID;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spesificMenuID);
  }

  @override
  @JsonKey(name: 'discountValidFrom')
  final String discountValidFrom;
  @override
  @JsonKey(name: 'discountValidUntil')
  final String discountValidUntil;
  @override
  @JsonKey(name: 'minTransDiscount')
  final int minTransDiscount;
  @override
  @JsonKey(name: 'outletID')
  final int outletID;
  @override
  @JsonKey(name: 'maxDiscount')
  final int maxDiscount;
  @override
  @JsonKey(name: 'qtyDiscount')
  final int qtyDiscount;
  final List<String> _availableDay;
  @override
  @JsonKey(name: 'availableDay')
  List<String> get availableDay {
    if (_availableDay is EqualUnmodifiableListView) return _availableDay;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableDay);
  }

  @override
  String toString() {
    return 'DiscountLiteModel(masterDiscountID: $masterDiscountID, masterDiscountName: $masterDiscountName, discountType: $discountType, valueType: $valueType, discountValue: $discountValue, spesificMenuID: $spesificMenuID, discountValidFrom: $discountValidFrom, discountValidUntil: $discountValidUntil, minTransDiscount: $minTransDiscount, outletID: $outletID, maxDiscount: $maxDiscount, qtyDiscount: $qtyDiscount, availableDay: $availableDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscountLiteModelImpl &&
            (identical(other.masterDiscountID, masterDiscountID) ||
                other.masterDiscountID == masterDiscountID) &&
            (identical(other.masterDiscountName, masterDiscountName) ||
                other.masterDiscountName == masterDiscountName) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.valueType, valueType) ||
                other.valueType == valueType) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            const DeepCollectionEquality()
                .equals(other._spesificMenuID, _spesificMenuID) &&
            (identical(other.discountValidFrom, discountValidFrom) ||
                other.discountValidFrom == discountValidFrom) &&
            (identical(other.discountValidUntil, discountValidUntil) ||
                other.discountValidUntil == discountValidUntil) &&
            (identical(other.minTransDiscount, minTransDiscount) ||
                other.minTransDiscount == minTransDiscount) &&
            (identical(other.outletID, outletID) ||
                other.outletID == outletID) &&
            (identical(other.maxDiscount, maxDiscount) ||
                other.maxDiscount == maxDiscount) &&
            (identical(other.qtyDiscount, qtyDiscount) ||
                other.qtyDiscount == qtyDiscount) &&
            const DeepCollectionEquality()
                .equals(other._availableDay, _availableDay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      masterDiscountID,
      masterDiscountName,
      discountType,
      valueType,
      discountValue,
      const DeepCollectionEquality().hash(_spesificMenuID),
      discountValidFrom,
      discountValidUntil,
      minTransDiscount,
      outletID,
      maxDiscount,
      qtyDiscount,
      const DeepCollectionEquality().hash(_availableDay));

  /// Create a copy of DiscountLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscountLiteModelImplCopyWith<_$DiscountLiteModelImpl> get copyWith =>
      __$$DiscountLiteModelImplCopyWithImpl<_$DiscountLiteModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscountLiteModelImplToJson(
      this,
    );
  }
}

abstract class _DiscountLiteModel implements DiscountLiteModel {
  const factory _DiscountLiteModel(
      {@JsonKey(name: 'masterDiscountID') required final int masterDiscountID,
      @JsonKey(name: 'masterDiscountName')
      required final String masterDiscountName,
      @JsonKey(name: 'discountType') required final int discountType,
      @JsonKey(name: 'valueType') required final String valueType,
      @JsonKey(name: 'discountValue') required final int discountValue,
      @JsonKey(name: 'spesificMenuID')
      @ListMapConverter()
      required final List<Map<String, dynamic>> spesificMenuID,
      @JsonKey(name: 'discountValidFrom')
      required final String discountValidFrom,
      @JsonKey(name: 'discountValidUntil')
      required final String discountValidUntil,
      @JsonKey(name: 'minTransDiscount') required final int minTransDiscount,
      @JsonKey(name: 'outletID') required final int outletID,
      @JsonKey(name: 'maxDiscount') required final int maxDiscount,
      @JsonKey(name: 'qtyDiscount') required final int qtyDiscount,
      @JsonKey(name: 'availableDay')
      required final List<String> availableDay}) = _$DiscountLiteModelImpl;

  factory _DiscountLiteModel.fromJson(Map<String, dynamic> json) =
      _$DiscountLiteModelImpl.fromJson;

  @override
  @JsonKey(name: 'masterDiscountID')
  int get masterDiscountID;
  @override
  @JsonKey(name: 'masterDiscountName')
  String get masterDiscountName;
  @override
  @JsonKey(name: 'discountType')
  int get discountType;
  @override
  @JsonKey(name: 'valueType')
  String get valueType;
  @override
  @JsonKey(name: 'discountValue')
  int get discountValue;
  @override
  @JsonKey(name: 'spesificMenuID')
  @ListMapConverter()
  List<Map<String, dynamic>> get spesificMenuID;
  @override
  @JsonKey(name: 'discountValidFrom')
  String get discountValidFrom;
  @override
  @JsonKey(name: 'discountValidUntil')
  String get discountValidUntil;
  @override
  @JsonKey(name: 'minTransDiscount')
  int get minTransDiscount;
  @override
  @JsonKey(name: 'outletID')
  int get outletID;
  @override
  @JsonKey(name: 'maxDiscount')
  int get maxDiscount;
  @override
  @JsonKey(name: 'qtyDiscount')
  int get qtyDiscount;
  @override
  @JsonKey(name: 'availableDay')
  List<String> get availableDay;

  /// Create a copy of DiscountLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiscountLiteModelImplCopyWith<_$DiscountLiteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DiscountMenuLite _$DiscountMenuLiteFromJson(Map<String, dynamic> json) {
  return _DiscountMenuLite.fromJson(json);
}

/// @nodoc
mixin _$DiscountMenuLite {
  @JsonKey(name: 'menuID')
  String? get menuID => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuCode')
  String? get menuCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuImage')
  String? get menuImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoryID')
  String? get categoryID => throw _privateConstructorUsedError;
  @JsonKey(name: 'subCategoryID')
  String? get subCategoryID => throw _privateConstructorUsedError;
  @JsonKey(name: 'stationID')
  String? get stationID => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuName')
  String? get menuName => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuDesc')
  String? get menuDesc => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuPrice')
  String? get menuPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuDiscount')
  String? get menuDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuType')
  String? get menuType => throw _privateConstructorUsedError;
  @JsonKey(name: 'addOn', fromJson: _parseAddOns)
  List<MenuAddOnGroupLite>? get addOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'noteOption', fromJson: _parseNoteOptions)
  List<String>? get noteOption => throw _privateConstructorUsedError;
  @JsonKey(name: 'varian', fromJson: _parseVariants)
  List<dynamic>? get variant => throw _privateConstructorUsedError;
  @JsonKey(name: 'availOutlet', fromJson: _parseAvailOutlets)
  List<String>? get availOutlet => throw _privateConstructorUsedError;
  @JsonKey(name: 'showStatusPos')
  String? get showStatusPos => throw _privateConstructorUsedError;
  @JsonKey(name: 'showStatusApps')
  String? get showStatusApps => throw _privateConstructorUsedError;
  @JsonKey(name: 'companyCode')
  String? get companyCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'availableDay', fromJson: _parseAvailableDay)
  List<String>? get availableDay => throw _privateConstructorUsedError;

  /// Serializes this DiscountMenuLite to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiscountMenuLite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiscountMenuLiteCopyWith<DiscountMenuLite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountMenuLiteCopyWith<$Res> {
  factory $DiscountMenuLiteCopyWith(
          DiscountMenuLite value, $Res Function(DiscountMenuLite) then) =
      _$DiscountMenuLiteCopyWithImpl<$Res, DiscountMenuLite>;
  @useResult
  $Res call(
      {@JsonKey(name: 'menuID') String? menuID,
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
      List<String>? availableDay});
}

/// @nodoc
class _$DiscountMenuLiteCopyWithImpl<$Res, $Val extends DiscountMenuLite>
    implements $DiscountMenuLiteCopyWith<$Res> {
  _$DiscountMenuLiteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiscountMenuLite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuID = freezed,
    Object? menuCode = freezed,
    Object? menuImage = freezed,
    Object? categoryID = freezed,
    Object? subCategoryID = freezed,
    Object? stationID = freezed,
    Object? menuName = freezed,
    Object? menuDesc = freezed,
    Object? menuPrice = freezed,
    Object? menuDiscount = freezed,
    Object? menuType = freezed,
    Object? addOn = freezed,
    Object? noteOption = freezed,
    Object? variant = freezed,
    Object? availOutlet = freezed,
    Object? showStatusPos = freezed,
    Object? showStatusApps = freezed,
    Object? companyCode = freezed,
    Object? availableDay = freezed,
  }) {
    return _then(_value.copyWith(
      menuID: freezed == menuID
          ? _value.menuID
          : menuID // ignore: cast_nullable_to_non_nullable
              as String?,
      menuCode: freezed == menuCode
          ? _value.menuCode
          : menuCode // ignore: cast_nullable_to_non_nullable
              as String?,
      menuImage: freezed == menuImage
          ? _value.menuImage
          : menuImage // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryID: freezed == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategoryID: freezed == subCategoryID
          ? _value.subCategoryID
          : subCategoryID // ignore: cast_nullable_to_non_nullable
              as String?,
      stationID: freezed == stationID
          ? _value.stationID
          : stationID // ignore: cast_nullable_to_non_nullable
              as String?,
      menuName: freezed == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String?,
      menuDesc: freezed == menuDesc
          ? _value.menuDesc
          : menuDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      menuPrice: freezed == menuPrice
          ? _value.menuPrice
          : menuPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      menuDiscount: freezed == menuDiscount
          ? _value.menuDiscount
          : menuDiscount // ignore: cast_nullable_to_non_nullable
              as String?,
      menuType: freezed == menuType
          ? _value.menuType
          : menuType // ignore: cast_nullable_to_non_nullable
              as String?,
      addOn: freezed == addOn
          ? _value.addOn
          : addOn // ignore: cast_nullable_to_non_nullable
              as List<MenuAddOnGroupLite>?,
      noteOption: freezed == noteOption
          ? _value.noteOption
          : noteOption // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      variant: freezed == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      availOutlet: freezed == availOutlet
          ? _value.availOutlet
          : availOutlet // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      showStatusPos: freezed == showStatusPos
          ? _value.showStatusPos
          : showStatusPos // ignore: cast_nullable_to_non_nullable
              as String?,
      showStatusApps: freezed == showStatusApps
          ? _value.showStatusApps
          : showStatusApps // ignore: cast_nullable_to_non_nullable
              as String?,
      companyCode: freezed == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      availableDay: freezed == availableDay
          ? _value.availableDay
          : availableDay // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscountMenuLiteImplCopyWith<$Res>
    implements $DiscountMenuLiteCopyWith<$Res> {
  factory _$$DiscountMenuLiteImplCopyWith(_$DiscountMenuLiteImpl value,
          $Res Function(_$DiscountMenuLiteImpl) then) =
      __$$DiscountMenuLiteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'menuID') String? menuID,
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
      List<String>? availableDay});
}

/// @nodoc
class __$$DiscountMenuLiteImplCopyWithImpl<$Res>
    extends _$DiscountMenuLiteCopyWithImpl<$Res, _$DiscountMenuLiteImpl>
    implements _$$DiscountMenuLiteImplCopyWith<$Res> {
  __$$DiscountMenuLiteImplCopyWithImpl(_$DiscountMenuLiteImpl _value,
      $Res Function(_$DiscountMenuLiteImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiscountMenuLite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuID = freezed,
    Object? menuCode = freezed,
    Object? menuImage = freezed,
    Object? categoryID = freezed,
    Object? subCategoryID = freezed,
    Object? stationID = freezed,
    Object? menuName = freezed,
    Object? menuDesc = freezed,
    Object? menuPrice = freezed,
    Object? menuDiscount = freezed,
    Object? menuType = freezed,
    Object? addOn = freezed,
    Object? noteOption = freezed,
    Object? variant = freezed,
    Object? availOutlet = freezed,
    Object? showStatusPos = freezed,
    Object? showStatusApps = freezed,
    Object? companyCode = freezed,
    Object? availableDay = freezed,
  }) {
    return _then(_$DiscountMenuLiteImpl(
      menuID: freezed == menuID
          ? _value.menuID
          : menuID // ignore: cast_nullable_to_non_nullable
              as String?,
      menuCode: freezed == menuCode
          ? _value.menuCode
          : menuCode // ignore: cast_nullable_to_non_nullable
              as String?,
      menuImage: freezed == menuImage
          ? _value.menuImage
          : menuImage // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryID: freezed == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategoryID: freezed == subCategoryID
          ? _value.subCategoryID
          : subCategoryID // ignore: cast_nullable_to_non_nullable
              as String?,
      stationID: freezed == stationID
          ? _value.stationID
          : stationID // ignore: cast_nullable_to_non_nullable
              as String?,
      menuName: freezed == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String?,
      menuDesc: freezed == menuDesc
          ? _value.menuDesc
          : menuDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      menuPrice: freezed == menuPrice
          ? _value.menuPrice
          : menuPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      menuDiscount: freezed == menuDiscount
          ? _value.menuDiscount
          : menuDiscount // ignore: cast_nullable_to_non_nullable
              as String?,
      menuType: freezed == menuType
          ? _value.menuType
          : menuType // ignore: cast_nullable_to_non_nullable
              as String?,
      addOn: freezed == addOn
          ? _value._addOn
          : addOn // ignore: cast_nullable_to_non_nullable
              as List<MenuAddOnGroupLite>?,
      noteOption: freezed == noteOption
          ? _value._noteOption
          : noteOption // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      variant: freezed == variant
          ? _value._variant
          : variant // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      availOutlet: freezed == availOutlet
          ? _value._availOutlet
          : availOutlet // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      showStatusPos: freezed == showStatusPos
          ? _value.showStatusPos
          : showStatusPos // ignore: cast_nullable_to_non_nullable
              as String?,
      showStatusApps: freezed == showStatusApps
          ? _value.showStatusApps
          : showStatusApps // ignore: cast_nullable_to_non_nullable
              as String?,
      companyCode: freezed == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      availableDay: freezed == availableDay
          ? _value._availableDay
          : availableDay // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscountMenuLiteImpl implements _DiscountMenuLite {
  const _$DiscountMenuLiteImpl(
      {@JsonKey(name: 'menuID') this.menuID,
      @JsonKey(name: 'menuCode') this.menuCode,
      @JsonKey(name: 'menuImage') this.menuImage,
      @JsonKey(name: 'categoryID') this.categoryID,
      @JsonKey(name: 'subCategoryID') this.subCategoryID,
      @JsonKey(name: 'stationID') this.stationID,
      @JsonKey(name: 'menuName') this.menuName,
      @JsonKey(name: 'menuDesc') this.menuDesc,
      @JsonKey(name: 'menuPrice') this.menuPrice,
      @JsonKey(name: 'menuDiscount') this.menuDiscount,
      @JsonKey(name: 'menuType') this.menuType,
      @JsonKey(name: 'addOn', fromJson: _parseAddOns)
      final List<MenuAddOnGroupLite>? addOn,
      @JsonKey(name: 'noteOption', fromJson: _parseNoteOptions)
      final List<String>? noteOption,
      @JsonKey(name: 'varian', fromJson: _parseVariants)
      final List<dynamic>? variant,
      @JsonKey(name: 'availOutlet', fromJson: _parseAvailOutlets)
      final List<String>? availOutlet,
      @JsonKey(name: 'showStatusPos') this.showStatusPos,
      @JsonKey(name: 'showStatusApps') this.showStatusApps,
      @JsonKey(name: 'companyCode') this.companyCode,
      @JsonKey(name: 'availableDay', fromJson: _parseAvailableDay)
      final List<String>? availableDay})
      : _addOn = addOn,
        _noteOption = noteOption,
        _variant = variant,
        _availOutlet = availOutlet,
        _availableDay = availableDay;

  factory _$DiscountMenuLiteImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscountMenuLiteImplFromJson(json);

  @override
  @JsonKey(name: 'menuID')
  final String? menuID;
  @override
  @JsonKey(name: 'menuCode')
  final String? menuCode;
  @override
  @JsonKey(name: 'menuImage')
  final String? menuImage;
  @override
  @JsonKey(name: 'categoryID')
  final String? categoryID;
  @override
  @JsonKey(name: 'subCategoryID')
  final String? subCategoryID;
  @override
  @JsonKey(name: 'stationID')
  final String? stationID;
  @override
  @JsonKey(name: 'menuName')
  final String? menuName;
  @override
  @JsonKey(name: 'menuDesc')
  final String? menuDesc;
  @override
  @JsonKey(name: 'menuPrice')
  final String? menuPrice;
  @override
  @JsonKey(name: 'menuDiscount')
  final String? menuDiscount;
  @override
  @JsonKey(name: 'menuType')
  final String? menuType;
  final List<MenuAddOnGroupLite>? _addOn;
  @override
  @JsonKey(name: 'addOn', fromJson: _parseAddOns)
  List<MenuAddOnGroupLite>? get addOn {
    final value = _addOn;
    if (value == null) return null;
    if (_addOn is EqualUnmodifiableListView) return _addOn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _noteOption;
  @override
  @JsonKey(name: 'noteOption', fromJson: _parseNoteOptions)
  List<String>? get noteOption {
    final value = _noteOption;
    if (value == null) return null;
    if (_noteOption is EqualUnmodifiableListView) return _noteOption;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _variant;
  @override
  @JsonKey(name: 'varian', fromJson: _parseVariants)
  List<dynamic>? get variant {
    final value = _variant;
    if (value == null) return null;
    if (_variant is EqualUnmodifiableListView) return _variant;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _availOutlet;
  @override
  @JsonKey(name: 'availOutlet', fromJson: _parseAvailOutlets)
  List<String>? get availOutlet {
    final value = _availOutlet;
    if (value == null) return null;
    if (_availOutlet is EqualUnmodifiableListView) return _availOutlet;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'showStatusPos')
  final String? showStatusPos;
  @override
  @JsonKey(name: 'showStatusApps')
  final String? showStatusApps;
  @override
  @JsonKey(name: 'companyCode')
  final String? companyCode;
  final List<String>? _availableDay;
  @override
  @JsonKey(name: 'availableDay', fromJson: _parseAvailableDay)
  List<String>? get availableDay {
    final value = _availableDay;
    if (value == null) return null;
    if (_availableDay is EqualUnmodifiableListView) return _availableDay;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DiscountMenuLite(menuID: $menuID, menuCode: $menuCode, menuImage: $menuImage, categoryID: $categoryID, subCategoryID: $subCategoryID, stationID: $stationID, menuName: $menuName, menuDesc: $menuDesc, menuPrice: $menuPrice, menuDiscount: $menuDiscount, menuType: $menuType, addOn: $addOn, noteOption: $noteOption, variant: $variant, availOutlet: $availOutlet, showStatusPos: $showStatusPos, showStatusApps: $showStatusApps, companyCode: $companyCode, availableDay: $availableDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscountMenuLiteImpl &&
            (identical(other.menuID, menuID) || other.menuID == menuID) &&
            (identical(other.menuCode, menuCode) ||
                other.menuCode == menuCode) &&
            (identical(other.menuImage, menuImage) ||
                other.menuImage == menuImage) &&
            (identical(other.categoryID, categoryID) ||
                other.categoryID == categoryID) &&
            (identical(other.subCategoryID, subCategoryID) ||
                other.subCategoryID == subCategoryID) &&
            (identical(other.stationID, stationID) ||
                other.stationID == stationID) &&
            (identical(other.menuName, menuName) ||
                other.menuName == menuName) &&
            (identical(other.menuDesc, menuDesc) ||
                other.menuDesc == menuDesc) &&
            (identical(other.menuPrice, menuPrice) ||
                other.menuPrice == menuPrice) &&
            (identical(other.menuDiscount, menuDiscount) ||
                other.menuDiscount == menuDiscount) &&
            (identical(other.menuType, menuType) ||
                other.menuType == menuType) &&
            const DeepCollectionEquality().equals(other._addOn, _addOn) &&
            const DeepCollectionEquality()
                .equals(other._noteOption, _noteOption) &&
            const DeepCollectionEquality().equals(other._variant, _variant) &&
            const DeepCollectionEquality()
                .equals(other._availOutlet, _availOutlet) &&
            (identical(other.showStatusPos, showStatusPos) ||
                other.showStatusPos == showStatusPos) &&
            (identical(other.showStatusApps, showStatusApps) ||
                other.showStatusApps == showStatusApps) &&
            (identical(other.companyCode, companyCode) ||
                other.companyCode == companyCode) &&
            const DeepCollectionEquality()
                .equals(other._availableDay, _availableDay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        menuID,
        menuCode,
        menuImage,
        categoryID,
        subCategoryID,
        stationID,
        menuName,
        menuDesc,
        menuPrice,
        menuDiscount,
        menuType,
        const DeepCollectionEquality().hash(_addOn),
        const DeepCollectionEquality().hash(_noteOption),
        const DeepCollectionEquality().hash(_variant),
        const DeepCollectionEquality().hash(_availOutlet),
        showStatusPos,
        showStatusApps,
        companyCode,
        const DeepCollectionEquality().hash(_availableDay)
      ]);

  /// Create a copy of DiscountMenuLite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscountMenuLiteImplCopyWith<_$DiscountMenuLiteImpl> get copyWith =>
      __$$DiscountMenuLiteImplCopyWithImpl<_$DiscountMenuLiteImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscountMenuLiteImplToJson(
      this,
    );
  }
}

abstract class _DiscountMenuLite implements DiscountMenuLite {
  const factory _DiscountMenuLite(
      {@JsonKey(name: 'menuID') final String? menuID,
      @JsonKey(name: 'menuCode') final String? menuCode,
      @JsonKey(name: 'menuImage') final String? menuImage,
      @JsonKey(name: 'categoryID') final String? categoryID,
      @JsonKey(name: 'subCategoryID') final String? subCategoryID,
      @JsonKey(name: 'stationID') final String? stationID,
      @JsonKey(name: 'menuName') final String? menuName,
      @JsonKey(name: 'menuDesc') final String? menuDesc,
      @JsonKey(name: 'menuPrice') final String? menuPrice,
      @JsonKey(name: 'menuDiscount') final String? menuDiscount,
      @JsonKey(name: 'menuType') final String? menuType,
      @JsonKey(name: 'addOn', fromJson: _parseAddOns)
      final List<MenuAddOnGroupLite>? addOn,
      @JsonKey(name: 'noteOption', fromJson: _parseNoteOptions)
      final List<String>? noteOption,
      @JsonKey(name: 'varian', fromJson: _parseVariants)
      final List<dynamic>? variant,
      @JsonKey(name: 'availOutlet', fromJson: _parseAvailOutlets)
      final List<String>? availOutlet,
      @JsonKey(name: 'showStatusPos') final String? showStatusPos,
      @JsonKey(name: 'showStatusApps') final String? showStatusApps,
      @JsonKey(name: 'companyCode') final String? companyCode,
      @JsonKey(name: 'availableDay', fromJson: _parseAvailableDay)
      final List<String>? availableDay}) = _$DiscountMenuLiteImpl;

  factory _DiscountMenuLite.fromJson(Map<String, dynamic> json) =
      _$DiscountMenuLiteImpl.fromJson;

  @override
  @JsonKey(name: 'menuID')
  String? get menuID;
  @override
  @JsonKey(name: 'menuCode')
  String? get menuCode;
  @override
  @JsonKey(name: 'menuImage')
  String? get menuImage;
  @override
  @JsonKey(name: 'categoryID')
  String? get categoryID;
  @override
  @JsonKey(name: 'subCategoryID')
  String? get subCategoryID;
  @override
  @JsonKey(name: 'stationID')
  String? get stationID;
  @override
  @JsonKey(name: 'menuName')
  String? get menuName;
  @override
  @JsonKey(name: 'menuDesc')
  String? get menuDesc;
  @override
  @JsonKey(name: 'menuPrice')
  String? get menuPrice;
  @override
  @JsonKey(name: 'menuDiscount')
  String? get menuDiscount;
  @override
  @JsonKey(name: 'menuType')
  String? get menuType;
  @override
  @JsonKey(name: 'addOn', fromJson: _parseAddOns)
  List<MenuAddOnGroupLite>? get addOn;
  @override
  @JsonKey(name: 'noteOption', fromJson: _parseNoteOptions)
  List<String>? get noteOption;
  @override
  @JsonKey(name: 'varian', fromJson: _parseVariants)
  List<dynamic>? get variant;
  @override
  @JsonKey(name: 'availOutlet', fromJson: _parseAvailOutlets)
  List<String>? get availOutlet;
  @override
  @JsonKey(name: 'showStatusPos')
  String? get showStatusPos;
  @override
  @JsonKey(name: 'showStatusApps')
  String? get showStatusApps;
  @override
  @JsonKey(name: 'companyCode')
  String? get companyCode;
  @override
  @JsonKey(name: 'availableDay', fromJson: _parseAvailableDay)
  List<String>? get availableDay;

  /// Create a copy of DiscountMenuLite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiscountMenuLiteImplCopyWith<_$DiscountMenuLiteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuAddOnGroupLite _$MenuAddOnGroupLiteFromJson(Map<String, dynamic> json) {
  return _MenuAddOnGroupLite.fromJson(json);
}

/// @nodoc
mixin _$MenuAddOnGroupLite {
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'addOnIDs')
  List<int>? get addOnIDs => throw _privateConstructorUsedError;
  int? get multiply => throw _privateConstructorUsedError;
  int? get required => throw _privateConstructorUsedError;
  int? get min => throw _privateConstructorUsedError;
  int? get max => throw _privateConstructorUsedError;

  /// Serializes this MenuAddOnGroupLite to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuAddOnGroupLite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuAddOnGroupLiteCopyWith<MenuAddOnGroupLite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuAddOnGroupLiteCopyWith<$Res> {
  factory $MenuAddOnGroupLiteCopyWith(
          MenuAddOnGroupLite value, $Res Function(MenuAddOnGroupLite) then) =
      _$MenuAddOnGroupLiteCopyWithImpl<$Res, MenuAddOnGroupLite>;
  @useResult
  $Res call(
      {String? title,
      @JsonKey(name: 'addOnIDs') List<int>? addOnIDs,
      int? multiply,
      int? required,
      int? min,
      int? max});
}

/// @nodoc
class _$MenuAddOnGroupLiteCopyWithImpl<$Res, $Val extends MenuAddOnGroupLite>
    implements $MenuAddOnGroupLiteCopyWith<$Res> {
  _$MenuAddOnGroupLiteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuAddOnGroupLite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? addOnIDs = freezed,
    Object? multiply = freezed,
    Object? required = freezed,
    Object? min = freezed,
    Object? max = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      addOnIDs: freezed == addOnIDs
          ? _value.addOnIDs
          : addOnIDs // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      multiply: freezed == multiply
          ? _value.multiply
          : multiply // ignore: cast_nullable_to_non_nullable
              as int?,
      required: freezed == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as int?,
      min: freezed == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int?,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuAddOnGroupLiteImplCopyWith<$Res>
    implements $MenuAddOnGroupLiteCopyWith<$Res> {
  factory _$$MenuAddOnGroupLiteImplCopyWith(_$MenuAddOnGroupLiteImpl value,
          $Res Function(_$MenuAddOnGroupLiteImpl) then) =
      __$$MenuAddOnGroupLiteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      @JsonKey(name: 'addOnIDs') List<int>? addOnIDs,
      int? multiply,
      int? required,
      int? min,
      int? max});
}

/// @nodoc
class __$$MenuAddOnGroupLiteImplCopyWithImpl<$Res>
    extends _$MenuAddOnGroupLiteCopyWithImpl<$Res, _$MenuAddOnGroupLiteImpl>
    implements _$$MenuAddOnGroupLiteImplCopyWith<$Res> {
  __$$MenuAddOnGroupLiteImplCopyWithImpl(_$MenuAddOnGroupLiteImpl _value,
      $Res Function(_$MenuAddOnGroupLiteImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuAddOnGroupLite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? addOnIDs = freezed,
    Object? multiply = freezed,
    Object? required = freezed,
    Object? min = freezed,
    Object? max = freezed,
  }) {
    return _then(_$MenuAddOnGroupLiteImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      addOnIDs: freezed == addOnIDs
          ? _value._addOnIDs
          : addOnIDs // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      multiply: freezed == multiply
          ? _value.multiply
          : multiply // ignore: cast_nullable_to_non_nullable
              as int?,
      required: freezed == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as int?,
      min: freezed == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int?,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuAddOnGroupLiteImpl implements _MenuAddOnGroupLite {
  const _$MenuAddOnGroupLiteImpl(
      {this.title,
      @JsonKey(name: 'addOnIDs') final List<int>? addOnIDs,
      this.multiply,
      this.required,
      this.min,
      this.max})
      : _addOnIDs = addOnIDs;

  factory _$MenuAddOnGroupLiteImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuAddOnGroupLiteImplFromJson(json);

  @override
  final String? title;
  final List<int>? _addOnIDs;
  @override
  @JsonKey(name: 'addOnIDs')
  List<int>? get addOnIDs {
    final value = _addOnIDs;
    if (value == null) return null;
    if (_addOnIDs is EqualUnmodifiableListView) return _addOnIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? multiply;
  @override
  final int? required;
  @override
  final int? min;
  @override
  final int? max;

  @override
  String toString() {
    return 'MenuAddOnGroupLite(title: $title, addOnIDs: $addOnIDs, multiply: $multiply, required: $required, min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuAddOnGroupLiteImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._addOnIDs, _addOnIDs) &&
            (identical(other.multiply, multiply) ||
                other.multiply == multiply) &&
            (identical(other.required, required) ||
                other.required == required) &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      const DeepCollectionEquality().hash(_addOnIDs),
      multiply,
      required,
      min,
      max);

  /// Create a copy of MenuAddOnGroupLite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuAddOnGroupLiteImplCopyWith<_$MenuAddOnGroupLiteImpl> get copyWith =>
      __$$MenuAddOnGroupLiteImplCopyWithImpl<_$MenuAddOnGroupLiteImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuAddOnGroupLiteImplToJson(
      this,
    );
  }
}

abstract class _MenuAddOnGroupLite implements MenuAddOnGroupLite {
  const factory _MenuAddOnGroupLite(
      {final String? title,
      @JsonKey(name: 'addOnIDs') final List<int>? addOnIDs,
      final int? multiply,
      final int? required,
      final int? min,
      final int? max}) = _$MenuAddOnGroupLiteImpl;

  factory _MenuAddOnGroupLite.fromJson(Map<String, dynamic> json) =
      _$MenuAddOnGroupLiteImpl.fromJson;

  @override
  String? get title;
  @override
  @JsonKey(name: 'addOnIDs')
  List<int>? get addOnIDs;
  @override
  int? get multiply;
  @override
  int? get required;
  @override
  int? get min;
  @override
  int? get max;

  /// Create a copy of MenuAddOnGroupLite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuAddOnGroupLiteImplCopyWith<_$MenuAddOnGroupLiteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
