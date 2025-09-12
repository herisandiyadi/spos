// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  String get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<CategoryData> get data => throw _privateConstructorUsedError;

  /// Serializes this CategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) then) =
      _$CategoryModelCopyWithImpl<$Res, CategoryModel>;
  @useResult
  $Res call({String status, String? message, List<CategoryData> data});
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res, $Val extends CategoryModel>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryModel
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
              as List<CategoryData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryModelImplCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$CategoryModelImplCopyWith(
          _$CategoryModelImpl value, $Res Function(_$CategoryModelImpl) then) =
      __$$CategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String? message, List<CategoryData> data});
}

/// @nodoc
class __$$CategoryModelImplCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res, _$CategoryModelImpl>
    implements _$$CategoryModelImplCopyWith<$Res> {
  __$$CategoryModelImplCopyWithImpl(
      _$CategoryModelImpl _value, $Res Function(_$CategoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_$CategoryModelImpl(
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
              as List<CategoryData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryModelImpl implements _CategoryModel {
  const _$CategoryModelImpl(
      {required this.status,
      this.message,
      final List<CategoryData> data = const []})
      : _data = data;

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  @override
  final String status;
  @override
  final String? message;
  final List<CategoryData> _data;
  @override
  @JsonKey()
  List<CategoryData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CategoryModel(status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(_data));

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      __$$CategoryModelImplCopyWithImpl<_$CategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryModel implements CategoryModel {
  const factory _CategoryModel(
      {required final String status,
      final String? message,
      final List<CategoryData> data}) = _$CategoryModelImpl;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  String get status;
  @override
  String? get message;
  @override
  List<CategoryData> get data;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) {
  return _CategoryData.fromJson(json);
}

/// @nodoc
mixin _$CategoryData {
  @JsonKey(name: 'CategoryID')
  String? get categoryID => throw _privateConstructorUsedError;
  @JsonKey(name: 'CategoryName')
  String? get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'CategoryImage')
  String? get categoryImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutletID')
  String? get outletID => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyCode')
  String? get companyCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_deleted')
  String? get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShowPOS')
  String? get showPOS => throw _privateConstructorUsedError;

  /// Serializes this CategoryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryDataCopyWith<CategoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDataCopyWith<$Res> {
  factory $CategoryDataCopyWith(
          CategoryData value, $Res Function(CategoryData) then) =
      _$CategoryDataCopyWithImpl<$Res, CategoryData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CategoryID') String? categoryID,
      @JsonKey(name: 'CategoryName') String? categoryName,
      @JsonKey(name: 'CategoryImage') String? categoryImage,
      @JsonKey(name: 'OutletID') String? outletID,
      @JsonKey(name: 'CompanyCode') String? companyCode,
      @JsonKey(name: 'is_deleted') String? isDeleted,
      @JsonKey(name: 'ShowPOS') String? showPOS});
}

/// @nodoc
class _$CategoryDataCopyWithImpl<$Res, $Val extends CategoryData>
    implements $CategoryDataCopyWith<$Res> {
  _$CategoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryID = freezed,
    Object? categoryName = freezed,
    Object? categoryImage = freezed,
    Object? outletID = freezed,
    Object? companyCode = freezed,
    Object? isDeleted = freezed,
    Object? showPOS = freezed,
  }) {
    return _then(_value.copyWith(
      categoryID: freezed == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryImage: freezed == categoryImage
          ? _value.categoryImage
          : categoryImage // ignore: cast_nullable_to_non_nullable
              as String?,
      outletID: freezed == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as String?,
      companyCode: freezed == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as String?,
      showPOS: freezed == showPOS
          ? _value.showPOS
          : showPOS // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryDataImplCopyWith<$Res>
    implements $CategoryDataCopyWith<$Res> {
  factory _$$CategoryDataImplCopyWith(
          _$CategoryDataImpl value, $Res Function(_$CategoryDataImpl) then) =
      __$$CategoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CategoryID') String? categoryID,
      @JsonKey(name: 'CategoryName') String? categoryName,
      @JsonKey(name: 'CategoryImage') String? categoryImage,
      @JsonKey(name: 'OutletID') String? outletID,
      @JsonKey(name: 'CompanyCode') String? companyCode,
      @JsonKey(name: 'is_deleted') String? isDeleted,
      @JsonKey(name: 'ShowPOS') String? showPOS});
}

/// @nodoc
class __$$CategoryDataImplCopyWithImpl<$Res>
    extends _$CategoryDataCopyWithImpl<$Res, _$CategoryDataImpl>
    implements _$$CategoryDataImplCopyWith<$Res> {
  __$$CategoryDataImplCopyWithImpl(
      _$CategoryDataImpl _value, $Res Function(_$CategoryDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryID = freezed,
    Object? categoryName = freezed,
    Object? categoryImage = freezed,
    Object? outletID = freezed,
    Object? companyCode = freezed,
    Object? isDeleted = freezed,
    Object? showPOS = freezed,
  }) {
    return _then(_$CategoryDataImpl(
      categoryID: freezed == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryImage: freezed == categoryImage
          ? _value.categoryImage
          : categoryImage // ignore: cast_nullable_to_non_nullable
              as String?,
      outletID: freezed == outletID
          ? _value.outletID
          : outletID // ignore: cast_nullable_to_non_nullable
              as String?,
      companyCode: freezed == companyCode
          ? _value.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as String?,
      showPOS: freezed == showPOS
          ? _value.showPOS
          : showPOS // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryDataImpl implements _CategoryData {
  const _$CategoryDataImpl(
      {@JsonKey(name: 'CategoryID') this.categoryID,
      @JsonKey(name: 'CategoryName') this.categoryName,
      @JsonKey(name: 'CategoryImage') this.categoryImage,
      @JsonKey(name: 'OutletID') this.outletID,
      @JsonKey(name: 'CompanyCode') this.companyCode,
      @JsonKey(name: 'is_deleted') this.isDeleted,
      @JsonKey(name: 'ShowPOS') this.showPOS});

  factory _$CategoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryDataImplFromJson(json);

  @override
  @JsonKey(name: 'CategoryID')
  final String? categoryID;
  @override
  @JsonKey(name: 'CategoryName')
  final String? categoryName;
  @override
  @JsonKey(name: 'CategoryImage')
  final String? categoryImage;
  @override
  @JsonKey(name: 'OutletID')
  final String? outletID;
  @override
  @JsonKey(name: 'CompanyCode')
  final String? companyCode;
  @override
  @JsonKey(name: 'is_deleted')
  final String? isDeleted;
  @override
  @JsonKey(name: 'ShowPOS')
  final String? showPOS;

  @override
  String toString() {
    return 'CategoryData(categoryID: $categoryID, categoryName: $categoryName, categoryImage: $categoryImage, outletID: $outletID, companyCode: $companyCode, isDeleted: $isDeleted, showPOS: $showPOS)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryDataImpl &&
            (identical(other.categoryID, categoryID) ||
                other.categoryID == categoryID) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryImage, categoryImage) ||
                other.categoryImage == categoryImage) &&
            (identical(other.outletID, outletID) ||
                other.outletID == outletID) &&
            (identical(other.companyCode, companyCode) ||
                other.companyCode == companyCode) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.showPOS, showPOS) || other.showPOS == showPOS));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, categoryID, categoryName,
      categoryImage, outletID, companyCode, isDeleted, showPOS);

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryDataImplCopyWith<_$CategoryDataImpl> get copyWith =>
      __$$CategoryDataImplCopyWithImpl<_$CategoryDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryDataImplToJson(
      this,
    );
  }
}

