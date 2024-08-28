part of 'review_cubit.dart';

sealed class ReviewState extends Equatable {
  const ReviewState();

  @override
  List<Object> get props => [];
}

final class ReviewInitial extends ReviewState {}

final class FetchReviewsLoadingState extends ReviewState {}

final class FetchReviewsLoaded extends ReviewState {}

final class FetchReviewsFailureState extends ReviewState {
  final Failure failure;

  const FetchReviewsFailureState({required this.failure});
}

final class ReviewLoadingState extends ReviewState {}

final class ReviewAddedState extends ReviewState {}

final class ReviewFailureState extends ReviewState {
  final Failure failure;

  const ReviewFailureState({required this.failure});
}
