// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'display_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DisplayPreferences {
  bool get compactMode => throw _privateConstructorUsedError;
  String get displayFont => throw _privateConstructorUsedError;
  String get bodyFont => throw _privateConstructorUsedError;
  int get fontSizeDeltaId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DisplayPreferencesCopyWith<DisplayPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisplayPreferencesCopyWith<$Res> {
  factory $DisplayPreferencesCopyWith(
          DisplayPreferences value, $Res Function(DisplayPreferences) then) =
      _$DisplayPreferencesCopyWithImpl<$Res, DisplayPreferences>;
  @useResult
  $Res call(
      {bool compactMode,
      String displayFont,
      String bodyFont,
      int fontSizeDeltaId});
}

/// @nodoc
class _$DisplayPreferencesCopyWithImpl<$Res, $Val extends DisplayPreferences>
    implements $DisplayPreferencesCopyWith<$Res> {
  _$DisplayPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compactMode = null,
    Object? displayFont = null,
    Object? bodyFont = null,
    Object? fontSizeDeltaId = null,
  }) {
    return _then(_value.copyWith(
      compactMode: null == compactMode
          ? _value.compactMode
          : compactMode // ignore: cast_nullable_to_non_nullable
              as bool,
      displayFont: null == displayFont
          ? _value.displayFont
          : displayFont // ignore: cast_nullable_to_non_nullable
              as String,
      bodyFont: null == bodyFont
          ? _value.bodyFont
          : bodyFont // ignore: cast_nullable_to_non_nullable
              as String,
      fontSizeDeltaId: null == fontSizeDeltaId
          ? _value.fontSizeDeltaId
          : fontSizeDeltaId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DisplayPreferencesCopyWith<$Res>
    implements $DisplayPreferencesCopyWith<$Res> {
  factory _$$_DisplayPreferencesCopyWith(_$_DisplayPreferences value,
          $Res Function(_$_DisplayPreferences) then) =
      __$$_DisplayPreferencesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool compactMode,
      String displayFont,
      String bodyFont,
      int fontSizeDeltaId});
}

/// @nodoc
class __$$_DisplayPreferencesCopyWithImpl<$Res>
    extends _$DisplayPreferencesCopyWithImpl<$Res, _$_DisplayPreferences>
    implements _$$_DisplayPreferencesCopyWith<$Res> {
  __$$_DisplayPreferencesCopyWithImpl(
      _$_DisplayPreferences _value, $Res Function(_$_DisplayPreferences) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? compactMode = null,
    Object? displayFont = null,
    Object? bodyFont = null,
    Object? fontSizeDeltaId = null,
  }) {
    return _then(_$_DisplayPreferences(
      compactMode: null == compactMode
          ? _value.compactMode
          : compactMode // ignore: cast_nullable_to_non_nullable
              as bool,
      displayFont: null == displayFont
          ? _value.displayFont
          : displayFont // ignore: cast_nullable_to_non_nullable
              as String,
      bodyFont: null == bodyFont
          ? _value.bodyFont
          : bodyFont // ignore: cast_nullable_to_non_nullable
              as String,
      fontSizeDeltaId: null == fontSizeDeltaId
          ? _value.fontSizeDeltaId
          : fontSizeDeltaId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DisplayPreferences extends _DisplayPreferences {
  _$_DisplayPreferences(
      {required this.compactMode,
      required this.displayFont,
      required this.bodyFont,
      required this.fontSizeDeltaId})
      : super._();

  @override
  final bool compactMode;
  @override
  final String displayFont;
  @override
  final String bodyFont;
  @override
  final int fontSizeDeltaId;

  @override
  String toString() {
    return 'DisplayPreferences(compactMode: $compactMode, displayFont: $displayFont, bodyFont: $bodyFont, fontSizeDeltaId: $fontSizeDeltaId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DisplayPreferences &&
            (identical(other.compactMode, compactMode) ||
                other.compactMode == compactMode) &&
            (identical(other.displayFont, displayFont) ||
                other.displayFont == displayFont) &&
            (identical(other.bodyFont, bodyFont) ||
                other.bodyFont == bodyFont) &&
            (identical(other.fontSizeDeltaId, fontSizeDeltaId) ||
                other.fontSizeDeltaId == fontSizeDeltaId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, compactMode, displayFont, bodyFont, fontSizeDeltaId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DisplayPreferencesCopyWith<_$_DisplayPreferences> get copyWith =>
      __$$_DisplayPreferencesCopyWithImpl<_$_DisplayPreferences>(
          this, _$identity);
}

abstract class _DisplayPreferences extends DisplayPreferences {
  factory _DisplayPreferences(
      {required final bool compactMode,
      required final String displayFont,
      required final String bodyFont,
      required final int fontSizeDeltaId}) = _$_DisplayPreferences;
  _DisplayPreferences._() : super._();

  @override
  bool get compactMode;
  @override
  String get displayFont;
  @override
  String get bodyFont;
  @override
  int get fontSizeDeltaId;
  @override
  @JsonKey(ignore: true)
  _$$_DisplayPreferencesCopyWith<_$_DisplayPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}
