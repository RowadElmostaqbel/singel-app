import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:single_resturant_app/features/cart/data/models/add_to_cart_data_model.dart';
import 'package:single_resturant_app/features/cart/data/repos/cart_repo.dart';

import '../../../../meal/data/models/meal_model.dart';
import '../../../../orders/data/models/order_model.dart';
import '../../../data/models/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  List<CartModel> cart = [];
  CartCubit(
    this.cartRepo,
  ) : super(CartInitial());

  sendCartDataToServe(AddToCartDataModel addToCartDataModel) async {
    emit(SendCartToServerLoadingState());
    final res = await cartRepo.addItemToCart(addToCartDataModel);
    res.fold(
      (error) => emit(
        SendCartToServerFailureState(
          message: error.msg,
        ),
      ),
      (status) => emit(
        SendCartToServerLoadedState(
          status: status,
        ),
      ),
    );
  }

  fetchCart() async {
    emit(FetchCartLoadingState());
    final res = await cartRepo.getCart();
    res.fold(
      (error) {
        log(error.msg);
        emit(
          FetchCartFailureState(
            message: error.msg,
          ),
        );
      },
      (cart) {
        this.cart = cart;
        emit(FetchCartSuccessState());
      },
    );
  }
}
