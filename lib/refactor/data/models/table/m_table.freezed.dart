// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TableModel _$TableModelFromJson(Map<String, dynamic> json) {
  return _TableModel.fromJson(json);
}

/// @nodoc
mixin _$TableModel {
  String get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<TableData> get data => throw _privateConstructorUsedError;

  /// Serializes this TableModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableModelCopyWith<TableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableModelCopyWith<$Res> {
  factory $TableModelCopyWith(
          TableModel value, $Res Function(TableModel) then) =
      _$TableModelCopyWithImpl<$Res, TableModel>;
  @useResult
  $Res call({String status, String? message, List<TableData> data});
}

/// @nodoc
class _$TableModelCopyWithImpl<$Res, $Val extends TableModel>
    implements $TableModelCopyWith<$Res> {
  _$TableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableModel
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
              as List<TableData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TableModelImplCopyWith<$Res>
    implements $TableModelCopyWith<$Res> {
  factory _$$TableModelImplCopyWith(
          _$TableModelImpl value, $Res Function(_$TableModelImpl) then) =
      __$$TableModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String? message, List<TableData> data});
}

/// @nodoc
class __$$TableModelImplCopyWithImpl<$Res>
    extends _$TableModelCopyWithImpl<$Res, _$TableModelImpl>
    implements _$$TableModelImplCopyWith<$Res> {
  __$$TableModelImplCopyWithImpl(
      _$TableModelImpl _value, $Res Function(_$TableModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_$TableModelImpl(
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
              as List<TableData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TableModelImpl implements _TableModel {
  const _$TableModelImpl(
      {required this.status,
      this.message,
      final List<TableData> data = const []})
      : _data = data;

  factory _$TableModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TableModelImplFromJson(json);

  @override
  final String status;
  @override
  final String? message;
  final List<TableData> _data;
  @override
  @JsonKey()
  List<TableData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'TableModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableModelImplCopyWith<_$TableModelImpl> get copyWith =>
      __$$TableModelImplCopyWithImpl<_$TableModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TableModelImplToJson(
      this,
    );
  }
}

abstract class _TableModel implements TableModel {
  const factory _TableModel(
      {required final String status,
      final String? message,
      final List<TableData> data}) = _$TableModelImpl;

  factory _TableModel.fromJson(Map<String, dynamic> json) =
      _$TableModelImpl.fromJson;

  @override
  String get status;
  @override
  String? get message;
  @override
  List<TableData> get data;

  /// Create a copy of TableModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableModelImplCopyWith<_$TableModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TableData _$TableDataFromJson(Map<String, dynamic> json) {
  return _TableData.fromJson(json);
}

/// @nodoc
mixin _$TableData {
  @JsonKey(name: 'TableID')
  String? get tableID => throw _privateConstructorUsedError;
  @JsonKey(name: 'LocationID')
  String? get locationID => throw _privateConstructorUsedError;
  @JsonKey(name: 'TableNumber')
  String? get tableNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'TableLabel')
  String? get tableLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'Seat')
  String? get seat => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_deleted')
  String? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletID')
  String? get outletID => throw _privateConstructorUsedError;
  @JsonKey(name: 'LocationCode')
  String? get locationCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'LocationLabel')
  String? get locationLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletCode')
  String? get outletCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletName')
  String? get outletName => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletAddress')
  String? get outletAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletImage')
  String? get outletImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletOpen')
  String? get outletOpen => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletClose')
  String? get outletClose => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletFB')
  String? get outletFB => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletIG')
  String? get outletIG => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletTIKTOK')
  String? get outletTiktok => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletWeb')
  String? get outletWeb => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApiKey')
  String? get apiKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyCode')
  String? get companyCode => throw _privateConstructorUsedError;

  /// Serializes this TableData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TableData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TableDataCopyWith<TableData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableDataCopyWith<$Res> {
  factory $TableDataCopyWith(TableData value, $Res Function(TableData) then) =
      _$TableDataCopyWithImpl<$Res, TableData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TableID') String? tableID,
      @JsonKey(name: 'LocationID') String? locationID,
      @JsonKey(name: 'TableNumber') String? tableNumber,
      @JsonKey(name: 'TableLabel') String? tableLabel,
      @JsonKey(name: 'Seat') String? seat,
      @JsonKey(name: 'is_deleted') String? isDeleted,
      @JsonKey(name: 'OutletID') String? outletID,
      @JsonKey(name: 'LocationCode') String? locationCode,
      @JsonKey(name: 'LocationLabel') String? locationLabel,
      @JsonKey(name: 'OutletCode') String? outletCode,
      @JsonKey(name: 'OutletName') String? outletName,
      @JsonKey(name: 'OutletAddress') String? outletAddress,
      @JsonKey(name: 'OutletImage') String? outletImage,
      @JsonKey(name: 'OutletOpen') String? outletOpen,
      @JsonKey(name: 'OutletClose') String? outletClose,
      @JsonKey(name: 'OutletFB') String? outletFB,
      @JsonKey(name: 'OutletIG') String? outletIG,
      @JsonKey(name: 'OutletTIKTOK') String? outletTiktok,
      @JsonKey(name: 'OutletWeb') String? outletWeb,
      @JsonKey(name: 'ApiKey') String? apiKey,
      @JsonKey(name: 'CompanyCode') String? companyCode});
}

