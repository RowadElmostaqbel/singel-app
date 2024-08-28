import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:single_resturant_app/core/utils/cache_service.dart';
import 'package:single_resturant_app/features/auth/data/models/user_model.dart';
import 'package:single_resturant_app/features/profile/data/repo/edit_profile_repo.dart';

import '../../../auth/data/models/client.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final CacheServiceHeper cacheServiceHeper;
  final EditProfileRepo editProfileRepo;
  ProfileCubit(this.editProfileRepo, this.cacheServiceHeper)
      : super(ProfileInitial());

  Map<String, dynamic> updateDataMap = {};

  Future<void> updateProfile() async {
    emit(EditProfileLoadingState());
    final res = await editProfileRepo.updateProfile(data: updateDataMap);
    res.fold(
      (failure) {
        emit(
          EditProfileFailureState(
            error: failure.msg,
          ),
        );
      },
      (client) {
        updateCachingData(client: client);
        emit(
          EditProfileSuccessState(),
        );
      },
    );
  }

  updateCachingData({required Client client}) {
    UserModel? userModel =
        cacheServiceHeper.getData<UserModel>(boxName: 'user', key: 'user');

    userModel!.data!.client = client;

    cacheServiceHeper.storeData(data: userModel, boxName: 'user', key: 'user');
  }

  resetUpdateDataMap() {
    Client client = cacheServiceHeper
        .getData<UserModel>(boxName: 'user', key: 'user')!
        .data!
        .client!;
    updateDataMap = {
      'name': client.name,
      'email': client.email,
      'phone': client.phone,
    };
  }
}
