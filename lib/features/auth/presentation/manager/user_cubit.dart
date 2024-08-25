import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:single_resturant_app/features/auth/data/models/register_data_model.dart';

import '../../../../core/utils/cache_service.dart';
import '../../data/models/user_model.dart';
import '../../data/repo/auth_repo.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final CacheServiceHeper cacheServiceHeper;
  late UserModel userModel;
  final AuthRepo authRepo;
  File? image;
  UserCubit(this.authRepo, this.cacheServiceHeper) : super(UserInitial());
  RegisterDataModel registerDataModel = RegisterDataModel();

  addDataToModel({
    String? name,
    String? phone,
    String? email,
    String? password,
    String? password_confirmation,
    String? image,
    String? countryCode,
  }) {
    registerDataModel = registerDataModel.copyWith(
      name: name,
      phone: phone,
      email: email,
      password: password,
      password_confirmation: password_confirmation,
      image: image,
      countryCode: countryCode,
    );
  }

 

  // addImage(File image) {
  //   registerDataModel.image = image.path;
  //   this.image = image;
  // }

 

  uploadImage(File file) async {
    image = file;
    // String fileName = file.path.split('/').last;
    // return FormData.fromMap({
    //   "image": await MultipartFile.fromFile(file.path, filename: fileName),
    // });
  }

 

 
  register() async {
    emit(AuthLoadingState());
    final res = await authRepo.register(
      registerDataModel,
      image,
    );
    res.fold((failure) {
      emit(
        AuthFailureState(
          error: failure.msg,
        ),
      );
    }, (user) {
      emit(
        AuthLoadedState(),
      );
    });
  }

  logout() async {
    emit(AuthLoadingState());
    final res = await authRepo.logout();
    res.fold((failure) {
      emit(
        AuthFailureState(
          error: failure.msg,
        ),
      );
    }, (user) {
      emit(
        AuthLoadedState(),
      );
    });
  }
}
