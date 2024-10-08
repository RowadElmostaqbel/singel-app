import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_resturant_app/core/utils/cache_service.dart';
import 'package:single_resturant_app/core/widgets/cached_network_image_widget.dart';
import 'package:single_resturant_app/features/auth/data/models/user_model.dart';
import 'package:single_resturant_app/features/profile/presentation/controllers/profile_cubit.dart';

class CustomPhotoContainer extends StatelessWidget {
  const CustomPhotoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30,),),
                  )),
            ),
            Align(
              alignment: const Alignment(0, 1.1),
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: CachedNetworkImageWidget(
                                            isProfileImage: true,

                    url:
                        '${CacheServiceHeper().getData<UserModel>(boxName: 'user', key: 'user')?.data?.client?.image}',
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
