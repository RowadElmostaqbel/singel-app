import 'package:dartz/dartz.dart';
import 'package:single_resturant_app/features/cart/data/models/add_to_cart_data_model.dart';
import 'package:single_resturant_app/features/cart/data/models/cart_model.dart';

import '../../../../core/errors/failure.dart';

abstract class CartRepo {
  Future<Either<Failure, bool>> addItemToCart(
    AddToCartDataModel addToCartDataModel,
  );

  Future<Either<Failure, List<CartModel>>> getCart();
}
