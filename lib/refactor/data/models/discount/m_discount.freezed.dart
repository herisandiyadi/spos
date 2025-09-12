// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_discount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DiscountModel _$DiscountModelFromJson(Map<String, dynamic> json) {
  return _DiscountModel.fromJson(json);
}

/// @nodoc
mixin _$DiscountModel {
  String get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<DiscountData> get data => throw _privateConstructorUsedError;

  /// Serializes this DiscountModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiscountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiscountModelCopyWith<DiscountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountModelCopyWith<$Res> {
  factory $DiscountModelCopyWith(
          DiscountModel value, $Res Function(DiscountModel) then) =
      _$DiscountModelCopyWithImpl<$Res, DiscountModel>;
  @useResult
  $Res call({String status, String? message, List<DiscountData> data});
}

/// @nodoc
class _$DiscountModelCopyWithImpl<$Res, $Val extends DiscountModel>
    implements $DiscountModelCopyWith<$Res> {
  _$DiscountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiscountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DiscountData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscountModelImplCopyWith<$Res>
    implements $DiscountModelCopyWith<$Res> {
  factory _$$DiscountModelImplCopyWith(
          _$DiscountModelImpl value, $Res Function(_$DiscountModelImpl) then) =
      __$$DiscountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String? message, List<DiscountData> data});
}

/// @nodoc
class __$$DiscountModelImplCopyWithImpl<$Res>
    extends _$DiscountModelCopyWithImpl<$Res, _$DiscountModelImpl>
    implements _$$DiscountModelImplCopyWith<$Res> {
  __$$DiscountModelImplCopyWithImpl(
      _$DiscountModelImpl _value, $Res Function(_$DiscountModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiscountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_$DiscountModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DiscountData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscountModelImpl implements _DiscountModel {
  const _$DiscountModelImpl(
      {required this.status,
      this.message,
      final List<DiscountData> data = const []})
      : _data = data;

  factory _$DiscountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscountModelImplFromJson(json);

  @override
  final String status;
  @override
  final String? message;
  final List<DiscountData> _data;
  @override
  @JsonKey()
  List<DiscountData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'DiscountModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscountModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  /// Create a copy of DiscountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscountModelImplCopyWith<_$DiscountModelImpl> get copyWith =>
      __$$DiscountModelImplCopyWithImpl<_$DiscountModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscountModelImplToJson(
      this,
    );
  }
}

abstract class _DiscountModel implements DiscountModel {
  const factory _DiscountModel(
      {required final String status,
      final String? message,
      final List<DiscountData> data}) = _$DiscountModelImpl;

  factory _DiscountModel.fromJson(Map<String, dynamic> json) =
      _$DiscountModelImpl.fromJson;

  @override
  String get status;
  @override
  String? get message;
  @override
  List<DiscountData> get data;

  /// Create a copy of DiscountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiscountModelImplCopyWith<_$DiscountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DiscountData _$DiscountDataFromJson(Map<String, dynamic> json) {
  return _DiscountData.fromJson(json);
}

/// @nodoc
mixin _$DiscountData {
  @JsonKey(name: 'MasterDiscountID')
  String? get masterDiscountID => throw _privateConstructorUsedError;
  @JsonKey(name: 'MasterDiscountName')
  String? get masterDiscountName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DiscountType')
  String? get discountType => throw _privateConstructorUsedError;
  @JsonKey(name: 'ValueType')
  String? get valueType => throw _privateConstructorUsedError;
  @JsonKey(name: 'DiscountValue')
  String? get discountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'QtyDiscount')
  String? get qtyDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'SpesificMenuID')
  List<DiscountMenu> get spesificMenu => throw _privateConstructorUsedError;
  @JsonKey(name: 'DiscountValidFrom')
  String? get discountValidFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'DiscountValidUntil')
  String? get discountValidUntil => throw _privateConstructorUsedError;
  @JsonKey(name: 'MinTransDiscount')
  String? get minTransDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletID')
  String? get outletId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaxDiscount')
  String? get maxDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyCode')
  String? get companyCode => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'AvailableDay',
      fromJson: _parseAvailableDay,
      toJson: _writeAvailableDay)
  List<String> get availableDay => throw _privateConstructorUsedError;

  /// Serializes this DiscountData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiscountData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiscountDataCopyWith<DiscountData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountDataCopyWith<$Res> {
  factory $DiscountDataCopyWith(
          DiscountData value, $Res Function(DiscountData) then) =
      _$DiscountDataCopyWithImpl<$Res, DiscountData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'MasterDiscountID') String? masterDiscountID,
      @JsonKey(name: 'MasterDiscountName') String? masterDiscountName,
      @JsonKey(name: 'DiscountType') String? discountType,
      @JsonKey(name: 'ValueType') String? valueType,
      @JsonKey(name: 'DiscountValue') String? discountValue,
      @JsonKey(name: 'QtyDiscount') String? qtyDiscount,
      @JsonKey(name: 'SpesificMenuID') List<DiscountMenu> spesificMenu,
      @JsonKey(name: 'DiscountValidFrom') String? discountValidFrom,
      @JsonKey(name: 'DiscountValidUntil') String? discountValidUntil,
      @JsonKey(name: 'MinTransDiscount') String? minTransDiscount,
      @JsonKey(name: 'OutletID') String? outletId,
      @JsonKey(name: 'MaxDiscount') String? maxDiscount,
      @JsonKey(name: 'CompanyCode') String? companyCode,
      @JsonKey(
          name: 'AvailableDay',
          fromJson: _parseAvailableDay,
          toJson: _writeAvailableDay)
      List<String> availableDay});
}

