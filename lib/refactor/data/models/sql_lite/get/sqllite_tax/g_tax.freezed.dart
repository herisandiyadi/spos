// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'g_tax.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaxLiteModel _$TaxLiteModelFromJson(Map<String, dynamic> json) {
  return _TaxLiteModel.fromJson(json);
}

/// @nodoc
mixin _$TaxLiteModel {
  @JsonKey(name: 'taxID')
  int get taxID => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxName')
  String get taxName => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxPercent')
  double get taxPercent => throw _privateConstructorUsedError;

  /// Serializes this TaxLiteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaxLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaxLiteModelCopyWith<TaxLiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxLiteModelCopyWith<$Res> {
  factory $TaxLiteModelCopyWith(
          TaxLiteModel value, $Res Function(TaxLiteModel) then) =
      _$TaxLiteModelCopyWithImpl<$Res, TaxLiteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'taxID') int taxID,
      @JsonKey(name: 'taxName') String taxName,
      @JsonKey(name: 'taxPercent') double taxPercent});
}

/// @nodoc
class _$TaxLiteModelCopyWithImpl<$Res, $Val extends TaxLiteModel>
    implements $TaxLiteModelCopyWith<$Res> {
  _$TaxLiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaxLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taxID = null,
    Object? taxName = null,
    Object? taxPercent = null,
  }) {
    return _then(_value.copyWith(
      taxID: null == taxID
          ? _value.taxID
          : taxID // ignore: cast_nullable_to_non_nullable
              as int,
      taxName: null == taxName
          ? _value.taxName
          : taxName // ignore: cast_nullable_to_non_nullable
              as String,
      taxPercent: null == taxPercent
          ? _value.taxPercent
          : taxPercent // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaxLiteModelImplCopyWith<$Res>
    implements $TaxLiteModelCopyWith<$Res> {
  factory _$$TaxLiteModelImplCopyWith(
          _$TaxLiteModelImpl value, $Res Function(_$TaxLiteModelImpl) then) =
      __$$TaxLiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'taxID') int taxID,
      @JsonKey(name: 'taxName') String taxName,
      @JsonKey(name: 'taxPercent') double taxPercent});
}

/// @nodoc
class __$$TaxLiteModelImplCopyWithImpl<$Res>
    extends _$TaxLiteModelCopyWithImpl<$Res, _$TaxLiteModelImpl>
    implements _$$TaxLiteModelImplCopyWith<$Res> {
  __$$TaxLiteModelImplCopyWithImpl(
      _$TaxLiteModelImpl _value, $Res Function(_$TaxLiteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaxLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taxID = null,
    Object? taxName = null,
    Object? taxPercent = null,
  }) {
    return _then(_$TaxLiteModelImpl(
      taxID: null == taxID
          ? _value.taxID
          : taxID // ignore: cast_nullable_to_non_nullable
              as int,
      taxName: null == taxName
          ? _value.taxName
          : taxName // ignore: cast_nullable_to_non_nullable
              as String,
      taxPercent: null == taxPercent
          ? _value.taxPercent
          : taxPercent // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaxLiteModelImpl implements _TaxLiteModel {
  const _$TaxLiteModelImpl(
      {@JsonKey(name: 'taxID') required this.taxID,
      @JsonKey(name: 'taxName') required this.taxName,
      @JsonKey(name: 'taxPercent') required this.taxPercent});

  factory _$TaxLiteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaxLiteModelImplFromJson(json);

  @override
  @JsonKey(name: 'taxID')
  final int taxID;
  @override
  @JsonKey(name: 'taxName')
  final String taxName;
  @override
  @JsonKey(name: 'taxPercent')
  final double taxPercent;

  @override
  String toString() {
    return 'TaxLiteModel(taxID: $taxID, taxName: $taxName, taxPercent: $taxPercent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaxLiteModelImpl &&
            (identical(other.taxID, taxID) || other.taxID == taxID) &&
            (identical(other.taxName, taxName) || other.taxName == taxName) &&
            (identical(other.taxPercent, taxPercent) ||
                other.taxPercent == taxPercent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, taxID, taxName, taxPercent);

  /// Create a copy of TaxLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaxLiteModelImplCopyWith<_$TaxLiteModelImpl> get copyWith =>
      __$$TaxLiteModelImplCopyWithImpl<_$TaxLiteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaxLiteModelImplToJson(
      this,
    );
  }
}

abstract class _TaxLiteModel implements TaxLiteModel {
  const factory _TaxLiteModel(
          {@JsonKey(name: 'taxID') required final int taxID,
          @JsonKey(name: 'taxName') required final String taxName,
          @JsonKey(name: 'taxPercent') required final double taxPercent}) =
      _$TaxLiteModelImpl;

  factory _TaxLiteModel.fromJson(Map<String, dynamic> json) =
      _$TaxLiteModelImpl.fromJson;

  @override
  @JsonKey(name: 'taxID')
  int get taxID;
  @override
  @JsonKey(name: 'taxName')
  String get taxName;
  @override
  @JsonKey(name: 'taxPercent')
  double get taxPercent;

  /// Create a copy of TaxLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaxLiteModelImplCopyWith<_$TaxLiteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
