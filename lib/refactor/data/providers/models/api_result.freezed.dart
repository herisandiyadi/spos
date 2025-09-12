// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String data, String url,
            Map<String, dynamic> header, int statusCode)
        success,
    required TResult Function(String data, String url,
            Map<String, dynamic> header, int statusCode)
        error,
    required TResult Function(NetworkException networkException) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String data, String url, Map<String, dynamic> header,
            int statusCode)?
        success,
    TResult? Function(String data, String url, Map<String, dynamic> header,
            int statusCode)?
        error,
    TResult? Function(NetworkException networkException)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String data, String url, Map<String, dynamic> header,
            int statusCode)?
        success,
    TResult Function(String data, String url, Map<String, dynamic> header,
            int statusCode)?
        error,
    TResult Function(NetworkException networkException)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiResultSuccess value) success,
    required TResult Function(_ApiResultError value) error,
    required TResult Function(_ApiResultFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ApiResultSuccess value)? success,
    TResult? Function(_ApiResultError value)? error,
    TResult? Function(_ApiResultFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiResultSuccess value)? success,
    TResult Function(_ApiResultError value)? error,
    TResult Function(_ApiResultFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResultCopyWith<$Res> {
  factory $ApiResultCopyWith(ApiResult value, $Res Function(ApiResult) then) =
      _$ApiResultCopyWithImpl<$Res, ApiResult>;
}

/// @nodoc
class _$ApiResultCopyWithImpl<$Res, $Val extends ApiResult>
    implements $ApiResultCopyWith<$Res> {
  _$ApiResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ApiResultSuccessImplCopyWith<$Res> {
  factory _$$ApiResultSuccessImplCopyWith(_$ApiResultSuccessImpl value,
          $Res Function(_$ApiResultSuccessImpl) then) =
      __$$ApiResultSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String data, String url, Map<String, dynamic> header, int statusCode});
}

/// @nodoc
class __$$ApiResultSuccessImplCopyWithImpl<$Res>
    extends _$ApiResultCopyWithImpl<$Res, _$ApiResultSuccessImpl>
    implements _$$ApiResultSuccessImplCopyWith<$Res> {
  __$$ApiResultSuccessImplCopyWithImpl(_$ApiResultSuccessImpl _value,
      $Res Function(_$ApiResultSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? url = null,
    Object? header = null,
    Object? statusCode = null,
  }) {
    return _then(_$ApiResultSuccessImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      header: null == header
          ? _value._header
          : header // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ApiResultSuccessImpl implements _ApiResultSuccess {
  const _$ApiResultSuccessImpl(
      {required this.data,
      required this.url,
      required final Map<String, dynamic> header,
      required this.statusCode})
      : _header = header;

  @override
  final String data;
  @override
  final String url;
  final Map<String, dynamic> _header;
  @override
  Map<String, dynamic> get header {
    if (_header is EqualUnmodifiableMapView) return _header;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_header);
  }

  @override
  final int statusCode;

  @override
  String toString() {
    return 'ApiResult.success(data: $data, url: $url, header: $header, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResultSuccessImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other._header, _header) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, url,
      const DeepCollectionEquality().hash(_header), statusCode);

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResultSuccessImplCopyWith<_$ApiResultSuccessImpl> get copyWith =>
      __$$ApiResultSuccessImplCopyWithImpl<_$ApiResultSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String data, String url,
            Map<String, dynamic> header, int statusCode)
        success,
    required TResult Function(String data, String url,
            Map<String, dynamic> header, int statusCode)
        error,
    required TResult Function(NetworkException networkException) failure,
  }) {
    return success(data, url, header, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String data, String url, Map<String, dynamic> header,
            int statusCode)?
        success,
    TResult? Function(String data, String url, Map<String, dynamic> header,
            int statusCode)?
        error,
    TResult? Function(NetworkException networkException)? failure,
  }) {
    return success?.call(data, url, header, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String data, String url, Map<String, dynamic> header,
            int statusCode)?
        success,
    TResult Function(String data, String url, Map<String, dynamic> header,
            int statusCode)?
        error,
    TResult Function(NetworkException networkException)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data, url, header, statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiResultSuccess value) success,
    required TResult Function(_ApiResultError value) error,
    required TResult Function(_ApiResultFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ApiResultSuccess value)? success,
    TResult? Function(_ApiResultError value)? error,
    TResult? Function(_ApiResultFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiResultSuccess value)? success,
    TResult Function(_ApiResultError value)? error,
    TResult Function(_ApiResultFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _ApiResultSuccess implements ApiResult {
  const factory _ApiResultSuccess(
      {required final String data,
      required final String url,
      required final Map<String, dynamic> header,
      required final int statusCode}) = _$ApiResultSuccessImpl;

  String get data;
  String get url;
  Map<String, dynamic> get header;
  int get statusCode;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiResultSuccessImplCopyWith<_$ApiResultSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiResultErrorImplCopyWith<$Res> {
  factory _$$ApiResultErrorImplCopyWith(_$ApiResultErrorImpl value,
          $Res Function(_$ApiResultErrorImpl) then) =
      __$$ApiResultErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String data, String url, Map<String, dynamic> header, int statusCode});
}

