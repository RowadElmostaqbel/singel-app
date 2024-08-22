import 'package:dartz/dartz.dart';
import 'package:single_resturant_app/core/errors/failure.dart';
import 'package:single_resturant_app/features/checkout/data/models/send_checkout_data_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, bool>> checkout(
    SendCheckoutDataModel checkoutDataModel,
  );
}
