// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NetworkModel {
  NetworkParameter get networkParameter => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NetworkParameter networkParameter) post,
    required TResult Function(NetworkParameter networkParameter) get,
    required TResult Function(NetworkParameter networkParameter) put,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NetworkParameter networkParameter)? post,
    TResult? Function(NetworkParameter networkParameter)? get,
    TResult? Function(NetworkParameter networkParameter)? put,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NetworkParameter networkParameter)? post,
    TResult Function(NetworkParameter networkParameter)? get,
    TResult Function(NetworkParameter networkParameter)? put,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkModelPost value) post,
    required TResult Function(_NetworkModelGet value) get,
    required TResult Function(_NetworkModelPut value) put,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkModelPost value)? post,
    TResult? Function(_NetworkModelGet value)? get,
    TResult? Function(_NetworkModelPut value)? put,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkModelPost value)? post,
    TResult Function(_NetworkModelGet value)? get,
    TResult Function(_NetworkModelPut value)? put,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of NetworkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NetworkModelCopyWith<NetworkModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkModelCopyWith<$Res> {
  factory $NetworkModelCopyWith(
          NetworkModel value, $Res Function(NetworkModel) then) =
      _$NetworkModelCopyWithImpl<$Res, NetworkModel>;
  @useResult
  $Res call({NetworkParameter networkParameter});

  $NetworkParameterCopyWith<$Res> get networkParameter;
}

/// @nodoc
class _$NetworkModelCopyWithImpl<$Res, $Val extends NetworkModel>
    implements $NetworkModelCopyWith<$Res> {
  _$NetworkModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NetworkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? networkParameter = null,
  }) {
    return _then(_value.copyWith(
      networkParameter: null == networkParameter
          ? _value.networkParameter
          : networkParameter // ignore: cast_nullable_to_non_nullable
              as NetworkParameter,
    ) as $Val);
  }

  /// Create a copy of NetworkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NetworkParameterCopyWith<$Res> get networkParameter {
    return $NetworkParameterCopyWith<$Res>(_value.networkParameter, (value) {
      return _then(_value.copyWith(networkParameter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NetworkModelPostImplCopyWith<$Res>
    implements $NetworkModelCopyWith<$Res> {
  factory _$$NetworkModelPostImplCopyWith(_$NetworkModelPostImpl value,
          $Res Function(_$NetworkModelPostImpl) then) =
      __$$NetworkModelPostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NetworkParameter networkParameter});

  @override
  $NetworkParameterCopyWith<$Res> get networkParameter;
}

/// @nodoc
class __$$NetworkModelPostImplCopyWithImpl<$Res>
    extends _$NetworkModelCopyWithImpl<$Res, _$NetworkModelPostImpl>
    implements _$$NetworkModelPostImplCopyWith<$Res> {
  __$$NetworkModelPostImplCopyWithImpl(_$NetworkModelPostImpl _value,
      $Res Function(_$NetworkModelPostImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? networkParameter = null,
  }) {
    return _then(_$NetworkModelPostImpl(
      networkParameter: null == networkParameter
          ? _value.networkParameter
          : networkParameter // ignore: cast_nullable_to_non_nullable
              as NetworkParameter,
    ));
  }
}

/// @nodoc

class _$NetworkModelPostImpl implements _NetworkModelPost {
  const _$NetworkModelPostImpl({required this.networkParameter});

  @override
  final NetworkParameter networkParameter;

  @override
  String toString() {
    return 'NetworkModel.post(networkParameter: $networkParameter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkModelPostImpl &&
            (identical(other.networkParameter, networkParameter) ||
                other.networkParameter == networkParameter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, networkParameter);

  /// Create a copy of NetworkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkModelPostImplCopyWith<_$NetworkModelPostImpl> get copyWith =>
      __$$NetworkModelPostImplCopyWithImpl<_$NetworkModelPostImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NetworkParameter networkParameter) post,
    required TResult Function(NetworkParameter networkParameter) get,
    required TResult Function(NetworkParameter networkParameter) put,
  }) {
    return post(networkParameter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NetworkParameter networkParameter)? post,
    TResult? Function(NetworkParameter networkParameter)? get,
    TResult? Function(NetworkParameter networkParameter)? put,
  }) {
    return post?.call(networkParameter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NetworkParameter networkParameter)? post,
    TResult Function(NetworkParameter networkParameter)? get,
    TResult Function(NetworkParameter networkParameter)? put,
    required TResult orElse(),
  }) {
    if (post != null) {
      return post(networkParameter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkModelPost value) post,
    required TResult Function(_NetworkModelGet value) get,
    required TResult Function(_NetworkModelPut value) put,
  }) {
    return post(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkModelPost value)? post,
    TResult? Function(_NetworkModelGet value)? get,
    TResult? Function(_NetworkModelPut value)? put,
  }) {
    return post?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkModelPost value)? post,
    TResult Function(_NetworkModelGet value)? get,
    TResult Function(_NetworkModelPut value)? put,
    required TResult orElse(),
  }) {
    if (post != null) {
      return post(this);
    }
    return orElse();
  }
}

