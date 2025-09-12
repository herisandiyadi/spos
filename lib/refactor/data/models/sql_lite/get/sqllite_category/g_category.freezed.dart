// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'g_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryLiteModel _$CategoryLiteModelFromJson(Map<String, dynamic> json) {
  return _CategoryLiteModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryLiteModel {
  @JsonKey(name: 'categoryID')
  int get categoryID => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoryName')
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoryImage')
  String get categoryImage => throw _privateConstructorUsedError;

  /// Serializes this CategoryLiteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryLiteModelCopyWith<CategoryLiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryLiteModelCopyWith<$Res> {
  factory $CategoryLiteModelCopyWith(
          CategoryLiteModel value, $Res Function(CategoryLiteModel) then) =
      _$CategoryLiteModelCopyWithImpl<$Res, CategoryLiteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'categoryID') int categoryID,
      @JsonKey(name: 'categoryName') String categoryName,
      @JsonKey(name: 'categoryImage') String categoryImage});
}

/// @nodoc
class _$CategoryLiteModelCopyWithImpl<$Res, $Val extends CategoryLiteModel>
    implements $CategoryLiteModelCopyWith<$Res> {
  _$CategoryLiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryID = null,
    Object? categoryName = null,
    Object? categoryImage = null,
  }) {
    return _then(_value.copyWith(
      categoryID: null == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryImage: null == categoryImage
          ? _value.categoryImage
          : categoryImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryLiteModelImplCopyWith<$Res>
    implements $CategoryLiteModelCopyWith<$Res> {
  factory _$$CategoryLiteModelImplCopyWith(_$CategoryLiteModelImpl value,
          $Res Function(_$CategoryLiteModelImpl) then) =
      __$$CategoryLiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'categoryID') int categoryID,
      @JsonKey(name: 'categoryName') String categoryName,
      @JsonKey(name: 'categoryImage') String categoryImage});
}

/// @nodoc
class __$$CategoryLiteModelImplCopyWithImpl<$Res>
    extends _$CategoryLiteModelCopyWithImpl<$Res, _$CategoryLiteModelImpl>
    implements _$$CategoryLiteModelImplCopyWith<$Res> {
  __$$CategoryLiteModelImplCopyWithImpl(_$CategoryLiteModelImpl _value,
      $Res Function(_$CategoryLiteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryID = null,
    Object? categoryName = null,
    Object? categoryImage = null,
  }) {
    return _then(_$CategoryLiteModelImpl(
      categoryID: null == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryImage: null == categoryImage
          ? _value.categoryImage
          : categoryImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryLiteModelImpl implements _CategoryLiteModel {
  const _$CategoryLiteModelImpl(
      {@JsonKey(name: 'categoryID') required this.categoryID,
      @JsonKey(name: 'categoryName') required this.categoryName,
      @JsonKey(name: 'categoryImage') required this.categoryImage});

  factory _$CategoryLiteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryLiteModelImplFromJson(json);

  @override
  @JsonKey(name: 'categoryID')
  final int categoryID;
  @override
  @JsonKey(name: 'categoryName')
  final String categoryName;
  @override
  @JsonKey(name: 'categoryImage')
  final String categoryImage;

  @override
  String toString() {
    return 'CategoryLiteModel(categoryID: $categoryID, categoryName: $categoryName, categoryImage: $categoryImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryLiteModelImpl &&
            (identical(other.categoryID, categoryID) ||
                other.categoryID == categoryID) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryImage, categoryImage) ||
                other.categoryImage == categoryImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, categoryID, categoryName, categoryImage);

  /// Create a copy of CategoryLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryLiteModelImplCopyWith<_$CategoryLiteModelImpl> get copyWith =>
      __$$CategoryLiteModelImplCopyWithImpl<_$CategoryLiteModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryLiteModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryLiteModel implements CategoryLiteModel {
  const factory _CategoryLiteModel(
      {@JsonKey(name: 'categoryID') required final int categoryID,
      @JsonKey(name: 'categoryName') required final String categoryName,
      @JsonKey(name: 'categoryImage')
      required final String categoryImage}) = _$CategoryLiteModelImpl;

  factory _CategoryLiteModel.fromJson(Map<String, dynamic> json) =
      _$CategoryLiteModelImpl.fromJson;

  @override
  @JsonKey(name: 'categoryID')
  int get categoryID;
  @override
  @JsonKey(name: 'categoryName')
  String get categoryName;
  @override
  @JsonKey(name: 'categoryImage')
  String get categoryImage;

  /// Create a copy of CategoryLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryLiteModelImplCopyWith<_$CategoryLiteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
