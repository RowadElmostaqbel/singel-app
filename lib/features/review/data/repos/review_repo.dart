import 'package:dartz/dartz.dart';
import 'package:single_resturant_app/core/errors/failure.dart';
import 'package:single_resturant_app/features/review/data/models/add_review_data_model.dart';
import 'package:single_resturant_app/features/review/data/models/review_model.dart';

abstract class ReviewRepo {
  Future<Either<Failure, bool>> addReview(AddReviewDataModel data);
  Future<Either<Failure, List<ReviewModel>>> fetchItemReviews(int itmeId);
}
