// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'g_menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MenuLiteModel _$MenuLiteModelFromJson(Map<String, dynamic> json) {
  return _MenuLiteModel.fromJson(json);
}

/// @nodoc
mixin _$MenuLiteModel {
  @JsonKey(name: 'menuID')
  int get menuID => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuCode')
  String get menuCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuImage')
  String get menuImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoryID')
  int get categoryID => throw _privateConstructorUsedError;
  @JsonKey(name: 'stationID')
  int get stationID => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuName')
  String get menuName => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuDesc')
  String get menuDesc => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuPrice')
  int get menuPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuDiscount')
  int get menuDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuType')
  String get menuType => throw _privateConstructorUsedError;
  @JsonKey(name: 'addOn')
  String? get addOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'noteOption')
  String? get noteOption => throw _privateConstructorUsedError;
  @JsonKey(name: 'arrange')
  int get arrange => throw _privateConstructorUsedError;

  /// Serializes this MenuLiteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuLiteModelCopyWith<MenuLiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuLiteModelCopyWith<$Res> {
  factory $MenuLiteModelCopyWith(
          MenuLiteModel value, $Res Function(MenuLiteModel) then) =
      _$MenuLiteModelCopyWithImpl<$Res, MenuLiteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'menuID') int menuID,
      @JsonKey(name: 'menuCode') String menuCode,
      @JsonKey(name: 'menuImage') String menuImage,
      @JsonKey(name: 'categoryID') int categoryID,
      @JsonKey(name: 'stationID') int stationID,
      @JsonKey(name: 'menuName') String menuName,
      @JsonKey(name: 'menuDesc') String menuDesc,
      @JsonKey(name: 'menuPrice') int menuPrice,
      @JsonKey(name: 'menuDiscount') int menuDiscount,
      @JsonKey(name: 'menuType') String menuType,
      @JsonKey(name: 'addOn') String? addOn,
      @JsonKey(name: 'noteOption') String? noteOption,
      @JsonKey(name: 'arrange') int arrange});
}

/// @nodoc
class _$MenuLiteModelCopyWithImpl<$Res, $Val extends MenuLiteModel>
    implements $MenuLiteModelCopyWith<$Res> {
  _$MenuLiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuID = null,
    Object? menuCode = null,
    Object? menuImage = null,
    Object? categoryID = null,
    Object? stationID = null,
    Object? menuName = null,
    Object? menuDesc = null,
    Object? menuPrice = null,
    Object? menuDiscount = null,
    Object? menuType = null,
    Object? addOn = freezed,
    Object? noteOption = freezed,
    Object? arrange = null,
  }) {
    return _then(_value.copyWith(
      menuID: null == menuID
          ? _value.menuID
          : menuID // ignore: cast_nullable_to_non_nullable
              as int,
      menuCode: null == menuCode
          ? _value.menuCode
          : menuCode // ignore: cast_nullable_to_non_nullable
              as String,
      menuImage: null == menuImage
          ? _value.menuImage
          : menuImage // ignore: cast_nullable_to_non_nullable
              as String,
      categoryID: null == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as int,
      stationID: null == stationID
          ? _value.stationID
          : stationID // ignore: cast_nullable_to_non_nullable
              as int,
      menuName: null == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String,
      menuDesc: null == menuDesc
          ? _value.menuDesc
          : menuDesc // ignore: cast_nullable_to_non_nullable
              as String,
      menuPrice: null == menuPrice
          ? _value.menuPrice
          : menuPrice // ignore: cast_nullable_to_non_nullable
              as int,
      menuDiscount: null == menuDiscount
          ? _value.menuDiscount
          : menuDiscount // ignore: cast_nullable_to_non_nullable
              as int,
      menuType: null == menuType
          ? _value.menuType
          : menuType // ignore: cast_nullable_to_non_nullable
              as String,
      addOn: freezed == addOn
          ? _value.addOn
          : addOn // ignore: cast_nullable_to_non_nullable
              as String?,
      noteOption: freezed == noteOption
          ? _value.noteOption
          : noteOption // ignore: cast_nullable_to_non_nullable
              as String?,
      arrange: null == arrange
          ? _value.arrange
          : arrange // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuLiteModelImplCopyWith<$Res>
    implements $MenuLiteModelCopyWith<$Res> {
  factory _$$MenuLiteModelImplCopyWith(
          _$MenuLiteModelImpl value, $Res Function(_$MenuLiteModelImpl) then) =
      __$$MenuLiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'menuID') int menuID,
      @JsonKey(name: 'menuCode') String menuCode,
      @JsonKey(name: 'menuImage') String menuImage,
      @JsonKey(name: 'categoryID') int categoryID,
      @JsonKey(name: 'stationID') int stationID,
      @JsonKey(name: 'menuName') String menuName,
      @JsonKey(name: 'menuDesc') String menuDesc,
      @JsonKey(name: 'menuPrice') int menuPrice,
      @JsonKey(name: 'menuDiscount') int menuDiscount,
      @JsonKey(name: 'menuType') String menuType,
      @JsonKey(name: 'addOn') String? addOn,
      @JsonKey(name: 'noteOption') String? noteOption,
      @JsonKey(name: 'arrange') int arrange});
}