/// @nodoc
class _$DiscountDataCopyWithImpl<$Res, $Val extends DiscountData>
    implements $DiscountDataCopyWith<$Res> {
  _$DiscountDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiscountData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? masterDiscountID = freezed,
    Object? masterDiscountName = freezed,
    Object? discountType = freezed,
    Object? valueType = freezed,
    Object? discountValue = freezed,
    Object? qtyDiscount = freezed,
    Object? spesificMenu = null,
    Object? discountValidFrom = freezed,
    Object? discountValidUntil = freezed,
    Object? minTransDiscount = freezed,
    Object? outletId = freezed,
    Object? maxDiscount = freezed,
    Object? companyCode = freezed,
    Object? availableDay = null,
  }) {
    return _then(_value.copyWith(
      masterDiscountID: freezed == masterDiscountID
          ? _value.masterDiscountID
          : masterDiscountID // ignore: cast_nullable_to_non_nullable
              as String?,
      masterDiscountName: freezed == masterDiscountName
          ? _value.masterDiscountName
          : masterDiscountName // ignore: cast_nullable_to_non_nullable
              as String?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      valueType: freezed == valueType
          ? _value.valueType
          : valueType // ignore: cast_nullable_to_non_nullable
              as String?,
      discountValue: freezed == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as String?,
      qtyDiscount: freezed == qtyDiscount
          ? _value.qtyDiscount
          : qtyDiscount // ignore: cast_nullable_to_non_nullable
              as String?,
      spesificMenu: null == spesificMenu
          ? _value.spesificMenu
          : spesificMenu // ignore: cast_nullable_to_non_nullable
              as List<DiscountMenu>,
      discountValidFrom: freezed == discountValidFrom
          ? _value.discountValidFrom
          : discountValidFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      discountValidUntil: freezed == discountValidUntil
          ? _value.discountValidUntil
          : discountValidUntil // ignore: cast_nullable_to_non_nullable
              as String?,
      minTransDiscount: freezed == minTransDiscount
          ? _value.minTransDiscount
          : minTransDiscount // ignore: cast_nullable_to_non_nullable
              as String?,
      outletId: freezed == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String?,
      maxDiscount: freezed == maxDiscount
          ? _value.maxDiscount
          : maxDiscount // ignore: cast_nullable_to_non_nullable
              as String?,
      companyCode: freezed == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      availableDay: null == availableDay
          ? _value.availableDay
          : availableDay // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscountDataImplCopyWith<$Res>
    implements $DiscountDataCopyWith<$Res> {
  factory _$$DiscountDataImplCopyWith(
          _$DiscountDataImpl value, $Res Function(_$DiscountDataImpl) then) =
      __$$DiscountDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MasterDiscountID') String? masterDiscountID,
      @JsonKey(name: 'MasterDiscountName') String? masterDiscountName,
      @JsonKey(name: 'DiscountType') String? discountType,
      @JsonKey(name: 'ValueType') String? valueType,
      @JsonKey(name: 'DiscountValue') String? discountValue,
      @JsonKey(name: 'QtyDiscount') String? qtyDiscount,
      @JsonKey(name: 'SpesificMenuID') List<DiscountMenu> spesificMenu,
      @JsonKey(name: 'DiscountValidFrom') String? discountValidFrom,
      @JsonKey(name: 'DiscountValidUntil') String? discountValidUntil,
      @JsonKey(name: 'MinTransDiscount') String? minTransDiscount,
      @JsonKey(name: 'OutletID') String? outletId,
      @JsonKey(name: 'MaxDiscount') String? maxDiscount,
      @JsonKey(name: 'CompanyCode') String? companyCode,
      @JsonKey(
          name: 'AvailableDay',
          fromJson: _parseAvailableDay,
          toJson: _writeAvailableDay)
      List<String> availableDay});
}

/// @nodoc
class __$$DiscountDataImplCopyWithImpl<$Res>
    extends _$DiscountDataCopyWithImpl<$Res, _$DiscountDataImpl>
    implements _$$DiscountDataImplCopyWith<$Res> {
  __$$DiscountDataImplCopyWithImpl(
      _$DiscountDataImpl _value, $Res Function(_$DiscountDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiscountData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? masterDiscountID = freezed,
    Object? masterDiscountName = freezed,
    Object? discountType = freezed,
    Object? valueType = freezed,
    Object? discountValue = freezed,
    Object? qtyDiscount = freezed,
    Object? spesificMenu = null,
    Object? discountValidFrom = freezed,
    Object? discountValidUntil = freezed,
    Object? minTransDiscount = freezed,
    Object? outletId = freezed,
    Object? maxDiscount = freezed,
    Object? companyCode = freezed,
    Object? availableDay = null,
  }) {
    return _then(_$DiscountDataImpl(
      masterDiscountID: freezed == masterDiscountID
          ? _value.masterDiscountID
          : masterDiscountID // ignore: cast_nullable_to_non_nullable
              as String?,
      masterDiscountName: freezed == masterDiscountName
          ? _value.masterDiscountName
          : masterDiscountName // ignore: cast_nullable_to_non_nullable
              as String?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      valueType: freezed == valueType
          ? _value.valueType
          : valueType // ignore: cast_nullable_to_non_nullable
              as String?,
      discountValue: freezed == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as String?,
      qtyDiscount: freezed == qtyDiscount
          ? _value.qtyDiscount
          : qtyDiscount // ignore: cast_nullable_to_non_nullable
              as String?,
      spesificMenu: null == spesificMenu
          ? _value._spesificMenu
          : spesificMenu // ignore: cast_nullable_to_non_nullable
              as List<DiscountMenu>,
      discountValidFrom: freezed == discountValidFrom
          ? _value.discountValidFrom
          : discountValidFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      discountValidUntil: freezed == discountValidUntil
          ? _value.discountValidUntil
          : discountValidUntil // ignore: cast_nullable_to_non_nullable
              as String?,
      minTransDiscount: freezed == minTransDiscount
          ? _value.minTransDiscount
          : minTransDiscount // ignore: cast_nullable_to_non_nullable
              as String?,
      outletId: freezed == outletId
          ? _value.outletId
          : outletId // ignore: cast_nullable_to_non_nullable
              as String?,
      maxDiscount: freezed == maxDiscount
          ? _value.maxDiscount
          : maxDiscount // ignore: cast_nullable_to_non_nullable
              as String?,
      companyCode: freezed == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      availableDay: null == availableDay
          ? _value._availableDay
          : availableDay // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscountDataImpl implements _DiscountData {
  const _$DiscountDataImpl(
      {@JsonKey(name: 'MasterDiscountID') this.masterDiscountID,
      @JsonKey(name: 'MasterDiscountName') this.masterDiscountName,
      @JsonKey(name: 'DiscountType') this.discountType,
      @JsonKey(name: 'ValueType') this.valueType,
      @JsonKey(name: 'DiscountValue') this.discountValue,
      @JsonKey(name: 'QtyDiscount') this.qtyDiscount,
      @JsonKey(name: 'SpesificMenuID')
      final List<DiscountMenu> spesificMenu = const [],
      @JsonKey(name: 'DiscountValidFrom') this.discountValidFrom,
      @JsonKey(name: 'DiscountValidUntil') this.discountValidUntil,
      @JsonKey(name: 'MinTransDiscount') this.minTransDiscount,
      @JsonKey(name: 'OutletID') this.outletId,
      @JsonKey(name: 'MaxDiscount') this.maxDiscount,
      @JsonKey(name: 'CompanyCode') this.companyCode,
      @JsonKey(
          name: 'AvailableDay',
          fromJson: _parseAvailableDay,
          toJson: _writeAvailableDay)
      final List<String> availableDay = const []})
      : _spesificMenu = spesificMenu,
        _availableDay = availableDay;

  factory _$DiscountDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscountDataImplFromJson(json);

  @override
  @JsonKey(name: 'MasterDiscountID')
  final String? masterDiscountID;
  @override
  @JsonKey(name: 'MasterDiscountName')
  final String? masterDiscountName;
  @override
  @JsonKey(name: 'DiscountType')
  final String? discountType;
  @override
  @JsonKey(name: 'ValueType')
  final String? valueType;
  @override
  @JsonKey(name: 'DiscountValue')
  final String? discountValue;
  @override
  @JsonKey(name: 'QtyDiscount')
  final String? qtyDiscount;
  final List<DiscountMenu> _spesificMenu;
  @override
  @JsonKey(name: 'SpesificMenuID')
  List<DiscountMenu> get spesificMenu {
    if (_spesificMenu is EqualUnmodifiableListView) return _spesificMenu;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spesificMenu);
  }

  @override
  @JsonKey(name: 'DiscountValidFrom')
  final String? discountValidFrom;
  @override
  @JsonKey(name: 'DiscountValidUntil')
  final String? discountValidUntil;
  @override
  @JsonKey(name: 'MinTransDiscount')
  final String? minTransDiscount;
  @override
  @JsonKey(name: 'OutletID')
  final String? outletId;
  @override
  @JsonKey(name: 'MaxDiscount')
  final String? maxDiscount;
  @override
  @JsonKey(name: 'CompanyCode')
  final String? companyCode;
  final List<String> _availableDay;
  @override
  @JsonKey(
      name: 'AvailableDay',
      fromJson: _parseAvailableDay,
      toJson: _writeAvailableDay)
  List<String> get availableDay {
    if (_availableDay is EqualUnmodifiableListView) return _availableDay;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableDay);
  }

  @override
  String toString() {
    return 'DiscountData(masterDiscountID: $masterDiscountID, masterDiscountName: $masterDiscountName, discountType: $discountType, valueType: $valueType, discountValue: $discountValue, qtyDiscount: $qtyDiscount, spesificMenu: $spesificMenu, discountValidFrom: $discountValidFrom, discountValidUntil: $discountValidUntil, minTransDiscount: $minTransDiscount, outletId: $outletId, maxDiscount: $maxDiscount, companyCode: $companyCode, availableDay: $availableDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscountDataImpl &&
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
            (identical(other.qtyDiscount, qtyDiscount) ||
                other.qtyDiscount == qtyDiscount) &&
            const DeepCollectionEquality()
                .equals(other._spesificMenu, _spesificMenu) &&
            (identical(other.discountValidFrom, discountValidFrom) ||
                other.discountValidFrom == discountValidFrom) &&
            (identical(other.discountValidUntil, discountValidUntil) ||
                other.discountValidUntil == discountValidUntil) &&
            (identical(other.minTransDiscount, minTransDiscount) ||
                other.minTransDiscount == minTransDiscount) &&
            (identical(other.outletId, outletId) ||
                other.outletId == outletId) &&
            (identical(other.maxDiscount, maxDiscount) ||
                other.maxDiscount == maxDiscount) &&
            (identical(other.companyCode, companyCode) ||
                other.companyCode == companyCode) &&
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
      qtyDiscount,
      const DeepCollectionEquality().hash(_spesificMenu),
      discountValidFrom,
      discountValidUntil,
      minTransDiscount,
      outletId,
      maxDiscount,
      companyCode,
      const DeepCollectionEquality().hash(_availableDay));

  /// Create a copy of DiscountData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscountDataImplCopyWith<_$DiscountDataImpl> get copyWith =>
      __$$DiscountDataImplCopyWithImpl<_$DiscountDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscountDataImplToJson(
      this,
    );
  }
}

abstract class _DiscountData implements DiscountData {
  const factory _DiscountData(
      {@JsonKey(name: 'MasterDiscountID') final String? masterDiscountID,
      @JsonKey(name: 'MasterDiscountName') final String? masterDiscountName,
      @JsonKey(name: 'DiscountType') final String? discountType,
      @JsonKey(name: 'ValueType') final String? valueType,
      @JsonKey(name: 'DiscountValue') final String? discountValue,
      @JsonKey(name: 'QtyDiscount') final String? qtyDiscount,
      @JsonKey(name: 'SpesificMenuID') final List<DiscountMenu> spesificMenu,
      @JsonKey(name: 'DiscountValidFrom') final String? discountValidFrom,
      @JsonKey(name: 'DiscountValidUntil') final String? discountValidUntil,
      @JsonKey(name: 'MinTransDiscount') final String? minTransDiscount,
      @JsonKey(name: 'OutletID') final String? outletId,
      @JsonKey(name: 'MaxDiscount') final String? maxDiscount,
      @JsonKey(name: 'CompanyCode') final String? companyCode,
      @JsonKey(
          name: 'AvailableDay',
          fromJson: _parseAvailableDay,
          toJson: _writeAvailableDay)
      final List<String> availableDay}) = _$DiscountDataImpl;

  factory _DiscountData.fromJson(Map<String, dynamic> json) =
      _$DiscountDataImpl.fromJson;

  @override
  @JsonKey(name: 'MasterDiscountID')
  String? get masterDiscountID;
  @override
  @JsonKey(name: 'MasterDiscountName')
  String? get masterDiscountName;
  @override
  @JsonKey(name: 'DiscountType')
  String? get discountType;
  @override
  @JsonKey(name: 'ValueType')
  String? get valueType;
  @override
  @JsonKey(name: 'DiscountValue')
  String? get discountValue;
  @override
  @JsonKey(name: 'QtyDiscount')
  String? get qtyDiscount;
  @override
  @JsonKey(name: 'SpesificMenuID')
  List<DiscountMenu> get spesificMenu;
  @override
  @JsonKey(name: 'DiscountValidFrom')
  String? get discountValidFrom;
  @override
  @JsonKey(name: 'DiscountValidUntil')
  String? get discountValidUntil;
  @override
  @JsonKey(name: 'MinTransDiscount')
  String? get minTransDiscount;
  @override
  @JsonKey(name: 'OutletID')
  String? get outletId;
  @override
  @JsonKey(name: 'MaxDiscount')
  String? get maxDiscount;
  @override
  @JsonKey(name: 'CompanyCode')
  String? get companyCode;
  @override
  @JsonKey(
      name: 'AvailableDay',
      fromJson: _parseAvailableDay,
      toJson: _writeAvailableDay)
  List<String> get availableDay;

  /// Create a copy of DiscountData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiscountDataImplCopyWith<_$DiscountDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DiscountMenu _$DiscountMenuFromJson(Map<String, dynamic> json) {
  return _DiscountMenu.fromJson(json);
}

/// @nodoc
mixin _$DiscountMenu {
  @JsonKey(name: 'MenuID')
  String? get menuID => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuCode')
  String? get menuCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuImage')
  String? get menuImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'CategoryID')
  String? get categoryID => throw _privateConstructorUsedError;
  @JsonKey(name: 'SubCategoryID')
  String? get subCategoryID => throw _privateConstructorUsedError;
  @JsonKey(name: 'StationID')
  String? get stationID => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuName')
  String? get menuName => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuDesc')
  String? get menuDesc => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuPrice')
  String? get menuPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuDiscount')
  String? get menuDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'MenuType')
  String? get menuType => throw _privateConstructorUsedError;
  @JsonKey(name: 'AddOn', fromJson: _parseAddOns)
  List<MenuAddOnGroup>? get addOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'NoteOption', fromJson: _parseNoteOptions)
  List<String>? get noteOption => throw _privateConstructorUsedError;
  @JsonKey(name: 'Varian', fromJson: _parseVariants)
  List<dynamic>? get variant => throw _privateConstructorUsedError;
  @JsonKey(name: 'AvailOutlet', fromJson: _parseAvailOutlets)
  List<String>? get availOutlet => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShowStatusPos')
  String? get showStatusPos => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShowStatusApps')
  String? get showStatusApps => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyCode')
  String? get companyCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'AvailableDay', fromJson: _parseAvailableDay)
  List<String>? get availableDay => throw _privateConstructorUsedError;

  /// Serializes this DiscountMenu to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiscountMenu
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiscountMenuCopyWith<DiscountMenu> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountMenuCopyWith<$Res> {
  factory $DiscountMenuCopyWith(
          DiscountMenu value, $Res Function(DiscountMenu) then) =
      _$DiscountMenuCopyWithImpl<$Res, DiscountMenu>;
  @useResult
  $Res call(
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
      List<String>? availableDay});
}