/// @nodoc
class __$$ApiResultErrorImplCopyWithImpl<$Res>
    extends _$ApiResultCopyWithImpl<$Res, _$ApiResultErrorImpl>
    implements _$$ApiResultErrorImplCopyWith<$Res> {
  __$$ApiResultErrorImplCopyWithImpl(
      _$ApiResultErrorImpl _value, $Res Function(_$ApiResultErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? url = null,
    Object? header = null,
    Object? statusCode = null,
  }) {
    return _then(_$ApiResultErrorImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      header: null == header
          ? _value._header
          : header // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ApiResultErrorImpl implements _ApiResultError {
  const _$ApiResultErrorImpl(
      {required this.data,
      required this.url,
      required final Map<String, dynamic> header,
      required this.statusCode})
      : _header = header;

  @override
  final String data;
  @override
  final String url;
  final Map<String, dynamic> _header;
  @override
  Map<String, dynamic> get header {
    if (_header is EqualUnmodifiableMapView) return _header;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_header);
  }

  @override
  final int statusCode;

  @override
  String toString() {
    return 'ApiResult.error(data: $data, url: $url, header: $header, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResultErrorImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other._header, _header) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, url,
      const DeepCollectionEquality().hash(_header), statusCode);

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResultErrorImplCopyWith<_$ApiResultErrorImpl> get copyWith =>
      __$$ApiResultErrorImplCopyWithImpl<_$ApiResultErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String data, String url,
            Map<String, dynamic> header, int statusCode)
        success,
    required TResult Function(String data, String url,
            Map<String, dynamic> header, int statusCode)
        error,
    required TResult Function(NetworkException networkException) failure,
  }) {
    return error(data, url, header, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String data, String url, Map<String, dynamic> header,
            int statusCode)?
        success,
    TResult? Function(String data, String url, Map<String, dynamic> header,
            int statusCode)?
        error,
    TResult? Function(NetworkException networkException)? failure,
  }) {
    return error?.call(data, url, header, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String data, String url, Map<String, dynamic> header,
            int statusCode)?
        success,
    TResult Function(String data, String url, Map<String, dynamic> header,
            int statusCode)?
        error,
    TResult Function(NetworkException networkException)? failure,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(data, url, header, statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiResultSuccess value) success,
    required TResult Function(_ApiResultError value) error,
    required TResult Function(_ApiResultFailure value) failure,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ApiResultSuccess value)? success,
    TResult? Function(_ApiResultError value)? error,
    TResult? Function(_ApiResultFailure value)? failure,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiResultSuccess value)? success,
    TResult Function(_ApiResultError value)? error,
    TResult Function(_ApiResultFailure value)? failure,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ApiResultError implements ApiResult {
  const factory _ApiResultError(
      {required final String data,
      required final String url,
      required final Map<String, dynamic> header,
      required final int statusCode}) = _$ApiResultErrorImpl;

  String get data;
  String get url;
  Map<String, dynamic> get header;
  int get statusCode;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiResultErrorImplCopyWith<_$ApiResultErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiResultFailureImplCopyWith<$Res> {
  factory _$$ApiResultFailureImplCopyWith(_$ApiResultFailureImpl value,
          $Res Function(_$ApiResultFailureImpl) then) =
      __$$ApiResultFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NetworkException networkException});

  $NetworkExceptionCopyWith<$Res> get networkException;
}

/// @nodoc
class __$$ApiResultFailureImplCopyWithImpl<$Res>
    extends _$ApiResultCopyWithImpl<$Res, _$ApiResultFailureImpl>
    implements _$$ApiResultFailureImplCopyWith<$Res> {
  __$$ApiResultFailureImplCopyWithImpl(_$ApiResultFailureImpl _value,
      $Res Function(_$ApiResultFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? networkException = null,
  }) {
    return _then(_$ApiResultFailureImpl(
      networkException: null == networkException
          ? _value.networkException
          : networkException // ignore: cast_nullable_to_non_nullable
              as NetworkException,
    ));
  }

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NetworkExceptionCopyWith<$Res> get networkException {
    return $NetworkExceptionCopyWith<$Res>(_value.networkException, (value) {
      return _then(_value.copyWith(networkException: value));
    });
  }
}

/// @nodoc

class _$ApiResultFailureImpl implements _ApiResultFailure {
  const _$ApiResultFailureImpl({required this.networkException});

  @override
  final NetworkException networkException;

  @override
  String toString() {
    return 'ApiResult.failure(networkException: $networkException)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResultFailureImpl &&
            (identical(other.networkException, networkException) ||
                other.networkException == networkException));
  }

  @override
  int get hashCode => Object.hash(runtimeType, networkException);

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResultFailureImplCopyWith<_$ApiResultFailureImpl> get copyWith =>
      __$$ApiResultFailureImplCopyWithImpl<_$ApiResultFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String data, String url,
            Map<String, dynamic> header, int statusCode)
        success,
    required TResult Function(String data, String url,
            Map<String, dynamic> header, int statusCode)
        error,
    required TResult Function(NetworkException networkException) failure,
  }) {
    return failure(networkException);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String data, String url, Map<String, dynamic> header,
            int statusCode)?
        success,
    TResult? Function(String data, String url, Map<String, dynamic> header,
            int statusCode)?
        error,
    TResult? Function(NetworkException networkException)? failure,
  }) {
    return failure?.call(networkException);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String data, String url, Map<String, dynamic> header,
            int statusCode)?
        success,
    TResult Function(String data, String url, Map<String, dynamic> header,
            int statusCode)?
        error,
    TResult Function(NetworkException networkException)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(networkException);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiResultSuccess value) success,
    required TResult Function(_ApiResultError value) error,
    required TResult Function(_ApiResultFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ApiResultSuccess value)? success,
    TResult? Function(_ApiResultError value)? error,
    TResult? Function(_ApiResultFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiResultSuccess value)? success,
    TResult Function(_ApiResultError value)? error,
    TResult Function(_ApiResultFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _ApiResultFailure implements ApiResult {
  const factory _ApiResultFailure(
          {required final NetworkException networkException}) =
      _$ApiResultFailureImpl;

  NetworkException get networkException;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiResultFailureImplCopyWith<_$ApiResultFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
