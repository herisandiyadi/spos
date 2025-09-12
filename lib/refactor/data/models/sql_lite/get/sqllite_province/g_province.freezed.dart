// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'g_province.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProvinceLiteModel _$ProvinceLiteModelFromJson(Map<String, dynamic> json) {
  return _ProvinceLiteModel.fromJson(json);
}

/// @nodoc
mixin _$ProvinceLiteModel {
  @JsonKey(name: 'provinceID')
  int get provinceID => throw _privateConstructorUsedError;
  @JsonKey(name: 'provinceName')
  String get provinceName => throw _privateConstructorUsedError;

  /// Serializes this ProvinceLiteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProvinceLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProvinceLiteModelCopyWith<ProvinceLiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProvinceLiteModelCopyWith<$Res> {
  factory $ProvinceLiteModelCopyWith(
          ProvinceLiteModel value, $Res Function(ProvinceLiteModel) then) =
      _$ProvinceLiteModelCopyWithImpl<$Res, ProvinceLiteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'provinceID') int provinceID,
      @JsonKey(name: 'provinceName') String provinceName});
}

/// @nodoc
class _$ProvinceLiteModelCopyWithImpl<$Res, $Val extends ProvinceLiteModel>
    implements $ProvinceLiteModelCopyWith<$Res> {
  _$ProvinceLiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProvinceLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provinceID = null,
    Object? provinceName = null,
  }) {
    return _then(_value.copyWith(
      provinceID: null == provinceID
          ? _value.provinceID
          : provinceID // ignore: cast_nullable_to_non_nullable
              as int,
      provinceName: null == provinceName
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProvinceLiteModelImplCopyWith<$Res>
    implements $ProvinceLiteModelCopyWith<$Res> {
  factory _$$ProvinceLiteModelImplCopyWith(_$ProvinceLiteModelImpl value,
          $Res Function(_$ProvinceLiteModelImpl) then) =
      __$$ProvinceLiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'provinceID') int provinceID,
      @JsonKey(name: 'provinceName') String provinceName});
}

/// @nodoc
class __$$ProvinceLiteModelImplCopyWithImpl<$Res>
    extends _$ProvinceLiteModelCopyWithImpl<$Res, _$ProvinceLiteModelImpl>
    implements _$$ProvinceLiteModelImplCopyWith<$Res> {
  __$$ProvinceLiteModelImplCopyWithImpl(_$ProvinceLiteModelImpl _value,
      $Res Function(_$ProvinceLiteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProvinceLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provinceID = null,
    Object? provinceName = null,
  }) {
    return _then(_$ProvinceLiteModelImpl(
      provinceID: null == provinceID
          ? _value.provinceID
          : provinceID // ignore: cast_nullable_to_non_nullable
              as int,
      provinceName: null == provinceName
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProvinceLiteModelImpl implements _ProvinceLiteModel {
  const _$ProvinceLiteModelImpl(
      {@JsonKey(name: 'provinceID') required this.provinceID,
      @JsonKey(name: 'provinceName') required this.provinceName});

  factory _$ProvinceLiteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProvinceLiteModelImplFromJson(json);

  @override
  @JsonKey(name: 'provinceID')
  final int provinceID;
  @override
  @JsonKey(name: 'provinceName')
  final String provinceName;

  @override
  String toString() {
    return 'ProvinceLiteModel(provinceID: $provinceID, provinceName: $provinceName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProvinceLiteModelImpl &&
            (identical(other.provinceID, provinceID) ||
                other.provinceID == provinceID) &&
            (identical(other.provinceName, provinceName) ||
                other.provinceName == provinceName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, provinceID, provinceName);

  /// Create a copy of ProvinceLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProvinceLiteModelImplCopyWith<_$ProvinceLiteModelImpl> get copyWith =>
      __$$ProvinceLiteModelImplCopyWithImpl<_$ProvinceLiteModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProvinceLiteModelImplToJson(
      this,
    );
  }
}

abstract class _ProvinceLiteModel implements ProvinceLiteModel {
  const factory _ProvinceLiteModel(
          {@JsonKey(name: 'provinceID') required final int provinceID,
          @JsonKey(name: 'provinceName') required final String provinceName}) =
      _$ProvinceLiteModelImpl;

  factory _ProvinceLiteModel.fromJson(Map<String, dynamic> json) =
      _$ProvinceLiteModelImpl.fromJson;

  @override
  @JsonKey(name: 'provinceID')
  int get provinceID;
  @override
  @JsonKey(name: 'provinceName')
  String get provinceName;

  /// Create a copy of ProvinceLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProvinceLiteModelImplCopyWith<_$ProvinceLiteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
