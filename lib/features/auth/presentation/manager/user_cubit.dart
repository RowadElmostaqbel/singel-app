import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:single_resturant_app/features/auth/data/models/register_data_model.dart';
import 'package:single_resturant_app/features/auth/presentation/manager/login_cubit.dart';

import '../../../../core/utils/cache_service.dart';
import '../../data/models/user_model.dart';
import '../../data/repo/auth_repo.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
   final CacheServiceHeper cacheServiceHeper;
  late UserModel userModel;
  final AuthRepo authRepo;

  UserCubit(this.authRepo, this.cacheServiceHeper) : super(UserInitial());
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
   final res = await authRepo.register(registerDataModel);
    res.fold((failure) {
      emit(
        AuthFailureState(
          error: failure.msg,
        ),
      );
    }, (user) {
      userModel = user;
      cacheServiceHeper.storeData<UserModel>(data: user, boxName: 'user', key: 'user');
      emit(
        AuthLoadedState(),
      );
    });
  }
}
