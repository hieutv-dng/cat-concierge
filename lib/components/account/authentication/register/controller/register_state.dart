/*
 * File: register_state.dart
 * File Created: Sunday, 12th February 2023 11:53:18 am
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Sunday, 12th February 2023 11:54:05 am
 * Modified By: Bruce Blake (hieutv)
 */

part of 'register_controller.dart';

enum RegisterStatus { initial, loading, success, failure }

class RegisterState extends Equatable {
  const RegisterState({
    this.status = RegisterStatus.initial,
    this.errorMessage,
  });

  final RegisterStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [status];

  RegisterState copyWith({
    RegisterStatus? status,
    String? errorMessage,
  }) {
    return RegisterState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
