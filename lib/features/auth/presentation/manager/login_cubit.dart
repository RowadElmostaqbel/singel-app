import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:single_resturant_app/features/auth/data/models/login_data_model.dart';

import '../../data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit(this.loginRepo) : super(LoginInitial());

  LoginDataModel loginDataModel = LoginDataModel();

  enterPhoneNumber(String phone) {
    loginDataModel.phone = phone;
  }

  enterPassword(String password) {
    loginDataModel.password = password;
  }

  login() async {
    emit(LoginLoadingState());
    final state = await loginRepo.login(loginDataModel);
    if (state) {
      emit(LoginLoadedState());
    } else {
      emit(LoginFailureState());
    }
  }
}
