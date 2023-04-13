/*
 * File: language_state.dart
 * File Created: Monday, 6th February 2023 9:32:51 am
 * Author: Hieu Tran
 * -----
 * Last Modified: Monday, 6th February 2023 9:33:02 am
 * Modified By: Hieu Tran
 */

part of 'language_controller.dart';

enum LanguageStatus { initial, loading, success, failure }

class LanguageState extends Equatable {
  const LanguageState({
    this.status = LanguageStatus.initial,
    this.languages = const [],
    this.errorMessage,
  });

  final LanguageStatus status;
  final List<Language> languages;
  final String? errorMessage;

  @override
  List<Object> get props => [status, languages];

  LanguageState copyWith({
    LanguageStatus? status,
    List<Language>? languages,
    String? errorMessage,
  }) {
    return LanguageState(
      status: status ?? this.status,
      languages: languages ?? this.languages,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
