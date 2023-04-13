/*
 * File: language.dart
 * File Created: Thursday, 2nd February 2023 2:42:10 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Thursday, 2nd February 2023 2:42:29 pm
 * Modified By: Hieu Tran
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'language.freezed.dart';
part 'language.g.dart';

@freezed
class Language with _$Language {
  factory Language({
    /// the name of the language
    @JsonKey(name: 'name') required String name,

    /// the language code (en,vi..)
    @JsonKey(name: 'iso_code') required String isoCode,
  }) = _Language;
  const Language._();

  factory Language.fromJson(Map<String, dynamic> json) => _$LanguageFromJson(json);
}
