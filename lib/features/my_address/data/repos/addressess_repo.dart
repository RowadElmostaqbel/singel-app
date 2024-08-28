import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/features/my_address/data/models/add_address_model.dart';
import 'package:single_resturant_app/features/my_address/data/models/addresses.dart';

import '../../../../core/errors/failure.dart';

class AddressRepo {
  final ApiService apiService;

  AddressRepo({required this.apiService});

  Future<Either<Failure, bool>> addAddress(
      AddAddressModel addAddressModel) async {
    try {
      final data = await apiService.postFormData(
        endpoint: 'client/profile/addresses',
        data: addAddressModel.toJson(),
      );
      return Right(
        data['status'] ?? false,
      );
    } on DioException catch (e) {
      return Left(
        ServerFailure.fromDioException(e),
      );
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }

  Future<Either<Failure, List<AddressModel>>> fetchMyAddressess() async {
    try {
      final res = await apiService.get(endpoint: 'client/profile/addresses');
      return Right(
        res['data']
            .map<AddressModel>(
              (e) => AddressModel.fromJson(e),
            )
            .toList(),
      );
    } on DioException catch (exception) {
      return Left(
        ServerFailure.fromDioException(
          exception,
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, bool>> deleteAddress(int addressId) async {
    try {
      final response = await apiService.delete(
        endpoint: "client/profile/deleteAddress/$addressId",
      );
      return const Right(
        true,
      );
    } on DioException catch (e) {
      return Left(
        ServerFailure.fromDioException(e),
      );
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }

// @override
// Future<Either<Failure, bool>> addAddress(
//     AddAddressModel addAddressModel) async {
//   try {
//     final res = await apiService.post(
//       endpoint: 'client/profile/addresses',
//       data: addAddressModel.toJson(),
//     );
//
//     return Right(res['status'] ?? false);
//   } on DioException catch (exception) {
//     return Left(
//       ServerFailure.fromDioException(exception),
//     );
//   } catch (exception) {
//     return Left(
//       ServerFailure(
//         exception.toString(),
//       ),
//     );
//   }
// }
//
// @override
// Future<Either<Failure, List<AddressModel>>> getAddress() async {
//   try {
//     final res = await apiService.get(endpoint: 'client/profile/addresses');
//
//     return Right(
//       res['data'].map<AddressModel>((e) => AddressModel.fromJson(e)).toList(),
//     );
//   } on DioException catch (exception) {
//     return Left(
//       ServerFailure.fromDioException(exception),
//     );
//   } catch (exception) {
//     return Left(
//       ServerFailure(
//         exception.toString(),
//       ),
//     );
//   }
// }
}