abstract class _NetworkModelPost implements NetworkModel {
  const factory _NetworkModelPost(
          {required final NetworkParameter networkParameter}) =
      _$NetworkModelPostImpl;

  @override
  NetworkParameter get networkParameter;

  /// Create a copy of NetworkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkModelPostImplCopyWith<_$NetworkModelPostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkModelGetImplCopyWith<$Res>
    implements $NetworkModelCopyWith<$Res> {
  factory _$$NetworkModelGetImplCopyWith(_$NetworkModelGetImpl value,
          $Res Function(_$NetworkModelGetImpl) then) =
      __$$NetworkModelGetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NetworkParameter networkParameter});

  @override
  $NetworkParameterCopyWith<$Res> get networkParameter;
}

/// @nodoc
class __$$NetworkModelGetImplCopyWithImpl<$Res>
    extends _$NetworkModelCopyWithImpl<$Res, _$NetworkModelGetImpl>
    implements _$$NetworkModelGetImplCopyWith<$Res> {
  __$$NetworkModelGetImplCopyWithImpl(
      _$NetworkModelGetImpl _value, $Res Function(_$NetworkModelGetImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? networkParameter = null,
  }) {
    return _then(_$NetworkModelGetImpl(
      networkParameter: null == networkParameter
          ? _value.networkParameter
          : networkParameter // ignore: cast_nullable_to_non_nullable
              as NetworkParameter,
    ));
  }
}

/// @nodoc

class _$NetworkModelGetImpl implements _NetworkModelGet {
  const _$NetworkModelGetImpl({required this.networkParameter});

  @override
  final NetworkParameter networkParameter;

  @override
  String toString() {
    return 'NetworkModel.get(networkParameter: $networkParameter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkModelGetImpl &&
            (identical(other.networkParameter, networkParameter) ||
                other.networkParameter == networkParameter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, networkParameter);

  /// Create a copy of NetworkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkModelGetImplCopyWith<_$NetworkModelGetImpl> get copyWith =>
      __$$NetworkModelGetImplCopyWithImpl<_$NetworkModelGetImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NetworkParameter networkParameter) post,
    required TResult Function(NetworkParameter networkParameter) get,
    required TResult Function(NetworkParameter networkParameter) put,
  }) {
    return get(networkParameter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NetworkParameter networkParameter)? post,
    TResult? Function(NetworkParameter networkParameter)? get,
    TResult? Function(NetworkParameter networkParameter)? put,
  }) {
    return get?.call(networkParameter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NetworkParameter networkParameter)? post,
    TResult Function(NetworkParameter networkParameter)? get,
    TResult Function(NetworkParameter networkParameter)? put,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(networkParameter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkModelPost value) post,
    required TResult Function(_NetworkModelGet value) get,
    required TResult Function(_NetworkModelPut value) put,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkModelPost value)? post,
    TResult? Function(_NetworkModelGet value)? get,
    TResult? Function(_NetworkModelPut value)? put,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkModelPost value)? post,
    TResult Function(_NetworkModelGet value)? get,
    TResult Function(_NetworkModelPut value)? put,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class _NetworkModelGet implements NetworkModel {
  const factory _NetworkModelGet(
          {required final NetworkParameter networkParameter}) =
      _$NetworkModelGetImpl;

  @override
  NetworkParameter get networkParameter;

  /// Create a copy of NetworkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkModelGetImplCopyWith<_$NetworkModelGetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkModelPutImplCopyWith<$Res>
    implements $NetworkModelCopyWith<$Res> {
  factory _$$NetworkModelPutImplCopyWith(_$NetworkModelPutImpl value,
          $Res Function(_$NetworkModelPutImpl) then) =
      __$$NetworkModelPutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NetworkParameter networkParameter});

  @override
  $NetworkParameterCopyWith<$Res> get networkParameter;
}

