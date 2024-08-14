import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:single_resturant_app/features/checkout/data/models/send_checkout_data_model.dart';
import 'package:single_resturant_app/features/checkout/data/repo/checkout_repo.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CheckoutRepo checkoutRepo;
  CheckoutCubit(this.checkoutRepo) : super(CheckoutInitial());

  SendCheckoutDataModel checkoutDataModel = SendCheckoutDataModel();
  checkout() async {
    emit(CheckoutLoading());
    final result = await checkoutRepo.checkout(
      checkoutDataModel.toJson(),
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
}
