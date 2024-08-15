import 'package:dartz/dartz.dart';
import 'package:single_resturant_app/core/errors/failure.dart';
import 'package:single_resturant_app/features/auth/data/models/client.dart';

abstract class EditProfileRepo {
  Future<Either<Failure, Client>> updateProfile({required Map<String,dynamic>data});
}