/// @nodoc
class _$TableDataCopyWithImpl<$Res, $Val extends TableData>
    implements $TableDataCopyWith<$Res> {
  _$TableDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TableData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableID = freezed,
    Object? locationID = freezed,
    Object? tableNumber = freezed,
    Object? tableLabel = freezed,
    Object? seat = freezed,
    Object? isDeleted = freezed,
    Object? outletID = freezed,
    Object? locationCode = freezed,
    Object? locationLabel = freezed,
    Object? outletCode = freezed,
    Object? outletName = freezed,
    Object? outletAddress = freezed,
    Object? outletImage = freezed,
    Object? outletOpen = freezed,
    Object? outletClose = freezed,
    Object? outletFB = freezed,
    Object? outletIG = freezed,
    Object? outletTiktok = freezed,
    Object? outletWeb = freezed,
    Object? apiKey = freezed,
    Object? companyCode = freezed,
  }) {
    return _then(_value.copyWith(
      tableID: freezed == tableID
          ? _value.tableID
          : tableID // ignore: cast_nullable_to_non_nullable
              as String?,
      locationID: freezed == locationID
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as String?,
      tableNumber: freezed == tableNumber
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      tableLabel: freezed == tableLabel
          ? _value.tableLabel
          : tableLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      seat: freezed == seat
          ? _value.seat
          : seat // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as String?,
      outletID: freezed == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as String?,
      locationCode: freezed == locationCode
          ? _value.locationCode
          : locationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      locationLabel: freezed == locationLabel
          ? _value.locationLabel
          : locationLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      outletCode: freezed == outletCode
          ? _value.outletCode
          : outletCode // ignore: cast_nullable_to_non_nullable
              as String?,
      outletName: freezed == outletName
          ? _value.outletName
          : outletName // ignore: cast_nullable_to_non_nullable
              as String?,
      outletAddress: freezed == outletAddress
          ? _value.outletAddress
          : outletAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      outletImage: freezed == outletImage
          ? _value.outletImage
          : outletImage // ignore: cast_nullable_to_non_nullable
              as String?,
      outletOpen: freezed == outletOpen
          ? _value.outletOpen
          : outletOpen // ignore: cast_nullable_to_non_nullable
              as String?,
      outletClose: freezed == outletClose
          ? _value.outletClose
          : outletClose // ignore: cast_nullable_to_non_nullable
              as String?,
      outletFB: freezed == outletFB
          ? _value.outletFB
          : outletFB // ignore: cast_nullable_to_non_nullable
              as String?,
      outletIG: freezed == outletIG
          ? _value.outletIG
          : outletIG // ignore: cast_nullable_to_non_nullable
              as String?,
      outletTiktok: freezed == outletTiktok
          ? _value.outletTiktok
          : outletTiktok // ignore: cast_nullable_to_non_nullable
              as String?,
      outletWeb: freezed == outletWeb
          ? _value.outletWeb
          : outletWeb // ignore: cast_nullable_to_non_nullable
              as String?,
      apiKey: freezed == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String?,
      companyCode: freezed == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TableDataImplCopyWith<$Res>
    implements $TableDataCopyWith<$Res> {
  factory _$$TableDataImplCopyWith(
          _$TableDataImpl value, $Res Function(_$TableDataImpl) then) =
      __$$TableDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TableID') String? tableID,
      @JsonKey(name: 'LocationID') String? locationID,
      @JsonKey(name: 'TableNumber') String? tableNumber,
      @JsonKey(name: 'TableLabel') String? tableLabel,
      @JsonKey(name: 'Seat') String? seat,
      @JsonKey(name: 'is_deleted') String? isDeleted,
      @JsonKey(name: 'OutletID') String? outletID,
      @JsonKey(name: 'LocationCode') String? locationCode,
      @JsonKey(name: 'LocationLabel') String? locationLabel,
      @JsonKey(name: 'OutletCode') String? outletCode,
      @JsonKey(name: 'OutletName') String? outletName,
      @JsonKey(name: 'OutletAddress') String? outletAddress,
      @JsonKey(name: 'OutletImage') String? outletImage,
      @JsonKey(name: 'OutletOpen') String? outletOpen,
      @JsonKey(name: 'OutletClose') String? outletClose,
      @JsonKey(name: 'OutletFB') String? outletFB,
      @JsonKey(name: 'OutletIG') String? outletIG,
      @JsonKey(name: 'OutletTIKTOK') String? outletTiktok,
      @JsonKey(name: 'OutletWeb') String? outletWeb,
      @JsonKey(name: 'ApiKey') String? apiKey,
      @JsonKey(name: 'CompanyCode') String? companyCode});
}

/// @nodoc
class __$$TableDataImplCopyWithImpl<$Res>
    extends _$TableDataCopyWithImpl<$Res, _$TableDataImpl>
    implements _$$TableDataImplCopyWith<$Res> {
  __$$TableDataImplCopyWithImpl(
      _$TableDataImpl _value, $Res Function(_$TableDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TableData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableID = freezed,
    Object? locationID = freezed,
    Object? tableNumber = freezed,
    Object? tableLabel = freezed,
    Object? seat = freezed,
    Object? isDeleted = freezed,
    Object? outletID = freezed,
    Object? locationCode = freezed,
    Object? locationLabel = freezed,
    Object? outletCode = freezed,
    Object? outletName = freezed,
    Object? outletAddress = freezed,
    Object? outletImage = freezed,
    Object? outletOpen = freezed,
    Object? outletClose = freezed,
    Object? outletFB = freezed,
    Object? outletIG = freezed,
    Object? outletTiktok = freezed,
    Object? outletWeb = freezed,
    Object? apiKey = freezed,
    Object? companyCode = freezed,
  }) {
    return _then(_$TableDataImpl(
      tableID: freezed == tableID
          ? _value.tableID
          : tableID // ignore: cast_nullable_to_non_nullable
              as String?,
      locationID: freezed == locationID
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as String?,
      tableNumber: freezed == tableNumber
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      tableLabel: freezed == tableLabel
          ? _value.tableLabel
          : tableLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      seat: freezed == seat
          ? _value.seat
          : seat // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as String?,
      outletID: freezed == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as String?,
      locationCode: freezed == locationCode
          ? _value.locationCode
          : locationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      locationLabel: freezed == locationLabel
          ? _value.locationLabel
          : locationLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      outletCode: freezed == outletCode
          ? _value.outletCode
          : outletCode // ignore: cast_nullable_to_non_nullable
              as String?,
      outletName: freezed == outletName
          ? _value.outletName
          : outletName // ignore: cast_nullable_to_non_nullable
              as String?,
      outletAddress: freezed == outletAddress
          ? _value.outletAddress
          : outletAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      outletImage: freezed == outletImage
          ? _value.outletImage
          : outletImage // ignore: cast_nullable_to_non_nullable
              as String?,
      outletOpen: freezed == outletOpen
          ? _value.outletOpen
          : outletOpen // ignore: cast_nullable_to_non_nullable
              as String?,
      outletClose: freezed == outletClose
          ? _value.outletClose
          : outletClose // ignore: cast_nullable_to_non_nullable
              as String?,
      outletFB: freezed == outletFB
          ? _value.outletFB
          : outletFB // ignore: cast_nullable_to_non_nullable
              as String?,
      outletIG: freezed == outletIG
          ? _value.outletIG
          : outletIG // ignore: cast_nullable_to_non_nullable
              as String?,
      outletTiktok: freezed == outletTiktok
          ? _value.outletTiktok
          : outletTiktok // ignore: cast_nullable_to_non_nullable
              as String?,
      outletWeb: freezed == outletWeb
          ? _value.outletWeb
          : outletWeb // ignore: cast_nullable_to_non_nullable
              as String?,
      apiKey: freezed == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
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
class _$TableDataImpl implements _TableData {
  const _$TableDataImpl(
      {@JsonKey(name: 'TableID') this.tableID,
      @JsonKey(name: 'LocationID') this.locationID,
      @JsonKey(name: 'TableNumber') this.tableNumber,
      @JsonKey(name: 'TableLabel') this.tableLabel,
      @JsonKey(name: 'Seat') this.seat,
      @JsonKey(name: 'is_deleted') this.isDeleted,
      @JsonKey(name: 'OutletID') this.outletID,
      @JsonKey(name: 'LocationCode') this.locationCode,
      @JsonKey(name: 'LocationLabel') this.locationLabel,
      @JsonKey(name: 'OutletCode') this.outletCode,
      @JsonKey(name: 'OutletName') this.outletName,
      @JsonKey(name: 'OutletAddress') this.outletAddress,
      @JsonKey(name: 'OutletImage') this.outletImage,
      @JsonKey(name: 'OutletOpen') this.outletOpen,
      @JsonKey(name: 'OutletClose') this.outletClose,
      @JsonKey(name: 'OutletFB') this.outletFB,
      @JsonKey(name: 'OutletIG') this.outletIG,
      @JsonKey(name: 'OutletTIKTOK') this.outletTiktok,
      @JsonKey(name: 'OutletWeb') this.outletWeb,
      @JsonKey(name: 'ApiKey') this.apiKey,
      @JsonKey(name: 'CompanyCode') this.companyCode});

  factory _$TableDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TableDataImplFromJson(json);

  @override
  @JsonKey(name: 'TableID')
  final String? tableID;
  @override
  @JsonKey(name: 'LocationID')
  final String? locationID;
  @override
  @JsonKey(name: 'TableNumber')
  final String? tableNumber;
  @override
  @JsonKey(name: 'TableLabel')
  final String? tableLabel;
  @override
  @JsonKey(name: 'Seat')
  final String? seat;
  @override
  @JsonKey(name: 'is_deleted')
  final String? isDeleted;
  @override
  @JsonKey(name: 'OutletID')
  final String? outletID;
  @override
  @JsonKey(name: 'LocationCode')
  final String? locationCode;
  @override
  @JsonKey(name: 'LocationLabel')
  final String? locationLabel;
  @override
  @JsonKey(name: 'OutletCode')
  final String? outletCode;
  @override
  @JsonKey(name: 'OutletName')
  final String? outletName;
  @override
  @JsonKey(name: 'OutletAddress')
  final String? outletAddress;
  @override
  @JsonKey(name: 'OutletImage')
  final String? outletImage;
  @override
  @JsonKey(name: 'OutletOpen')
  final String? outletOpen;
  @override
  @JsonKey(name: 'OutletClose')
  final String? outletClose;
  @override
  @JsonKey(name: 'OutletFB')
  final String? outletFB;
  @override
  @JsonKey(name: 'OutletIG')
  final String? outletIG;
  @override
  @JsonKey(name: 'OutletTIKTOK')
  final String? outletTiktok;
  @override
  @JsonKey(name: 'OutletWeb')
  final String? outletWeb;
  @override
  @JsonKey(name: 'ApiKey')
  final String? apiKey;
  @override
  @JsonKey(name: 'CompanyCode')
  final String? companyCode;

  @override
  String toString() {
    return 'TableData(tableID: $tableID, locationID: $locationID, tableNumber: $tableNumber, tableLabel: $tableLabel, seat: $seat, isDeleted: $isDeleted, outletID: $outletID, locationCode: $locationCode, locationLabel: $locationLabel, outletCode: $outletCode, outletName: $outletName, outletAddress: $outletAddress, outletImage: $outletImage, outletOpen: $outletOpen, outletClose: $outletClose, outletFB: $outletFB, outletIG: $outletIG, outletTiktok: $outletTiktok, outletWeb: $outletWeb, apiKey: $apiKey, companyCode: $companyCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableDataImpl &&
            (identical(other.tableID, tableID) || other.tableID == tableID) &&
            (identical(other.locationID, locationID) ||
                other.locationID == locationID) &&
            (identical(other.tableNumber, tableNumber) ||
                other.tableNumber == tableNumber) &&
            (identical(other.tableLabel, tableLabel) ||
                other.tableLabel == tableLabel) &&
            (identical(other.seat, seat) || other.seat == seat) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.outletID, outletID) ||
                other.outletID == outletID) &&
            (identical(other.locationCode, locationCode) ||
                other.locationCode == locationCode) &&
            (identical(other.locationLabel, locationLabel) ||
                other.locationLabel == locationLabel) &&
            (identical(other.outletCode, outletCode) ||
                other.outletCode == outletCode) &&
            (identical(other.outletName, outletName) ||
                other.outletName == outletName) &&
            (identical(other.outletAddress, outletAddress) ||
                other.outletAddress == outletAddress) &&
            (identical(other.outletImage, outletImage) ||
                other.outletImage == outletImage) &&
            (identical(other.outletOpen, outletOpen) ||
                other.outletOpen == outletOpen) &&
            (identical(other.outletClose, outletClose) ||
                other.outletClose == outletClose) &&
            (identical(other.outletFB, outletFB) ||
                other.outletFB == outletFB) &&
            (identical(other.outletIG, outletIG) ||
                other.outletIG == outletIG) &&
            (identical(other.outletTiktok, outletTiktok) ||
                other.outletTiktok == outletTiktok) &&
            (identical(other.outletWeb, outletWeb) ||
                other.outletWeb == outletWeb) &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.companyCode, companyCode) ||
                other.companyCode == companyCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        tableID,
        locationID,
        tableNumber,
        tableLabel,
        seat,
        isDeleted,
        outletID,
        locationCode,
        locationLabel,
        outletCode,
        outletName,
        outletAddress,
        outletImage,
        outletOpen,
        outletClose,
        outletFB,
        outletIG,
        outletTiktok,
        outletWeb,
        apiKey,
        companyCode
      ]);

  /// Create a copy of TableData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TableDataImplCopyWith<_$TableDataImpl> get copyWith =>
      __$$TableDataImplCopyWithImpl<_$TableDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TableDataImplToJson(
      this,
    );
  }
}

