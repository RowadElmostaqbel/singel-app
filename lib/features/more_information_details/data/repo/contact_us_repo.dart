
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:single_resturant_app/core/utils/api_services.dart';

import '../../../../core/errors/failure.dart';
import '../models/contact_us_model.dart';

class ContactUsRepo {
  final ApiService _apiService;

  ContactUsRepo({required ApiService apiService}) : _apiService = apiService;

  Future sendMessage({required ContactUsModel contactUsModel}) async {
    try {
      final response = await _apiService.post(
          endpoint: "client/contactUs", data: contactUsModel.toJson());
      return Right(response['status']);
    } on DioException catch (e) {
      log(name: 'error', e.toString());
      return Left(
        ServerFailure.fromDioException(e),
      );
    } catch (e) {
      log(name: 'error', e.toString());

      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}