/// @nodoc
class __$$NetworkModelPutImplCopyWithImpl<$Res>
    extends _$NetworkModelCopyWithImpl<$Res, _$NetworkModelPutImpl>
    implements _$$NetworkModelPutImplCopyWith<$Res> {
  __$$NetworkModelPutImplCopyWithImpl(
      _$NetworkModelPutImpl _value, $Res Function(_$NetworkModelPutImpl) _then)
      : super(_value, _then);

  /// Create a copy of NetworkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? networkParameter = null,
  }) {
    return _then(_$NetworkModelPutImpl(
      networkParameter: null == networkParameter
          ? _value.networkParameter
          : networkParameter // ignore: cast_nullable_to_non_nullable
              as NetworkParameter,
    ));
  }
}

/// @nodoc

class _$NetworkModelPutImpl implements _NetworkModelPut {
  const _$NetworkModelPutImpl({required this.networkParameter});

  @override
  final NetworkParameter networkParameter;

  @override
  String toString() {
    return 'NetworkModel.put(networkParameter: $networkParameter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkModelPutImpl &&
            (identical(other.networkParameter, networkParameter) ||
                other.networkParameter == networkParameter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, networkParameter);

  /// Create a copy of NetworkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkModelPutImplCopyWith<_$NetworkModelPutImpl> get copyWith =>
      __$$NetworkModelPutImplCopyWithImpl<_$NetworkModelPutImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NetworkParameter networkParameter) post,
    required TResult Function(NetworkParameter networkParameter) get,
    required TResult Function(NetworkParameter networkParameter) put,
  }) {
    return put(networkParameter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NetworkParameter networkParameter)? post,
    TResult? Function(NetworkParameter networkParameter)? get,
    TResult? Function(NetworkParameter networkParameter)? put,
  }) {
    return put?.call(networkParameter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NetworkParameter networkParameter)? post,
    TResult Function(NetworkParameter networkParameter)? get,
    TResult Function(NetworkParameter networkParameter)? put,
    required TResult orElse(),
  }) {
    if (put != null) {
      return put(networkParameter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkModelPost value) post,
    required TResult Function(_NetworkModelGet value) get,
    required TResult Function(_NetworkModelPut value) put,
  }) {
    return put(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkModelPost value)? post,
    TResult? Function(_NetworkModelGet value)? get,
    TResult? Function(_NetworkModelPut value)? put,
  }) {
    return put?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkModelPost value)? post,
    TResult Function(_NetworkModelGet value)? get,
    TResult Function(_NetworkModelPut value)? put,
    required TResult orElse(),
  }) {
    if (put != null) {
      return put(this);
    }
    return orElse();
  }
}

abstract class _NetworkModelPut implements NetworkModel {
  const factory _NetworkModelPut(
          {required final NetworkParameter networkParameter}) =
      _$NetworkModelPutImpl;

  @override
  NetworkParameter get networkParameter;

  /// Create a copy of NetworkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkModelPutImplCopyWith<_$NetworkModelPutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
