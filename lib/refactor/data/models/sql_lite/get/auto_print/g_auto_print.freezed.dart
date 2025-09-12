// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'g_auto_print.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AutoPrintModel _$AutoPrintModelFromJson(Map<String, dynamic> json) {
  return _AutoPrintModel.fromJson(json);
}

/// @nodoc
mixin _$AutoPrintModel {
  bool get isAutoPrint => throw _privateConstructorUsedError;

  /// Serializes this AutoPrintModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AutoPrintModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AutoPrintModelCopyWith<AutoPrintModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutoPrintModelCopyWith<$Res> {
  factory $AutoPrintModelCopyWith(
          AutoPrintModel value, $Res Function(AutoPrintModel) then) =
      _$AutoPrintModelCopyWithImpl<$Res, AutoPrintModel>;
  @useResult
  $Res call({bool isAutoPrint});
}

/// @nodoc
class _$AutoPrintModelCopyWithImpl<$Res, $Val extends AutoPrintModel>
    implements $AutoPrintModelCopyWith<$Res> {
  _$AutoPrintModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AutoPrintModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAutoPrint = null,
  }) {
    return _then(_value.copyWith(
      isAutoPrint: null == isAutoPrint
          ? _value.isAutoPrint
          : isAutoPrint // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AutoPrintModelImplCopyWith<$Res>
    implements $AutoPrintModelCopyWith<$Res> {
  factory _$$AutoPrintModelImplCopyWith(_$AutoPrintModelImpl value,
          $Res Function(_$AutoPrintModelImpl) then) =
      __$$AutoPrintModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAutoPrint});
}

/// @nodoc
class __$$AutoPrintModelImplCopyWithImpl<$Res>
    extends _$AutoPrintModelCopyWithImpl<$Res, _$AutoPrintModelImpl>
    implements _$$AutoPrintModelImplCopyWith<$Res> {
  __$$AutoPrintModelImplCopyWithImpl(
      _$AutoPrintModelImpl _value, $Res Function(_$AutoPrintModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AutoPrintModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAutoPrint = null,
  }) {
    return _then(_$AutoPrintModelImpl(
      isAutoPrint: null == isAutoPrint
          ? _value.isAutoPrint
          : isAutoPrint // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AutoPrintModelImpl implements _AutoPrintModel {
  const _$AutoPrintModelImpl({required this.isAutoPrint});

  factory _$AutoPrintModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AutoPrintModelImplFromJson(json);

  @override
  final bool isAutoPrint;

  @override
  String toString() {
    return 'AutoPrintModel(isAutoPrint: $isAutoPrint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutoPrintModelImpl &&
            (identical(other.isAutoPrint, isAutoPrint) ||
                other.isAutoPrint == isAutoPrint));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isAutoPrint);

  /// Create a copy of AutoPrintModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AutoPrintModelImplCopyWith<_$AutoPrintModelImpl> get copyWith =>
      __$$AutoPrintModelImplCopyWithImpl<_$AutoPrintModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AutoPrintModelImplToJson(
      this,
    );
  }
}

abstract class _AutoPrintModel implements AutoPrintModel {
  const factory _AutoPrintModel({required final bool isAutoPrint}) =
      _$AutoPrintModelImpl;

  factory _AutoPrintModel.fromJson(Map<String, dynamic> json) =
      _$AutoPrintModelImpl.fromJson;

  @override
  bool get isAutoPrint;

  /// Create a copy of AutoPrintModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AutoPrintModelImplCopyWith<_$AutoPrintModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