abstract class _TableData implements TableData {
  const factory _TableData(
          {@JsonKey(name: 'TableID') final String? tableID,
          @JsonKey(name: 'LocationID') final String? locationID,
          @JsonKey(name: 'TableNumber') final String? tableNumber,
          @JsonKey(name: 'TableLabel') final String? tableLabel,
          @JsonKey(name: 'Seat') final String? seat,
          @JsonKey(name: 'is_deleted') final String? isDeleted,
          @JsonKey(name: 'OutletID') final String? outletID,
          @JsonKey(name: 'LocationCode') final String? locationCode,
          @JsonKey(name: 'LocationLabel') final String? locationLabel,
          @JsonKey(name: 'OutletCode') final String? outletCode,
          @JsonKey(name: 'OutletName') final String? outletName,
          @JsonKey(name: 'OutletAddress') final String? outletAddress,
          @JsonKey(name: 'OutletImage') final String? outletImage,
          @JsonKey(name: 'OutletOpen') final String? outletOpen,
          @JsonKey(name: 'OutletClose') final String? outletClose,
          @JsonKey(name: 'OutletFB') final String? outletFB,
          @JsonKey(name: 'OutletIG') final String? outletIG,
          @JsonKey(name: 'OutletTIKTOK') final String? outletTiktok,
          @JsonKey(name: 'OutletWeb') final String? outletWeb,
          @JsonKey(name: 'ApiKey') final String? apiKey,
          @JsonKey(name: 'CompanyCode') final String? companyCode}) =
      _$TableDataImpl;

