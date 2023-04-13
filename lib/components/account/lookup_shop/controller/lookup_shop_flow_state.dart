/*
 * File: lookup_shop_flow_state.dart
 * File Created: Monday, 13th February 2023 4:29:05 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Monday, 13th February 2023 4:29:30 pm
 * Modified By: Bruce Blake (hieutv)
 */

part of 'lookup_shop_flow_controller.dart';

enum LookupShopFlowStep { lookup, addInformation1, addInformation2, verifedSuccessfully }

enum LookupShopFlowStatus { initial, loading, success, failure, canceled }

class LookupShopFlowState extends Equatable {
  const LookupShopFlowState({
    this.status = LookupShopFlowStatus.initial,
    this.errorMessage,
  });

  final LookupShopFlowStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [status];

  LookupShopFlowState copyWith({
    LookupShopFlowStatus? status,
    String? errorMessage,
  }) {
    return LookupShopFlowState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
