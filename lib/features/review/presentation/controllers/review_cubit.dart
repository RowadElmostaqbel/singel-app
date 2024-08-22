import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:single_resturant_app/features/review/data/models/add_review_data_model.dart';
import 'package:single_resturant_app/features/review/data/models/review_model.dart';
import 'package:single_resturant_app/features/review/data/repos/review_repo.dart';

import '../../../../core/errors/failure.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  final ReviewRepo reviewRepo;
  ReviewCubit(this.reviewRepo) : super(ReviewInitial());
  AddReviewDataModel dataModel = AddReviewDataModel();

  Map<String, List<ReviewModel>> itemReviews = {};

  addToDataModel({
    String? comment,
    int? itemId,
    double? rate,
  }) {
    dataModel = dataModel.copyWith(
      comment: comment,
      itemId: itemId,
      rate: rate,
    );
  }

  clearDataModel() {
    dataModel = AddReviewDataModel();
  }


  fetchItemReviews(int itemId) async {
    emit(FetchReviewsLoadingState());
    final result = await reviewRepo.fetchItemReviews(itemId);
    result.fold(
      (error) => emit(
        FetchReviewsFailureState(
          failure: error,
        ),
      ),
      (reviews) {
        itemReviews[itemId.toString()] = reviews;
        emit(
        FetchReviewsLoaded(
        ),
      );
      },
    );
  }

  addReview() async {
    emit(ReviewLoadingState());
    log(name: 'review', '${dataModel.toJson()}');
    final result = await reviewRepo.addReview(dataModel);
    result.fold(
      (l) => emit(
        ReviewFailureState(
          failure: l,
        ),
      ),
      (r) => emit(
        ReviewAddedState(),
      ),
    );
  }
}
