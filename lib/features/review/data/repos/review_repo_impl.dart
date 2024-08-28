import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:single_resturant_app/core/errors/failure.dart';
import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/features/review/data/models/add_review_data_model.dart';
import 'package:single_resturant_app/features/review/data/models/review_model.dart';
import 'package:single_resturant_app/features/review/data/repos/review_repo.dart';

class ReviewRepoImpl extends ReviewRepo {
  final ApiService _apiService;

  ReviewRepoImpl({required ApiService apiService}) : _apiService = apiService;
  @override
  Future<Either<Failure, bool>> addReview(AddReviewDataModel data) async {
    try {
      final res = await _apiService.post(
        endpoint: 'client/item/review',
        data: data.toJson(),
      );
      return Right(res['status']);
    } on DioException catch (exception) {
      return Left(
        ServerFailure.fromDioException(exception),
      );
    } catch (exception) {
      return Left(
        ServerFailure(exception.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<ReviewModel>>> fetchItemReviews(
      int itmeId) async {
    try {
      final res = await _apiService.get(
        endpoint: 'client/item/reviews/$itmeId',
      );
      return Right(res['data']['reviews']
          .map<ReviewModel>((e) => ReviewModel.fromJson(e))
          .toList());
    } on DioException catch (exception) {
      return Left(
        ServerFailure.fromDioException(exception),
      );
    } catch (exception) {
      return Left(
        ServerFailure(
          exception.toString(),
        ),
      );
    }
  }
}
