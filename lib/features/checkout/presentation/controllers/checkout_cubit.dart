import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:single_resturant_app/features/checkout/data/models/send_checkout_data_model.dart';
import 'package:single_resturant_app/features/checkout/data/repo/checkout_repo.dart';

import '../../../../core/utils/cache_service.dart';
import '../../../auth/data/models/user_model.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CheckoutRepo checkoutRepo;
  CheckoutCubit(this.checkoutRepo) : super(CheckoutInitial());

  SendCheckoutDataModel checkoutDataModel = SendCheckoutDataModel(
    paymentMethod: "cash",
    orderType: "delivery",
    phone: CacheServiceHeper()
            .getData<UserModel>(key: 'user', boxName: 'user')
            ?.data
            ?.client
            ?.phone ??
        '',
  );
  checkout() async {
    checkoutDataModel.clientId = CacheServiceHeper()
        .getData<UserModel>(key: 'user', boxName: 'user')!
        .data!
        .client!
        .id
        .toString();
    checkoutDataModel.phone = CacheServiceHeper()
        .getData<UserModel>(key: 'user', boxName: 'user')!
        .data!
        .client!
        .phone
        .toString();
    emit(CheckoutLoading());

    log(name: 'cart', checkoutDataModel.toJson().toString());
    final result = await checkoutRepo.checkout(
      checkoutDataModel,
    );
    result.fold(
      (l) => emit(CheckoutFailure(
        error: l.msg,
      )),
      (r) => emit(
        CheckoutSuccess(),
      ),
    );
  }

  addDeliveryAddressToDataModel(String id) {
    checkoutDataModel.clientAdrressId = id;
  }
}
