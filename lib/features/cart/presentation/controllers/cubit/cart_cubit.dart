import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../../meal/data/models/meal_model.dart';
import '../../../../orders/data/models/order_model.dart';
import '../../../data/models/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
 late CartModel cartModel;

  OrderModel? orderModel;
  CartCubit() : super(CartInitial()){
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
    if (sides != null) {
      // CategoryMealItem mealModel = this.orderModel!.meal;
      // this.orderModel = this.orderModel!.copyWith(
      //       meal: mealModel.copyWith(
      //         sides: sides,
      //       ),
      //     );
    }
    emit(
      OrderDetailsChangedState(
        orderModel: orderModel,
      ),
    );
  }
}
