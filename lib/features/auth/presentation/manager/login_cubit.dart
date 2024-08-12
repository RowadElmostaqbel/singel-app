import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:single_resturant_app/core/utils/cache_service.dart';
import 'package:single_resturant_app/features/auth/data/models/login_data_model.dart';
import 'package:single_resturant_app/features/auth/data/models/user_model.dart';

import '../../data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final CacheServiceHeper cacheServiceHeper;
  late UserModel userModel;
  final LoginRepo loginRepo;

  LoginCubit(this.loginRepo, this.cacheServiceHeper) : super(LoginInitial());

  LoginDataModel loginDataModel = LoginDataModel();

  enterPhoneNumber(String phone) {
    loginDataModel.phone = phone;
  }

  enterPassword(String password) {
    loginDataModel.password = password;
  }

  login() async {
    emit(LoginLoadingState());
    final res = await loginRepo.login(loginDataModel);
    res.fold((failure) {
      emit(
        LoginFailureState(
          failure: failure.msg,
        ),
      );
    }, (user) {
      userModel = user;
      cacheServiceHeper.storeData<UserModel>(data: user, boxName: 'user', key: 'user');
      emit(
        LoginSuccessState(),
      );
    });
  }
}
