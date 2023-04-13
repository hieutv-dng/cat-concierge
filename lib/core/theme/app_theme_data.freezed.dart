// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_theme_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppThemeData _$AppThemeDataFromJson(Map<String, dynamic> json) {
  return _AppThemeData.fromJson(json);
}

/// @nodoc
mixin _$AppThemeData {
  String get name => throw _privateConstructorUsedError;
  List<int> get backgroundColors => throw _privateConstructorUsedError;
  int get primaryColor => throw _privateConstructorUsedError;
  int get secondaryColor => throw _privateConstructorUsedError;
  int get cardColor => throw _privateConstructorUsedError;
  int get statusBarColor => throw _privateConstructorUsedError;
  int get navBarColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppThemeDataCopyWith<AppThemeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppThemeDataCopyWith<$Res> {
  factory $AppThemeDataCopyWith(
          AppThemeData value, $Res Function(AppThemeData) then) =
      _$AppThemeDataCopyWithImpl<$Res, AppThemeData>;
  @useResult
  $Res call(
      {String name,
      List<int> backgroundColors,
      int primaryColor,
      int secondaryColor,
      int cardColor,
      int statusBarColor,
      int navBarColor});
}

/// @nodoc
class _$AppThemeDataCopyWithImpl<$Res, $Val extends AppThemeData>
    implements $AppThemeDataCopyWith<$Res> {
  _$AppThemeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? backgroundColors = null,
    Object? primaryColor = null,
    Object? secondaryColor = null,
    Object? cardColor = null,
    Object? statusBarColor = null,
    Object? navBarColor = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundColors: null == backgroundColors
          ? _value.backgroundColors
          : backgroundColors // ignore: cast_nullable_to_non_nullable
              as List<int>,
      primaryColor: null == primaryColor
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as int,
      secondaryColor: null == secondaryColor
          ? _value.secondaryColor
          : secondaryColor // ignore: cast_nullable_to_non_nullable
              as int,
      cardColor: null == cardColor
          ? _value.cardColor
          : cardColor // ignore: cast_nullable_to_non_nullable
              as int,
      statusBarColor: null == statusBarColor
          ? _value.statusBarColor
          : statusBarColor // ignore: cast_nullable_to_non_nullable
              as int,
      navBarColor: null == navBarColor
          ? _value.navBarColor
          : navBarColor // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppThemeDataCopyWith<$Res>
    implements $AppThemeDataCopyWith<$Res> {
  factory _$$_AppThemeDataCopyWith(
          _$_AppThemeData value, $Res Function(_$_AppThemeData) then) =
      __$$_AppThemeDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      List<int> backgroundColors,
      int primaryColor,
      int secondaryColor,
      int cardColor,
      int statusBarColor,
      int navBarColor});
}

/// @nodoc
class __$$_AppThemeDataCopyWithImpl<$Res>
    extends _$AppThemeDataCopyWithImpl<$Res, _$_AppThemeData>
    implements _$$_AppThemeDataCopyWith<$Res> {
  __$$_AppThemeDataCopyWithImpl(
      _$_AppThemeData _value, $Res Function(_$_AppThemeData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? backgroundColors = null,
    Object? primaryColor = null,
    Object? secondaryColor = null,
    Object? cardColor = null,
    Object? statusBarColor = null,
    Object? navBarColor = null,
  }) {
    return _then(_$_AppThemeData(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundColors: null == backgroundColors
          ? _value._backgroundColors
          : backgroundColors // ignore: cast_nullable_to_non_nullable
              as List<int>,
      primaryColor: null == primaryColor
          ? _value.primaryColor
          : primaryColor // ignore: cast_nullable_to_non_nullable
              as int,
      secondaryColor: null == secondaryColor
          ? _value.secondaryColor
          : secondaryColor // ignore: cast_nullable_to_non_nullable
              as int,
      cardColor: null == cardColor
          ? _value.cardColor
          : cardColor // ignore: cast_nullable_to_non_nullable
              as int,
      statusBarColor: null == statusBarColor
          ? _value.statusBarColor
          : statusBarColor // ignore: cast_nullable_to_non_nullable
              as int,
      navBarColor: null == navBarColor
          ? _value.navBarColor
          : navBarColor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppThemeData implements _AppThemeData {
  const _$_AppThemeData(
      {required this.name,
      required final List<int> backgroundColors,
      required this.primaryColor,
      required this.secondaryColor,
      required this.cardColor,
      required this.statusBarColor,
      required this.navBarColor})
      : _backgroundColors = backgroundColors;

  factory _$_AppThemeData.fromJson(Map<String, dynamic> json) =>
      _$$_AppThemeDataFromJson(json);

  @override
  final String name;
  final List<int> _backgroundColors;
  @override
  List<int> get backgroundColors {
    if (_backgroundColors is EqualUnmodifiableListView)
      return _backgroundColors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_backgroundColors);
  }

  @override
  final int primaryColor;
  @override
  final int secondaryColor;
  @override
  final int cardColor;
  @override
  final int statusBarColor;
  @override
  final int navBarColor;

  @override
  String toString() {
    return 'AppThemeData(name: $name, backgroundColors: $backgroundColors, primaryColor: $primaryColor, secondaryColor: $secondaryColor, cardColor: $cardColor, statusBarColor: $statusBarColor, navBarColor: $navBarColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppThemeData &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._backgroundColors, _backgroundColors) &&
            (identical(other.primaryColor, primaryColor) ||
                other.primaryColor == primaryColor) &&
            (identical(other.secondaryColor, secondaryColor) ||
                other.secondaryColor == secondaryColor) &&
            (identical(other.cardColor, cardColor) ||
                other.cardColor == cardColor) &&
            (identical(other.statusBarColor, statusBarColor) ||
                other.statusBarColor == statusBarColor) &&
            (identical(other.navBarColor, navBarColor) ||
                other.navBarColor == navBarColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_backgroundColors),
      primaryColor,
      secondaryColor,
      cardColor,
      statusBarColor,
      navBarColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppThemeDataCopyWith<_$_AppThemeData> get copyWith =>
      __$$_AppThemeDataCopyWithImpl<_$_AppThemeData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppThemeDataToJson(
      this,
    );
  }
}

abstract class _AppThemeData implements AppThemeData {
  const factory _AppThemeData(
      {required final String name,
      required final List<int> backgroundColors,
      required final int primaryColor,
      required final int secondaryColor,
      required final int cardColor,
      required final int statusBarColor,
      required final int navBarColor}) = _$_AppThemeData;

  factory _AppThemeData.fromJson(Map<String, dynamic> json) =
      _$_AppThemeData.fromJson;

  @override
  String get name;
  @override
  List<int> get backgroundColors;
  @override
  int get primaryColor;
  @override
  int get secondaryColor;
  @override
  int get cardColor;
  @override
  int get statusBarColor;
  @override
  int get navBarColor;
  @override
  @JsonKey(ignore: true)
  _$$_AppThemeDataCopyWith<_$_AppThemeData> get copyWith =>
      throw _privateConstructorUsedError;
}
