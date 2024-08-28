import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:single_resturant_app/features/edit_password/data/models/password_model.dart';
import 'package:single_resturant_app/features/edit_password/data/repos/passsword_repo.dart';


part 'password_state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordRepo passwordRepo;

  PasswordModel passwordModel = PasswordModel();

  PasswordCubit(this.passwordRepo) : super(PasswordInitial());

  oldPassword(String oldPassword) {
    passwordModel.current_password = oldPassword;
  }

  newPassword(String newPassword) {
    passwordModel.new_password = newPassword;
  }

  confirmPassword(String confirmPassword) {
    passwordModel.new_password_confirmation = confirmPassword;
  }

  updatePassword() async {
    emit(EditPasswordLoadingState());
    final response =
        await passwordRepo.updatePassword(passwordModel: passwordModel);
    response.fold((failure) {
      emit(EditPasswordFailureState(error: failure.msg));
    }, (password) {
      emit(EditPasswordSuccessState());
    });
  }
}
