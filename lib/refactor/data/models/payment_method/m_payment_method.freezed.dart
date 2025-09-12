// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_payment_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentMethodModel _$PaymentMethodModelFromJson(Map<String, dynamic> json) {
  return _PaymentMethodModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodModel {
  String get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<PaymentMethodData> get data => throw _privateConstructorUsedError;

  /// Serializes this PaymentMethodModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodModelCopyWith<PaymentMethodModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodModelCopyWith<$Res> {
  factory $PaymentMethodModelCopyWith(
          PaymentMethodModel value, $Res Function(PaymentMethodModel) then) =
      _$PaymentMethodModelCopyWithImpl<$Res, PaymentMethodModel>;
  @useResult
  $Res call({String status, String? message, List<PaymentMethodData> data});
}

/// @nodoc
class _$PaymentMethodModelCopyWithImpl<$Res, $Val extends PaymentMethodModel>
    implements $PaymentMethodModelCopyWith<$Res> {
  _$PaymentMethodModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethodModel
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
              as List<PaymentMethodData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodModelImplCopyWith<$Res>
    implements $PaymentMethodModelCopyWith<$Res> {
  factory _$$PaymentMethodModelImplCopyWith(_$PaymentMethodModelImpl value,
          $Res Function(_$PaymentMethodModelImpl) then) =
      __$$PaymentMethodModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String? message, List<PaymentMethodData> data});
}

