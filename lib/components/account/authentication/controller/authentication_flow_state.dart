/*
 * File: authentication_flow_state.dart
 * File Created: Saturday, 11th February 2023 2:00:35 am
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Saturday, 11th February 2023 2:03:46 am
 * Modified By: Bruce Blake (hieutv)
 */

part of 'authentication_flow_controller.dart';

enum AuthenticationFlowStep { signIn, signUp }

enum AuthenticationFlowStatus { initial, loading, success, failure, canceled }

class AuthenticationFlowState extends Equatable {
  const AuthenticationFlowState({
    this.status = AuthenticationFlowStatus.initial,
    this.errorMessage,
  });

  final AuthenticationFlowStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [status];

  AuthenticationFlowState copyWith({
    AuthenticationFlowStatus? status,
    String? errorMessage,
  }) {
    return AuthenticationFlowState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
