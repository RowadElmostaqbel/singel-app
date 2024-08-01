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
  late CartModel cartModel;

  OrderModel? orderModel;
  CartCubit(
    this.cartRepo,
  ) : super(CartInitial()) {
    cartModel = CartModel(
      orders: [],
      isCouponApplied: false,
      couponCode: '',
    );
  }

  void updateCartModel(CartModel cartModel) {
    this.cartModel = cartModel;
    emit(
      CartItemChangedState(
        cartModel: cartModel,
      ),
    );
  }

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

  addOrderToCart({required OrderModel orderModel}) {
    cartModel = cartModel.copyWith(orders: [...cartModel.orders, orderModel]);
    emit(
      CartItemChangedState(
        cartModel: cartModel,
      ),
    );
  }

  changeOrderDetails({List<SideItemModel>? sides, OrderModel? orderModel}) {
    if (orderModel != null) {
      this.orderModel = orderModel;
    }
    emit(
      OrderDetailsChangedState(
        orderModel: orderModel,
      ),
    );
  }
}
