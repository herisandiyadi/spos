// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'g_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LogLiteModel _$LogLiteModelFromJson(Map<String, dynamic> json) {
  return _LogLiteModel.fromJson(json);
}

/// @nodoc
mixin _$LogLiteModel {
  @JsonKey(name: 'logID')
  int get logID => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateTime')
  String get dateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'transactionNumber')
  String get transactionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusReturn')
  String get statusReturn => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusMessage')
  String get statusMessage => throw _privateConstructorUsedError;

  /// Serializes this LogLiteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LogLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LogLiteModelCopyWith<LogLiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogLiteModelCopyWith<$Res> {
  factory $LogLiteModelCopyWith(
          LogLiteModel value, $Res Function(LogLiteModel) then) =
      _$LogLiteModelCopyWithImpl<$Res, LogLiteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'logID') int logID,
      @JsonKey(name: 'dateTime') String dateTime,
      @JsonKey(name: 'transactionNumber') String transactionNumber,
      @JsonKey(name: 'statusReturn') String statusReturn,
      @JsonKey(name: 'statusMessage') String statusMessage});
}

/// @nodoc
class _$LogLiteModelCopyWithImpl<$Res, $Val extends LogLiteModel>
    implements $LogLiteModelCopyWith<$Res> {
  _$LogLiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LogLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logID = null,
    Object? dateTime = null,
    Object? transactionNumber = null,
    Object? statusReturn = null,
    Object? statusMessage = null,
  }) {
    return _then(_value.copyWith(
      logID: null == logID
          ? _value.logID
          : logID // ignore: cast_nullable_to_non_nullable
              as int,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
      transactionNumber: null == transactionNumber
          ? _value.transactionNumber
          : transactionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      statusReturn: null == statusReturn
          ? _value.statusReturn
          : statusReturn // ignore: cast_nullable_to_non_nullable
              as String,
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogLiteModelImplCopyWith<$Res>
    implements $LogLiteModelCopyWith<$Res> {
  factory _$$LogLiteModelImplCopyWith(
          _$LogLiteModelImpl value, $Res Function(_$LogLiteModelImpl) then) =
      __$$LogLiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'logID') int logID,
      @JsonKey(name: 'dateTime') String dateTime,
      @JsonKey(name: 'transactionNumber') String transactionNumber,
      @JsonKey(name: 'statusReturn') String statusReturn,
      @JsonKey(name: 'statusMessage') String statusMessage});
}

/// @nodoc
class __$$LogLiteModelImplCopyWithImpl<$Res>
    extends _$LogLiteModelCopyWithImpl<$Res, _$LogLiteModelImpl>
    implements _$$LogLiteModelImplCopyWith<$Res> {
  __$$LogLiteModelImplCopyWithImpl(
      _$LogLiteModelImpl _value, $Res Function(_$LogLiteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LogLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logID = null,
    Object? dateTime = null,
    Object? transactionNumber = null,
    Object? statusReturn = null,
    Object? statusMessage = null,
  }) {
    return _then(_$LogLiteModelImpl(
      logID: null == logID
          ? _value.logID
          : logID // ignore: cast_nullable_to_non_nullable
              as int,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
      transactionNumber: null == transactionNumber
          ? _value.transactionNumber
          : transactionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      statusReturn: null == statusReturn
          ? _value.statusReturn
          : statusReturn // ignore: cast_nullable_to_non_nullable
              as String,
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogLiteModelImpl implements _LogLiteModel {
  const _$LogLiteModelImpl(
      {@JsonKey(name: 'logID') required this.logID,
      @JsonKey(name: 'dateTime') required this.dateTime,
      @JsonKey(name: 'transactionNumber') required this.transactionNumber,
      @JsonKey(name: 'statusReturn') required this.statusReturn,
      @JsonKey(name: 'statusMessage') required this.statusMessage});

  factory _$LogLiteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogLiteModelImplFromJson(json);

  @override
  @JsonKey(name: 'logID')
  final int logID;
  @override
  @JsonKey(name: 'dateTime')
  final String dateTime;
  @override
  @JsonKey(name: 'transactionNumber')
  final String transactionNumber;
  @override
  @JsonKey(name: 'statusReturn')
  final String statusReturn;
  @override
  @JsonKey(name: 'statusMessage')
  final String statusMessage;

  @override
  String toString() {
    return 'LogLiteModel(logID: $logID, dateTime: $dateTime, transactionNumber: $transactionNumber, statusReturn: $statusReturn, statusMessage: $statusMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogLiteModelImpl &&
            (identical(other.logID, logID) || other.logID == logID) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.transactionNumber, transactionNumber) ||
                other.transactionNumber == transactionNumber) &&
            (identical(other.statusReturn, statusReturn) ||
                other.statusReturn == statusReturn) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, logID, dateTime,
      transactionNumber, statusReturn, statusMessage);

  /// Create a copy of LogLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogLiteModelImplCopyWith<_$LogLiteModelImpl> get copyWith =>
      __$$LogLiteModelImplCopyWithImpl<_$LogLiteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogLiteModelImplToJson(
      this,
    );
  }
}

abstract class _LogLiteModel implements LogLiteModel {
  const factory _LogLiteModel(
      {@JsonKey(name: 'logID') required final int logID,
      @JsonKey(name: 'dateTime') required final String dateTime,
      @JsonKey(name: 'transactionNumber')
      required final String transactionNumber,
      @JsonKey(name: 'statusReturn') required final String statusReturn,
      @JsonKey(name: 'statusMessage')
      required final String statusMessage}) = _$LogLiteModelImpl;

  factory _LogLiteModel.fromJson(Map<String, dynamic> json) =
      _$LogLiteModelImpl.fromJson;

  @override
  @JsonKey(name: 'logID')
  int get logID;
  @override
  @JsonKey(name: 'dateTime')
  String get dateTime;
  @override
  @JsonKey(name: 'transactionNumber')
  String get transactionNumber;
  @override
  @JsonKey(name: 'statusReturn')
  String get statusReturn;
  @override
  @JsonKey(name: 'statusMessage')
  String get statusMessage;

  /// Create a copy of LogLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogLiteModelImplCopyWith<_$LogLiteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
