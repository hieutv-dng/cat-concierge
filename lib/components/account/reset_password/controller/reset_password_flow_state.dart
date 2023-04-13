/*
 * File: reset_password_flow_state.dart
 * File Created: Saturday, 18th February 2023 4:27:05 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Saturday, 18th February 2023 4:27:31 pm
 * Modified By: Bruce Blake (hieutv)
 */

part of 'reset_password_flow_controller.dart';

enum ResetPasswordFlowStep { selectMethod, withEmail, withPhone, verifyCode, createNewPassword, successfully }

enum ResetPasswordFlowStatus { initial, loading, success, failure, canceled }

class ResetPasswordFlowState extends Equatable {
  const ResetPasswordFlowState({
    this.status = ResetPasswordFlowStatus.initial,
    this.errorMessage,
  });

  final ResetPasswordFlowStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [status];

  ResetPasswordFlowState copyWith({
    ResetPasswordFlowStatus? status,
    String? errorMessage,
  }) {
    return ResetPasswordFlowState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
