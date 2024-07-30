import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:single_resturant_app/features/auth/data/models/person_model.dart';

import '../../data/repo/auth_repo.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final AuthRepo authRepo;

  UserCubit(this.authRepo) : super(UserInitial());
  RegisterDataModel registerDataModel = RegisterDataModel();

  addUserName(String userName) {
    registerDataModel.name = userName;
  }

  addImage(File image) {
    registerDataModel.image = image.path;
  }

  addEmail(String email) {
    registerDataModel.email = email;
  }

  Future<FormData> uploadImage(File file) async {
    String fileName = file.path.split('/').last;
    return FormData.fromMap({
      "image": await MultipartFile.fromFile(file.path, filename: fileName),
    });
  }

  addPhoneNumber(String number) {
    registerDataModel.phone = number;
  }

  addPassword(String password) {
    registerDataModel.password = password;
  }

  addConfirmPassword(String confirmPassword) {
    registerDataModel.password_confirmation = confirmPassword;
  }

  register() async {
    emit(AuthLoadingState());
    final state = await authRepo.register(registerData: registerDataModel);
    if (state) {
      emit(AuthLoadedState());
    } else {
      emit(AuthFailureState());
    }
  }
}