abstract class _CategoryData implements CategoryData {
  const factory _CategoryData(
      {@JsonKey(name: 'CategoryID') final String? categoryID,
      @JsonKey(name: 'CategoryName') final String? categoryName,
      @JsonKey(name: 'CategoryImage') final String? categoryImage,
      @JsonKey(name: 'OutletID') final String? outletID,
      @JsonKey(name: 'CompanyCode') final String? companyCode,
      @JsonKey(name: 'is_deleted') final String? isDeleted,
      @JsonKey(name: 'ShowPOS') final String? showPOS}) = _$CategoryDataImpl;

  factory _CategoryData.fromJson(Map<String, dynamic> json) =
      _$CategoryDataImpl.fromJson;

  @override
  @JsonKey(name: 'CategoryID')
  String? get categoryID;
  @override
  @JsonKey(name: 'CategoryName')
  String? get categoryName;
  @override
  @JsonKey(name: 'CategoryImage')
  String? get categoryImage;
  @override
  @JsonKey(name: 'OutletID')
  String? get outletID;
  @override
  @JsonKey(name: 'CompanyCode')
  String? get companyCode;
  @override
  @JsonKey(name: 'is_deleted')
  String? get isDeleted;
  @override
  @JsonKey(name: 'ShowPOS')
  String? get showPOS;

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryDataImplCopyWith<_$CategoryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