/// @nodoc
class _$DiscountMenuCopyWithImpl<$Res, $Val extends DiscountMenu>
    implements $DiscountMenuCopyWith<$Res> {
  _$DiscountMenuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiscountMenu
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
              as List<MenuAddOnGroup>?,
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
abstract class _$$DiscountMenuImplCopyWith<$Res>
    implements $DiscountMenuCopyWith<$Res> {
  factory _$$DiscountMenuImplCopyWith(
          _$DiscountMenuImpl value, $Res Function(_$DiscountMenuImpl) then) =
      __$$DiscountMenuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
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
      List<String>? availableDay});
}

/// @nodoc
class __$$DiscountMenuImplCopyWithImpl<$Res>
    extends _$DiscountMenuCopyWithImpl<$Res, _$DiscountMenuImpl>
    implements _$$DiscountMenuImplCopyWith<$Res> {
  __$$DiscountMenuImplCopyWithImpl(
      _$DiscountMenuImpl _value, $Res Function(_$DiscountMenuImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiscountMenu
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
    return _then(_$DiscountMenuImpl(
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
              as List<MenuAddOnGroup>?,
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
class _$DiscountMenuImpl implements _DiscountMenu {
  const _$DiscountMenuImpl(
      {@JsonKey(name: 'MenuID') this.menuID,
      @JsonKey(name: 'MenuCode') this.menuCode,
      @JsonKey(name: 'MenuImage') this.menuImage,
      @JsonKey(name: 'CategoryID') this.categoryID,
      @JsonKey(name: 'SubCategoryID') this.subCategoryID,
      @JsonKey(name: 'StationID') this.stationID,
      @JsonKey(name: 'MenuName') this.menuName,
      @JsonKey(name: 'MenuDesc') this.menuDesc,
      @JsonKey(name: 'MenuPrice') this.menuPrice,
      @JsonKey(name: 'MenuDiscount') this.menuDiscount,
      @JsonKey(name: 'MenuType') this.menuType,
      @JsonKey(name: 'AddOn', fromJson: _parseAddOns)
      final List<MenuAddOnGroup>? addOn,
      @JsonKey(name: 'NoteOption', fromJson: _parseNoteOptions)
      final List<String>? noteOption,
      @JsonKey(name: 'Varian', fromJson: _parseVariants)
      final List<dynamic>? variant,
      @JsonKey(name: 'AvailOutlet', fromJson: _parseAvailOutlets)
      final List<String>? availOutlet,
      @JsonKey(name: 'ShowStatusPos') this.showStatusPos,
      @JsonKey(name: 'ShowStatusApps') this.showStatusApps,
      @JsonKey(name: 'CompanyCode') this.companyCode,
      @JsonKey(name: 'AvailableDay', fromJson: _parseAvailableDay)
      final List<String>? availableDay})
      : _addOn = addOn,
        _noteOption = noteOption,
        _variant = variant,
        _availOutlet = availOutlet,
        _availableDay = availableDay;

  factory _$DiscountMenuImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscountMenuImplFromJson(json);

  @override
  @JsonKey(name: 'MenuID')
  final String? menuID;
  @override
  @JsonKey(name: 'MenuCode')
  final String? menuCode;
  @override
  @JsonKey(name: 'MenuImage')
  final String? menuImage;
  @override
  @JsonKey(name: 'CategoryID')
  final String? categoryID;
  @override
  @JsonKey(name: 'SubCategoryID')
  final String? subCategoryID;
  @override
  @JsonKey(name: 'StationID')
  final String? stationID;
  @override
  @JsonKey(name: 'MenuName')
  final String? menuName;
  @override
  @JsonKey(name: 'MenuDesc')
  final String? menuDesc;
  @override
  @JsonKey(name: 'MenuPrice')
  final String? menuPrice;
  @override
  @JsonKey(name: 'MenuDiscount')
  final String? menuDiscount;
  @override
  @JsonKey(name: 'MenuType')
  final String? menuType;
  final List<MenuAddOnGroup>? _addOn;
  @override
  @JsonKey(name: 'AddOn', fromJson: _parseAddOns)
  List<MenuAddOnGroup>? get addOn {
    final value = _addOn;
    if (value == null) return null;
    if (_addOn is EqualUnmodifiableListView) return _addOn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _noteOption;
  @override
  @JsonKey(name: 'NoteOption', fromJson: _parseNoteOptions)
  List<String>? get noteOption {
    final value = _noteOption;
    if (value == null) return null;
    if (_noteOption is EqualUnmodifiableListView) return _noteOption;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _variant;
  @override
  @JsonKey(name: 'Varian', fromJson: _parseVariants)
  List<dynamic>? get variant {
    final value = _variant;
    if (value == null) return null;
    if (_variant is EqualUnmodifiableListView) return _variant;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _availOutlet;
  @override
  @JsonKey(name: 'AvailOutlet', fromJson: _parseAvailOutlets)
  List<String>? get availOutlet {
    final value = _availOutlet;
    if (value == null) return null;
    if (_availOutlet is EqualUnmodifiableListView) return _availOutlet;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'ShowStatusPos')
  final String? showStatusPos;
  @override
  @JsonKey(name: 'ShowStatusApps')
  final String? showStatusApps;
  @override
  @JsonKey(name: 'CompanyCode')
  final String? companyCode;
  final List<String>? _availableDay;
  @override
  @JsonKey(name: 'AvailableDay', fromJson: _parseAvailableDay)
  List<String>? get availableDay {
    final value = _availableDay;
    if (value == null) return null;
    if (_availableDay is EqualUnmodifiableListView) return _availableDay;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DiscountMenu(menuID: $menuID, menuCode: $menuCode, menuImage: $menuImage, categoryID: $categoryID, subCategoryID: $subCategoryID, stationID: $stationID, menuName: $menuName, menuDesc: $menuDesc, menuPrice: $menuPrice, menuDiscount: $menuDiscount, menuType: $menuType, addOn: $addOn, noteOption: $noteOption, variant: $variant, availOutlet: $availOutlet, showStatusPos: $showStatusPos, showStatusApps: $showStatusApps, companyCode: $companyCode, availableDay: $availableDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscountMenuImpl &&
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

  /// Create a copy of DiscountMenu
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscountMenuImplCopyWith<_$DiscountMenuImpl> get copyWith =>
      __$$DiscountMenuImplCopyWithImpl<_$DiscountMenuImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscountMenuImplToJson(
      this,
    );
  }
}

abstract class _DiscountMenu implements DiscountMenu {
  const factory _DiscountMenu(
      {@JsonKey(name: 'MenuID') final String? menuID,
      @JsonKey(name: 'MenuCode') final String? menuCode,
      @JsonKey(name: 'MenuImage') final String? menuImage,
      @JsonKey(name: 'CategoryID') final String? categoryID,
      @JsonKey(name: 'SubCategoryID') final String? subCategoryID,
      @JsonKey(name: 'StationID') final String? stationID,
      @JsonKey(name: 'MenuName') final String? menuName,
      @JsonKey(name: 'MenuDesc') final String? menuDesc,
      @JsonKey(name: 'MenuPrice') final String? menuPrice,
      @JsonKey(name: 'MenuDiscount') final String? menuDiscount,
      @JsonKey(name: 'MenuType') final String? menuType,
      @JsonKey(name: 'AddOn', fromJson: _parseAddOns)
      final List<MenuAddOnGroup>? addOn,
      @JsonKey(name: 'NoteOption', fromJson: _parseNoteOptions)
      final List<String>? noteOption,
      @JsonKey(name: 'Varian', fromJson: _parseVariants)
      final List<dynamic>? variant,
      @JsonKey(name: 'AvailOutlet', fromJson: _parseAvailOutlets)
      final List<String>? availOutlet,
      @JsonKey(name: 'ShowStatusPos') final String? showStatusPos,
      @JsonKey(name: 'ShowStatusApps') final String? showStatusApps,
      @JsonKey(name: 'CompanyCode') final String? companyCode,
      @JsonKey(name: 'AvailableDay', fromJson: _parseAvailableDay)
      final List<String>? availableDay}) = _$DiscountMenuImpl;

  factory _DiscountMenu.fromJson(Map<String, dynamic> json) =
      _$DiscountMenuImpl.fromJson;

  @override
  @JsonKey(name: 'MenuID')
  String? get menuID;
  @override
  @JsonKey(name: 'MenuCode')
  String? get menuCode;
  @override
  @JsonKey(name: 'MenuImage')
  String? get menuImage;
  @override
  @JsonKey(name: 'CategoryID')
  String? get categoryID;
  @override
  @JsonKey(name: 'SubCategoryID')
  String? get subCategoryID;
  @override
  @JsonKey(name: 'StationID')
  String? get stationID;
  @override
  @JsonKey(name: 'MenuName')
  String? get menuName;
  @override
  @JsonKey(name: 'MenuDesc')
  String? get menuDesc;
  @override
  @JsonKey(name: 'MenuPrice')
  String? get menuPrice;
  @override
  @JsonKey(name: 'MenuDiscount')
  String? get menuDiscount;
  @override
  @JsonKey(name: 'MenuType')
  String? get menuType;
  @override
  @JsonKey(name: 'AddOn', fromJson: _parseAddOns)
  List<MenuAddOnGroup>? get addOn;
  @override
  @JsonKey(name: 'NoteOption', fromJson: _parseNoteOptions)
  List<String>? get noteOption;
  @override
  @JsonKey(name: 'Varian', fromJson: _parseVariants)
  List<dynamic>? get variant;
  @override
  @JsonKey(name: 'AvailOutlet', fromJson: _parseAvailOutlets)
  List<String>? get availOutlet;
  @override
  @JsonKey(name: 'ShowStatusPos')
  String? get showStatusPos;
  @override
  @JsonKey(name: 'ShowStatusApps')
  String? get showStatusApps;
  @override
  @JsonKey(name: 'CompanyCode')
  String? get companyCode;
  @override
  @JsonKey(name: 'AvailableDay', fromJson: _parseAvailableDay)
  List<String>? get availableDay;

  /// Create a copy of DiscountMenu
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiscountMenuImplCopyWith<_$DiscountMenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuAddOnGroup _$MenuAddOnGroupFromJson(Map<String, dynamic> json) {
  return _MenuAddOnGroup.fromJson(json);
}

/// @nodoc
mixin _$MenuAddOnGroup {
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'addOn')
  List<int>? get addOnIDs => throw _privateConstructorUsedError;
  int? get multiply => throw _privateConstructorUsedError;
  int? get required => throw _privateConstructorUsedError;
  int? get min => throw _privateConstructorUsedError;
  int? get max => throw _privateConstructorUsedError;

  /// Serializes this MenuAddOnGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuAddOnGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuAddOnGroupCopyWith<MenuAddOnGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuAddOnGroupCopyWith<$Res> {
  factory $MenuAddOnGroupCopyWith(
          MenuAddOnGroup value, $Res Function(MenuAddOnGroup) then) =
      _$MenuAddOnGroupCopyWithImpl<$Res, MenuAddOnGroup>;
  @useResult
  $Res call(
      {String? title,
      @JsonKey(name: 'addOn') List<int>? addOnIDs,
      int? multiply,
      int? required,
      int? min,
      int? max});
}

/// @nodoc
class _$MenuAddOnGroupCopyWithImpl<$Res, $Val extends MenuAddOnGroup>
    implements $MenuAddOnGroupCopyWith<$Res> {
  _$MenuAddOnGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuAddOnGroup
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
abstract class _$$MenuAddOnGroupImplCopyWith<$Res>
    implements $MenuAddOnGroupCopyWith<$Res> {
  factory _$$MenuAddOnGroupImplCopyWith(_$MenuAddOnGroupImpl value,
          $Res Function(_$MenuAddOnGroupImpl) then) =
      __$$MenuAddOnGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      @JsonKey(name: 'addOn') List<int>? addOnIDs,
      int? multiply,
      int? required,
      int? min,
      int? max});
}

/// @nodoc
class __$$MenuAddOnGroupImplCopyWithImpl<$Res>
    extends _$MenuAddOnGroupCopyWithImpl<$Res, _$MenuAddOnGroupImpl>
    implements _$$MenuAddOnGroupImplCopyWith<$Res> {
  __$$MenuAddOnGroupImplCopyWithImpl(
      _$MenuAddOnGroupImpl _value, $Res Function(_$MenuAddOnGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuAddOnGroup
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
    return _then(_$MenuAddOnGroupImpl(
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
class _$MenuAddOnGroupImpl implements _MenuAddOnGroup {
  const _$MenuAddOnGroupImpl(
      {this.title,
      @JsonKey(name: 'addOn') final List<int>? addOnIDs,
      this.multiply,
      this.required,
      this.min,
      this.max})
      : _addOnIDs = addOnIDs;

  factory _$MenuAddOnGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuAddOnGroupImplFromJson(json);

  @override
  final String? title;
  final List<int>? _addOnIDs;
  @override
  @JsonKey(name: 'addOn')
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
    return 'MenuAddOnGroup(title: $title, addOnIDs: $addOnIDs, multiply: $multiply, required: $required, min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuAddOnGroupImpl &&
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

  /// Create a copy of MenuAddOnGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuAddOnGroupImplCopyWith<_$MenuAddOnGroupImpl> get copyWith =>
      __$$MenuAddOnGroupImplCopyWithImpl<_$MenuAddOnGroupImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuAddOnGroupImplToJson(
      this,
    );
  }
}

abstract class _MenuAddOnGroup implements MenuAddOnGroup {
  const factory _MenuAddOnGroup(
      {final String? title,
      @JsonKey(name: 'addOn') final List<int>? addOnIDs,
      final int? multiply,
      final int? required,
      final int? min,
      final int? max}) = _$MenuAddOnGroupImpl;

  factory _MenuAddOnGroup.fromJson(Map<String, dynamic> json) =
      _$MenuAddOnGroupImpl.fromJson;

  @override
  String? get title;
  @override
  @JsonKey(name: 'addOn')
  List<int>? get addOnIDs;
  @override
  int? get multiply;
  @override
  int? get required;
  @override
  int? get min;
  @override
  int? get max;

  /// Create a copy of MenuAddOnGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuAddOnGroupImplCopyWith<_$MenuAddOnGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
