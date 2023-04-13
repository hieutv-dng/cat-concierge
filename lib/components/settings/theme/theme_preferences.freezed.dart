// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ThemePreferences {
  int get lightThemeId => throw _privateConstructorUsedError;
  int get darkThemeId => throw _privateConstructorUsedError;
  BuiltList<String> get customThemes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemePreferencesCopyWith<ThemePreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemePreferencesCopyWith<$Res> {
  factory $ThemePreferencesCopyWith(
          ThemePreferences value, $Res Function(ThemePreferences) then) =
      _$ThemePreferencesCopyWithImpl<$Res, ThemePreferences>;
  @useResult
  $Res call(
      {int lightThemeId, int darkThemeId, BuiltList<String> customThemes});
}

/// @nodoc
class _$ThemePreferencesCopyWithImpl<$Res, $Val extends ThemePreferences>
    implements $ThemePreferencesCopyWith<$Res> {
  _$ThemePreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lightThemeId = null,
    Object? darkThemeId = null,
    Object? customThemes = null,
  }) {
    return _then(_value.copyWith(
      lightThemeId: null == lightThemeId
          ? _value.lightThemeId
          : lightThemeId // ignore: cast_nullable_to_non_nullable
              as int,
      darkThemeId: null == darkThemeId
          ? _value.darkThemeId
          : darkThemeId // ignore: cast_nullable_to_non_nullable
              as int,
      customThemes: null == customThemes
          ? _value.customThemes
          : customThemes // ignore: cast_nullable_to_non_nullable
              as BuiltList<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ThemePreferencesCopyWith<$Res>
    implements $ThemePreferencesCopyWith<$Res> {
  factory _$$_ThemePreferencesCopyWith(
          _$_ThemePreferences value, $Res Function(_$_ThemePreferences) then) =
      __$$_ThemePreferencesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int lightThemeId, int darkThemeId, BuiltList<String> customThemes});
}

/// @nodoc
class __$$_ThemePreferencesCopyWithImpl<$Res>
    extends _$ThemePreferencesCopyWithImpl<$Res, _$_ThemePreferences>
    implements _$$_ThemePreferencesCopyWith<$Res> {
  __$$_ThemePreferencesCopyWithImpl(
      _$_ThemePreferences _value, $Res Function(_$_ThemePreferences) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lightThemeId = null,
    Object? darkThemeId = null,
    Object? customThemes = null,
  }) {
    return _then(_$_ThemePreferences(
      lightThemeId: null == lightThemeId
          ? _value.lightThemeId
          : lightThemeId // ignore: cast_nullable_to_non_nullable
              as int,
      darkThemeId: null == darkThemeId
          ? _value.darkThemeId
          : darkThemeId // ignore: cast_nullable_to_non_nullable
              as int,
      customThemes: null == customThemes
          ? _value.customThemes
          : customThemes // ignore: cast_nullable_to_non_nullable
              as BuiltList<String>,
    ));
  }
}

/// @nodoc

class _$_ThemePreferences implements _ThemePreferences {
  const _$_ThemePreferences(
      {required this.lightThemeId,
      required this.darkThemeId,
      required this.customThemes});

  @override
  final int lightThemeId;
  @override
  final int darkThemeId;
  @override
  final BuiltList<String> customThemes;

  @override
  String toString() {
    return 'ThemePreferences(lightThemeId: $lightThemeId, darkThemeId: $darkThemeId, customThemes: $customThemes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ThemePreferences &&
            (identical(other.lightThemeId, lightThemeId) ||
                other.lightThemeId == lightThemeId) &&
            (identical(other.darkThemeId, darkThemeId) ||
                other.darkThemeId == darkThemeId) &&
            const DeepCollectionEquality()
                .equals(other.customThemes, customThemes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lightThemeId, darkThemeId,
      const DeepCollectionEquality().hash(customThemes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ThemePreferencesCopyWith<_$_ThemePreferences> get copyWith =>
      __$$_ThemePreferencesCopyWithImpl<_$_ThemePreferences>(this, _$identity);
}

abstract class _ThemePreferences implements ThemePreferences {
  const factory _ThemePreferences(
      {required final int lightThemeId,
      required final int darkThemeId,
      required final BuiltList<String> customThemes}) = _$_ThemePreferences;

  @override
  int get lightThemeId;
  @override
  int get darkThemeId;
  @override
  BuiltList<String> get customThemes;
  @override
  @JsonKey(ignore: true)
  _$$_ThemePreferencesCopyWith<_$_ThemePreferences> get copyWith =>
      throw _privateConstructorUsedError;
}
