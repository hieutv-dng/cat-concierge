/*
 * File: PetProfileCreate_state.dart
 * File Created: Sunday, 12th February 2023 11:53:18 am
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Sunday, 12th February 2023 11:54:05 am
 * Modified By: Bruce Blake (hieutv)
 */

part of 'pet_profile_step_controller.dart';

enum PetStepStatus { initial, loading, success, failure }

class PetStepState extends Equatable {
  const PetStepState({
    this.status = PetStepStatus.initial,
    this.errorMessage,
  });

  final PetStepStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [status];

  PetStepState copyWith({
    PetStepStatus? status,
    String? errorMessage,
  }) {
    return PetStepState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
