part of 'cancel_order_cubit.dart';

sealed class CancelOrderState extends Equatable {
  const CancelOrderState();

  @override
  List<Object> get props => [];
}

final class CancelOrderInitial extends CancelOrderState {}

final class FetchCancelOrderReasonsLoadingState extends CancelOrderState {}

final class FetchCancelOrderReasonsLoadedState extends CancelOrderState {}

final class FetchCancelOrderReasonsErrorState extends CancelOrderState {
  final String error;

  const FetchCancelOrderReasonsErrorState({required this.error});
}

final class CancelOrderLoadingState extends CancelOrderState {}

final class CancelOrderStatus extends CancelOrderState {
  final bool status;

  const CancelOrderStatus({required this.status});
}
