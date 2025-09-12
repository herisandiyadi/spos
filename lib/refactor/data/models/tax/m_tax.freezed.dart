// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_tax.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaxModel _$TaxModelFromJson(Map<String, dynamic> json) {
  return _TaxModel.fromJson(json);
}

/// @nodoc
mixin _$TaxModel {
  String get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<TaxData> get data => throw _privateConstructorUsedError;

  /// Serializes this TaxModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaxModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaxModelCopyWith<TaxModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxModelCopyWith<$Res> {
  factory $TaxModelCopyWith(TaxModel value, $Res Function(TaxModel) then) =
      _$TaxModelCopyWithImpl<$Res, TaxModel>;
  @useResult
  $Res call({String status, String? message, List<TaxData> data});
}

/// @nodoc
class _$TaxModelCopyWithImpl<$Res, $Val extends TaxModel>
    implements $TaxModelCopyWith<$Res> {
  _$TaxModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaxModel
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
              as List<TaxData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaxModelImplCopyWith<$Res>
    implements $TaxModelCopyWith<$Res> {
  factory _$$TaxModelImplCopyWith(
          _$TaxModelImpl value, $Res Function(_$TaxModelImpl) then) =
      __$$TaxModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String? message, List<TaxData> data});
}

/// @nodoc
class __$$TaxModelImplCopyWithImpl<$Res>
    extends _$TaxModelCopyWithImpl<$Res, _$TaxModelImpl>
    implements _$$TaxModelImplCopyWith<$Res> {
  __$$TaxModelImplCopyWithImpl(
      _$TaxModelImpl _value, $Res Function(_$TaxModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaxModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_$TaxModelImpl(
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
              as List<TaxData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaxModelImpl implements _TaxModel {
  const _$TaxModelImpl(
      {required this.status, this.message, final List<TaxData> data = const []})
      : _data = data;

  factory _$TaxModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaxModelImplFromJson(json);

  @override
  final String status;
  @override
  final String? message;
  final List<TaxData> _data;
  @override
  @JsonKey()
  List<TaxData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'TaxModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaxModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  /// Create a copy of TaxModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaxModelImplCopyWith<_$TaxModelImpl> get copyWith =>
      __$$TaxModelImplCopyWithImpl<_$TaxModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaxModelImplToJson(
      this,
    );
  }
}

abstract class _TaxModel implements TaxModel {
  const factory _TaxModel(
      {required final String status,
      final String? message,
      final List<TaxData> data}) = _$TaxModelImpl;

  factory _TaxModel.fromJson(Map<String, dynamic> json) =
      _$TaxModelImpl.fromJson;

  @override
  String get status;
  @override
  String? get message;
  @override
  List<TaxData> get data;

  /// Create a copy of TaxModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaxModelImplCopyWith<_$TaxModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaxData _$TaxDataFromJson(Map<String, dynamic> json) {
  return _TaxData.fromJson(json);
}

/// @nodoc
mixin _$TaxData {
  @JsonKey(name: 'TaxID')
  String? get taxID => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxName')
  String? get taxName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxPercent')
  String? get taxPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyCode')
  String? get companyCode => throw _privateConstructorUsedError;

  /// Serializes this TaxData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaxData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaxDataCopyWith<TaxData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxDataCopyWith<$Res> {
  factory $TaxDataCopyWith(TaxData value, $Res Function(TaxData) then) =
      _$TaxDataCopyWithImpl<$Res, TaxData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TaxID') String? taxID,
      @JsonKey(name: 'TaxName') String? taxName,
      @JsonKey(name: 'TaxPercent') String? taxPercent,
      @JsonKey(name: 'CompanyCode') String? companyCode});
}

/// @nodoc
class _$TaxDataCopyWithImpl<$Res, $Val extends TaxData>
    implements $TaxDataCopyWith<$Res> {
  _$TaxDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaxData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taxID = freezed,
    Object? taxName = freezed,
    Object? taxPercent = freezed,
    Object? companyCode = freezed,
  }) {
    return _then(_value.copyWith(
      taxID: freezed == taxID
          ? _value.taxID
          : taxID // ignore: cast_nullable_to_non_nullable
              as String?,
      taxName: freezed == taxName
          ? _value.taxName
          : taxName // ignore: cast_nullable_to_non_nullable
              as String?,
      taxPercent: freezed == taxPercent
          ? _value.taxPercent
          : taxPercent // ignore: cast_nullable_to_non_nullable
              as String?,
      companyCode: freezed == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaxDataImplCopyWith<$Res> implements $TaxDataCopyWith<$Res> {
  factory _$$TaxDataImplCopyWith(
          _$TaxDataImpl value, $Res Function(_$TaxDataImpl) then) =
      __$$TaxDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TaxID') String? taxID,
      @JsonKey(name: 'TaxName') String? taxName,
      @JsonKey(name: 'TaxPercent') String? taxPercent,
      @JsonKey(name: 'CompanyCode') String? companyCode});
}

/// @nodoc
class __$$TaxDataImplCopyWithImpl<$Res>
    extends _$TaxDataCopyWithImpl<$Res, _$TaxDataImpl>
    implements _$$TaxDataImplCopyWith<$Res> {
  __$$TaxDataImplCopyWithImpl(
      _$TaxDataImpl _value, $Res Function(_$TaxDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaxData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taxID = freezed,
    Object? taxName = freezed,
    Object? taxPercent = freezed,
    Object? companyCode = freezed,
  }) {
    return _then(_$TaxDataImpl(
      taxID: freezed == taxID
          ? _value.taxID
          : taxID // ignore: cast_nullable_to_non_nullable
              as String?,
      taxName: freezed == taxName
          ? _value.taxName
          : taxName // ignore: cast_nullable_to_non_nullable
              as String?,
      taxPercent: freezed == taxPercent
          ? _value.taxPercent
          : taxPercent // ignore: cast_nullable_to_non_nullable
              as String?,
      companyCode: freezed == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaxDataImpl implements _TaxData {
  const _$TaxDataImpl(
      {@JsonKey(name: 'TaxID') this.taxID,
      @JsonKey(name: 'TaxName') this.taxName,
      @JsonKey(name: 'TaxPercent') this.taxPercent,
      @JsonKey(name: 'CompanyCode') this.companyCode});

  factory _$TaxDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaxDataImplFromJson(json);

  @override
  @JsonKey(name: 'TaxID')
  final String? taxID;
  @override
  @JsonKey(name: 'TaxName')
  final String? taxName;
  @override
  @JsonKey(name: 'TaxPercent')
  final String? taxPercent;
  @override
  @JsonKey(name: 'CompanyCode')
  final String? companyCode;

  @override
  String toString() {
    return 'TaxData(taxID: $taxID, taxName: $taxName, taxPercent: $taxPercent, companyCode: $companyCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaxDataImpl &&
            (identical(other.taxID, taxID) || other.taxID == taxID) &&
            (identical(other.taxName, taxName) || other.taxName == taxName) &&
            (identical(other.taxPercent, taxPercent) ||
                other.taxPercent == taxPercent) &&
            (identical(other.companyCode, companyCode) ||
                other.companyCode == companyCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, taxID, taxName, taxPercent, companyCode);

  /// Create a copy of TaxData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaxDataImplCopyWith<_$TaxDataImpl> get copyWith =>
      __$$TaxDataImplCopyWithImpl<_$TaxDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaxDataImplToJson(
      this,
    );
  }
}

abstract class _TaxData implements TaxData {
  const factory _TaxData(
      {@JsonKey(name: 'TaxID') final String? taxID,
      @JsonKey(name: 'TaxName') final String? taxName,
      @JsonKey(name: 'TaxPercent') final String? taxPercent,
      @JsonKey(name: 'CompanyCode') final String? companyCode}) = _$TaxDataImpl;

  factory _TaxData.fromJson(Map<String, dynamic> json) = _$TaxDataImpl.fromJson;

  @override
  @JsonKey(name: 'TaxID')
  String? get taxID;
  @override
  @JsonKey(name: 'TaxName')
  String? get taxName;
  @override
  @JsonKey(name: 'TaxPercent')
  String? get taxPercent;
  @override
  @JsonKey(name: 'CompanyCode')
  String? get companyCode;

  /// Create a copy of TaxData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaxDataImplCopyWith<_$TaxDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