  factory _TableData.fromJson(Map<String, dynamic> json) =
      _$TableDataImpl.fromJson;

  @override
  @JsonKey(name: 'TableID')
  String? get tableID;
  @override
  @JsonKey(name: 'LocationID')
  String? get locationID;
  @override
  @JsonKey(name: 'TableNumber')
  String? get tableNumber;
  @override
  @JsonKey(name: 'TableLabel')
  String? get tableLabel;
  @override
  @JsonKey(name: 'Seat')
  String? get seat;
  @override
  @JsonKey(name: 'is_deleted')
  String? get isDeleted;
  @override
  @JsonKey(name: 'OutletID')
  String? get outletID;
  @override
  @JsonKey(name: 'LocationCode')
  String? get locationCode;
  @override
  @JsonKey(name: 'LocationLabel')
  String? get locationLabel;
  @override
  @JsonKey(name: 'OutletCode')
  String? get outletCode;
  @override
  @JsonKey(name: 'OutletName')
  String? get outletName;
  @override
  @JsonKey(name: 'OutletAddress')
  String? get outletAddress;
  @override
  @JsonKey(name: 'OutletImage')
  String? get outletImage;
  @override
  @JsonKey(name: 'OutletOpen')
  String? get outletOpen;
  @override
  @JsonKey(name: 'OutletClose')
  String? get outletClose;
  @override
  @JsonKey(name: 'OutletFB')
  String? get outletFB;
  @override
  @JsonKey(name: 'OutletIG')
  String? get outletIG;
  @override
  @JsonKey(name: 'OutletTIKTOK')
  String? get outletTiktok;
  @override
  @JsonKey(name: 'OutletWeb')
  String? get outletWeb;
  @override
  @JsonKey(name: 'ApiKey')
  String? get apiKey;
  @override
  @JsonKey(name: 'CompanyCode')
  String? get companyCode;

  /// Create a copy of TableData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TableDataImplCopyWith<_$TableDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
