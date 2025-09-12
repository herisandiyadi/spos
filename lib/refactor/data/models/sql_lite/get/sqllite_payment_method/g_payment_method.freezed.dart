// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'g_payment_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentMethodLiteModel _$PaymentMethodLiteModelFromJson(
    Map<String, dynamic> json) {
  return _PaymentMethodLiteModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodLiteModel {
  @JsonKey(name: 'paymentMethodID')
  int get paymentMethodID => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentMethodName')
  String get paymentMethodName => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentFee')
  double get paymentFee => throw _privateConstructorUsedError;

  /// Serializes this PaymentMethodLiteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethodLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodLiteModelCopyWith<PaymentMethodLiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodLiteModelCopyWith<$Res> {
  factory $PaymentMethodLiteModelCopyWith(PaymentMethodLiteModel value,
          $Res Function(PaymentMethodLiteModel) then) =
      _$PaymentMethodLiteModelCopyWithImpl<$Res, PaymentMethodLiteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentMethodID') int paymentMethodID,
      @JsonKey(name: 'paymentMethodName') String paymentMethodName,
      @JsonKey(name: 'paymentFee') double paymentFee});
}

/// @nodoc
class _$PaymentMethodLiteModelCopyWithImpl<$Res,
        $Val extends PaymentMethodLiteModel>
    implements $PaymentMethodLiteModelCopyWith<$Res> {
  _$PaymentMethodLiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethodLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethodID = null,
    Object? paymentMethodName = null,
    Object? paymentFee = null,
  }) {
    return _then(_value.copyWith(
      paymentMethodID: null == paymentMethodID
          ? _value.paymentMethodID
          : paymentMethodID // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMethodName: null == paymentMethodName
          ? _value.paymentMethodName
          : paymentMethodName // ignore: cast_nullable_to_non_nullable
              as String,
      paymentFee: null == paymentFee
          ? _value.paymentFee
          : paymentFee // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodLiteModelImplCopyWith<$Res>
    implements $PaymentMethodLiteModelCopyWith<$Res> {
  factory _$$PaymentMethodLiteModelImplCopyWith(
          _$PaymentMethodLiteModelImpl value,
          $Res Function(_$PaymentMethodLiteModelImpl) then) =
      __$$PaymentMethodLiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentMethodID') int paymentMethodID,
      @JsonKey(name: 'paymentMethodName') String paymentMethodName,
      @JsonKey(name: 'paymentFee') double paymentFee});
}

/// @nodoc
class __$$PaymentMethodLiteModelImplCopyWithImpl<$Res>
    extends _$PaymentMethodLiteModelCopyWithImpl<$Res,
        _$PaymentMethodLiteModelImpl>
    implements _$$PaymentMethodLiteModelImplCopyWith<$Res> {
  __$$PaymentMethodLiteModelImplCopyWithImpl(
      _$PaymentMethodLiteModelImpl _value,
      $Res Function(_$PaymentMethodLiteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMethodLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethodID = null,
    Object? paymentMethodName = null,
    Object? paymentFee = null,
  }) {
    return _then(_$PaymentMethodLiteModelImpl(
      paymentMethodID: null == paymentMethodID
          ? _value.paymentMethodID
          : paymentMethodID // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMethodName: null == paymentMethodName
          ? _value.paymentMethodName
          : paymentMethodName // ignore: cast_nullable_to_non_nullable
              as String,
      paymentFee: null == paymentFee
          ? _value.paymentFee
          : paymentFee // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodLiteModelImpl implements _PaymentMethodLiteModel {
  const _$PaymentMethodLiteModelImpl(
      {@JsonKey(name: 'paymentMethodID') required this.paymentMethodID,
      @JsonKey(name: 'paymentMethodName') required this.paymentMethodName,
      @JsonKey(name: 'paymentFee') required this.paymentFee});

  factory _$PaymentMethodLiteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodLiteModelImplFromJson(json);

  @override
  @JsonKey(name: 'paymentMethodID')
  final int paymentMethodID;
  @override
  @JsonKey(name: 'paymentMethodName')
  final String paymentMethodName;
  @override
  @JsonKey(name: 'paymentFee')
  final double paymentFee;

  @override
  String toString() {
    return 'PaymentMethodLiteModel(paymentMethodID: $paymentMethodID, paymentMethodName: $paymentMethodName, paymentFee: $paymentFee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodLiteModelImpl &&
            (identical(other.paymentMethodID, paymentMethodID) ||
                other.paymentMethodID == paymentMethodID) &&
            (identical(other.paymentMethodName, paymentMethodName) ||
                other.paymentMethodName == paymentMethodName) &&
            (identical(other.paymentFee, paymentFee) ||
                other.paymentFee == paymentFee));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, paymentMethodID, paymentMethodName, paymentFee);

  /// Create a copy of PaymentMethodLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodLiteModelImplCopyWith<_$PaymentMethodLiteModelImpl>
      get copyWith => __$$PaymentMethodLiteModelImplCopyWithImpl<
          _$PaymentMethodLiteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodLiteModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethodLiteModel implements PaymentMethodLiteModel {
  const factory _PaymentMethodLiteModel(
          {@JsonKey(name: 'paymentMethodID') required final int paymentMethodID,
          @JsonKey(name: 'paymentMethodName')
          required final String paymentMethodName,
          @JsonKey(name: 'paymentFee') required final double paymentFee}) =
      _$PaymentMethodLiteModelImpl;

  factory _PaymentMethodLiteModel.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodLiteModelImpl.fromJson;

  @override
  @JsonKey(name: 'paymentMethodID')
  int get paymentMethodID;
  @override
  @JsonKey(name: 'paymentMethodName')
  String get paymentMethodName;
  @override
  @JsonKey(name: 'paymentFee')
  double get paymentFee;

  /// Create a copy of PaymentMethodLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodLiteModelImplCopyWith<_$PaymentMethodLiteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
