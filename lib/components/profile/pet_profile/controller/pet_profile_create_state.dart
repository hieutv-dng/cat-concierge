/*
 * File: PetProfileCreate_state.dart
 * File Created: Sunday, 12th February 2023 11:53:18 am
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Sunday, 12th February 2023 11:54:05 am
 * Modified By: Bruce Blake (hieutv)
 */

part of 'pet_profile_create_controller.dart';

enum PetProfileCreateStatus { initial, loading, success, failure }

class PetProfileCreateState extends Equatable {
  const PetProfileCreateState({
    this.status = PetProfileCreateStatus.initial,
    this.errorMessage,
  });

  final PetProfileCreateStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [status];

  PetProfileCreateState copyWith({
    PetProfileCreateStatus? status,
    String? errorMessage,
  }) {
    return PetProfileCreateState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