/// @nodoc
class __$$MenuLiteModelImplCopyWithImpl<$Res>
    extends _$MenuLiteModelCopyWithImpl<$Res, _$MenuLiteModelImpl>
    implements _$$MenuLiteModelImplCopyWith<$Res> {
  __$$MenuLiteModelImplCopyWithImpl(
      _$MenuLiteModelImpl _value, $Res Function(_$MenuLiteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menuID = null,
    Object? menuCode = null,
    Object? menuImage = null,
    Object? categoryID = null,
    Object? stationID = null,
    Object? menuName = null,
    Object? menuDesc = null,
    Object? menuPrice = null,
    Object? menuDiscount = null,
    Object? menuType = null,
    Object? addOn = freezed,
    Object? noteOption = freezed,
    Object? arrange = null,
  }) {
    return _then(_$MenuLiteModelImpl(
      menuID: null == menuID
          ? _value.menuID
          : menuID // ignore: cast_nullable_to_non_nullable
              as int,
      menuCode: null == menuCode
          ? _value.menuCode
          : menuCode // ignore: cast_nullable_to_non_nullable
              as String,
      menuImage: null == menuImage
          ? _value.menuImage
          : menuImage // ignore: cast_nullable_to_non_nullable
              as String,
      categoryID: null == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as int,
      stationID: null == stationID
          ? _value.stationID
          : stationID // ignore: cast_nullable_to_non_nullable
              as int,
      menuName: null == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String,
      menuDesc: null == menuDesc
          ? _value.menuDesc
          : menuDesc // ignore: cast_nullable_to_non_nullable
              as String,
      menuPrice: null == menuPrice
          ? _value.menuPrice
          : menuPrice // ignore: cast_nullable_to_non_nullable
              as int,
      menuDiscount: null == menuDiscount
          ? _value.menuDiscount
          : menuDiscount // ignore: cast_nullable_to_non_nullable
              as int,
      menuType: null == menuType
          ? _value.menuType
          : menuType // ignore: cast_nullable_to_non_nullable
              as String,
      addOn: freezed == addOn
          ? _value.addOn
          : addOn // ignore: cast_nullable_to_non_nullable
              as String?,
      noteOption: freezed == noteOption
          ? _value.noteOption
          : noteOption // ignore: cast_nullable_to_non_nullable
              as String?,
      arrange: null == arrange
          ? _value.arrange
          : arrange // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuLiteModelImpl implements _MenuLiteModel {
  const _$MenuLiteModelImpl(
      {@JsonKey(name: 'menuID') required this.menuID,
      @JsonKey(name: 'menuCode') required this.menuCode,
      @JsonKey(name: 'menuImage') required this.menuImage,
      @JsonKey(name: 'categoryID') required this.categoryID,
      @JsonKey(name: 'stationID') required this.stationID,
      @JsonKey(name: 'menuName') required this.menuName,
      @JsonKey(name: 'menuDesc') required this.menuDesc,
      @JsonKey(name: 'menuPrice') required this.menuPrice,
      @JsonKey(name: 'menuDiscount') required this.menuDiscount,
      @JsonKey(name: 'menuType') required this.menuType,
      @JsonKey(name: 'addOn') this.addOn,
      @JsonKey(name: 'noteOption') this.noteOption,
      @JsonKey(name: 'arrange') required this.arrange});

  factory _$MenuLiteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuLiteModelImplFromJson(json);

  @override
  @JsonKey(name: 'menuID')
  final int menuID;
  @override
  @JsonKey(name: 'menuCode')
  final String menuCode;
  @override
  @JsonKey(name: 'menuImage')
  final String menuImage;
  @override
  @JsonKey(name: 'categoryID')
  final int categoryID;
  @override
  @JsonKey(name: 'stationID')
  final int stationID;
  @override
  @JsonKey(name: 'menuName')
  final String menuName;
  @override
  @JsonKey(name: 'menuDesc')
  final String menuDesc;
  @override
  @JsonKey(name: 'menuPrice')
  final int menuPrice;
  @override
  @JsonKey(name: 'menuDiscount')
  final int menuDiscount;
  @override
  @JsonKey(name: 'menuType')
  final String menuType;
  @override
  @JsonKey(name: 'addOn')
  final String? addOn;
  @override
  @JsonKey(name: 'noteOption')
  final String? noteOption;
  @override
  @JsonKey(name: 'arrange')
  final int arrange;

  @override
  String toString() {
    return 'MenuLiteModel(menuID: $menuID, menuCode: $menuCode, menuImage: $menuImage, categoryID: $categoryID, stationID: $stationID, menuName: $menuName, menuDesc: $menuDesc, menuPrice: $menuPrice, menuDiscount: $menuDiscount, menuType: $menuType, addOn: $addOn, noteOption: $noteOption, arrange: $arrange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuLiteModelImpl &&
            (identical(other.menuID, menuID) || other.menuID == menuID) &&
            (identical(other.menuCode, menuCode) ||
                other.menuCode == menuCode) &&
            (identical(other.menuImage, menuImage) ||
                other.menuImage == menuImage) &&
            (identical(other.categoryID, categoryID) ||
                other.categoryID == categoryID) &&
            (identical(other.stationID, stationID) ||
                other.stationID == stationID) &&
            (identical(other.menuName, menuName) ||
                other.menuName == menuName) &&
            (identical(other.menuDesc, menuDesc) ||
                other.menuDesc == menuDesc) &&
            (identical(other.menuPrice, menuPrice) ||
                other.menuPrice == menuPrice) &&
            (identical(other.menuDiscount, menuDiscount) ||
                other.menuDiscount == menuDiscount) &&
            (identical(other.menuType, menuType) ||
                other.menuType == menuType) &&
            (identical(other.addOn, addOn) || other.addOn == addOn) &&
            (identical(other.noteOption, noteOption) ||
                other.noteOption == noteOption) &&
            (identical(other.arrange, arrange) || other.arrange == arrange));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      menuID,
      menuCode,
      menuImage,
      categoryID,
      stationID,
      menuName,
      menuDesc,
      menuPrice,
      menuDiscount,
      menuType,
      addOn,
      noteOption,
      arrange);

  /// Create a copy of MenuLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuLiteModelImplCopyWith<_$MenuLiteModelImpl> get copyWith =>
      __$$MenuLiteModelImplCopyWithImpl<_$MenuLiteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuLiteModelImplToJson(
      this,
    );
  }
}

abstract class _MenuLiteModel implements MenuLiteModel {
  const factory _MenuLiteModel(
          {@JsonKey(name: 'menuID') required final int menuID,
          @JsonKey(name: 'menuCode') required final String menuCode,
          @JsonKey(name: 'menuImage') required final String menuImage,
          @JsonKey(name: 'categoryID') required final int categoryID,
          @JsonKey(name: 'stationID') required final int stationID,
          @JsonKey(name: 'menuName') required final String menuName,
          @JsonKey(name: 'menuDesc') required final String menuDesc,
          @JsonKey(name: 'menuPrice') required final int menuPrice,
          @JsonKey(name: 'menuDiscount') required final int menuDiscount,
          @JsonKey(name: 'menuType') required final String menuType,
          @JsonKey(name: 'addOn') final String? addOn,
          @JsonKey(name: 'noteOption') final String? noteOption,
          @JsonKey(name: 'arrange') required final int arrange}) =
      _$MenuLiteModelImpl;

  factory _MenuLiteModel.fromJson(Map<String, dynamic> json) =
      _$MenuLiteModelImpl.fromJson;

  @override
  @JsonKey(name: 'menuID')
  int get menuID;
  @override
  @JsonKey(name: 'menuCode')
  String get menuCode;
  @override
  @JsonKey(name: 'menuImage')
  String get menuImage;
  @override
  @JsonKey(name: 'categoryID')
  int get categoryID;
  @override
  @JsonKey(name: 'stationID')
  int get stationID;
  @override
  @JsonKey(name: 'menuName')
  String get menuName;
  @override
  @JsonKey(name: 'menuDesc')
  String get menuDesc;
  @override
  @JsonKey(name: 'menuPrice')
  int get menuPrice;
  @override
  @JsonKey(name: 'menuDiscount')
  int get menuDiscount;
  @override
  @JsonKey(name: 'menuType')
  String get menuType;
  @override
  @JsonKey(name: 'addOn')
  String? get addOn;
  @override
  @JsonKey(name: 'noteOption')
  String? get noteOption;
  @override
  @JsonKey(name: 'arrange')
  int get arrange;

  /// Create a copy of MenuLiteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuLiteModelImplCopyWith<_$MenuLiteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