/// @nodoc
class __$$PaymentMethodModelImplCopyWithImpl<$Res>
    extends _$PaymentMethodModelCopyWithImpl<$Res, _$PaymentMethodModelImpl>
    implements _$$PaymentMethodModelImplCopyWith<$Res> {
  __$$PaymentMethodModelImplCopyWithImpl(_$PaymentMethodModelImpl _value,
      $Res Function(_$PaymentMethodModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_$PaymentMethodModelImpl(
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
              as List<PaymentMethodData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodModelImpl implements _PaymentMethodModel {
  const _$PaymentMethodModelImpl(
      {required this.status,
      this.message,
      final List<PaymentMethodData> data = const []})
      : _data = data;

  factory _$PaymentMethodModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodModelImplFromJson(json);

  @override
  final String status;
  @override
  final String? message;
  final List<PaymentMethodData> _data;
  @override
  @JsonKey()
  List<PaymentMethodData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'PaymentMethodModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodModelImplCopyWith<_$PaymentMethodModelImpl> get copyWith =>
      __$$PaymentMethodModelImplCopyWithImpl<_$PaymentMethodModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethodModel implements PaymentMethodModel {
  const factory _PaymentMethodModel(
      {required final String status,
      final String? message,
      final List<PaymentMethodData> data}) = _$PaymentMethodModelImpl;

  factory _PaymentMethodModel.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodModelImpl.fromJson;

  @override
  String get status;
  @override
  String? get message;
  @override
  List<PaymentMethodData> get data;

  /// Create a copy of PaymentMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodModelImplCopyWith<_$PaymentMethodModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentMethodData _$PaymentMethodDataFromJson(Map<String, dynamic> json) {
  return _PaymentMethodData.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodData {
  @JsonKey(name: 'PaymentMethodID')
  String? get paymentMethodID => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentMethodName')
  String? get paymentMethodName => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentFee')
  String? get paymentFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyCode')
  String? get companyCode => throw _privateConstructorUsedError;

  /// Serializes this PaymentMethodData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethodData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodDataCopyWith<PaymentMethodData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodDataCopyWith<$Res> {
  factory $PaymentMethodDataCopyWith(
          PaymentMethodData value, $Res Function(PaymentMethodData) then) =
      _$PaymentMethodDataCopyWithImpl<$Res, PaymentMethodData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PaymentMethodID') String? paymentMethodID,
      @JsonKey(name: 'PaymentMethodName') String? paymentMethodName,
      @JsonKey(name: 'PaymentFee') String? paymentFee,
      @JsonKey(name: 'CompanyCode') String? companyCode});
}

/// @nodoc
class _$PaymentMethodDataCopyWithImpl<$Res, $Val extends PaymentMethodData>
    implements $PaymentMethodDataCopyWith<$Res> {
  _$PaymentMethodDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethodData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethodID = freezed,
    Object? paymentMethodName = freezed,
    Object? paymentFee = freezed,
    Object? companyCode = freezed,
  }) {
    return _then(_value.copyWith(
      paymentMethodID: freezed == paymentMethodID
          ? _value.paymentMethodID
          : paymentMethodID // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethodName: freezed == paymentMethodName
          ? _value.paymentMethodName
          : paymentMethodName // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentFee: freezed == paymentFee
          ? _value.paymentFee
          : paymentFee // ignore: cast_nullable_to_non_nullable
              as String?,
      companyCode: freezed == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodDataImplCopyWith<$Res>
    implements $PaymentMethodDataCopyWith<$Res> {
  factory _$$PaymentMethodDataImplCopyWith(_$PaymentMethodDataImpl value,
          $Res Function(_$PaymentMethodDataImpl) then) =
      __$$PaymentMethodDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PaymentMethodID') String? paymentMethodID,
      @JsonKey(name: 'PaymentMethodName') String? paymentMethodName,
      @JsonKey(name: 'PaymentFee') String? paymentFee,
      @JsonKey(name: 'CompanyCode') String? companyCode});
}

/// @nodoc
class __$$PaymentMethodDataImplCopyWithImpl<$Res>
    extends _$PaymentMethodDataCopyWithImpl<$Res, _$PaymentMethodDataImpl>
    implements _$$PaymentMethodDataImplCopyWith<$Res> {
  __$$PaymentMethodDataImplCopyWithImpl(_$PaymentMethodDataImpl _value,
      $Res Function(_$PaymentMethodDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMethodData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethodID = freezed,
    Object? paymentMethodName = freezed,
    Object? paymentFee = freezed,
    Object? companyCode = freezed,
  }) {
    return _then(_$PaymentMethodDataImpl(
      paymentMethodID: freezed == paymentMethodID
          ? _value.paymentMethodID
          : paymentMethodID // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethodName: freezed == paymentMethodName
          ? _value.paymentMethodName
          : paymentMethodName // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentFee: freezed == paymentFee
          ? _value.paymentFee
          : paymentFee // ignore: cast_nullable_to_non_nullable
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
class _$PaymentMethodDataImpl implements _PaymentMethodData {
  const _$PaymentMethodDataImpl(
      {@JsonKey(name: 'PaymentMethodID') this.paymentMethodID,
      @JsonKey(name: 'PaymentMethodName') this.paymentMethodName,
      @JsonKey(name: 'PaymentFee') this.paymentFee,
      @JsonKey(name: 'CompanyCode') this.companyCode});

  factory _$PaymentMethodDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodDataImplFromJson(json);

  @override
  @JsonKey(name: 'PaymentMethodID')
  final String? paymentMethodID;
  @override
  @JsonKey(name: 'PaymentMethodName')
  final String? paymentMethodName;
  @override
  @JsonKey(name: 'PaymentFee')
  final String? paymentFee;
  @override
  @JsonKey(name: 'CompanyCode')
  final String? companyCode;

  @override
  String toString() {
    return 'PaymentMethodData(paymentMethodID: $paymentMethodID, paymentMethodName: $paymentMethodName, paymentFee: $paymentFee, companyCode: $companyCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodDataImpl &&
            (identical(other.paymentMethodID, paymentMethodID) ||
                other.paymentMethodID == paymentMethodID) &&
            (identical(other.paymentMethodName, paymentMethodName) ||
                other.paymentMethodName == paymentMethodName) &&
            (identical(other.paymentFee, paymentFee) ||
                other.paymentFee == paymentFee) &&
            (identical(other.companyCode, companyCode) ||
                other.companyCode == companyCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, paymentMethodID, paymentMethodName, paymentFee, companyCode);

  /// Create a copy of PaymentMethodData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodDataImplCopyWith<_$PaymentMethodDataImpl> get copyWith =>
      __$$PaymentMethodDataImplCopyWithImpl<_$PaymentMethodDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodDataImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethodData implements PaymentMethodData {
  const factory _PaymentMethodData(
          {@JsonKey(name: 'PaymentMethodID') final String? paymentMethodID,
          @JsonKey(name: 'PaymentMethodName') final String? paymentMethodName,
          @JsonKey(name: 'PaymentFee') final String? paymentFee,
          @JsonKey(name: 'CompanyCode') final String? companyCode}) =
      _$PaymentMethodDataImpl;

  factory _PaymentMethodData.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodDataImpl.fromJson;

  @override
  @JsonKey(name: 'PaymentMethodID')
  String? get paymentMethodID;
  @override
  @JsonKey(name: 'PaymentMethodName')
  String? get paymentMethodName;
  @override
  @JsonKey(name: 'PaymentFee')
  String? get paymentFee;
  @override
  @JsonKey(name: 'CompanyCode')
  String? get companyCode;

  /// Create a copy of PaymentMethodData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodDataImplCopyWith<_$PaymentMethodDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
