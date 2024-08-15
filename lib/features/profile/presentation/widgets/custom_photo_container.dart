import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/cache_service.dart';
import 'package:single_resturant_app/core/widgets/cached_network_image_widget.dart';
import 'package:single_resturant_app/features/auth/data/models/user_model.dart';

import '../../../../core/utils/app_colors.dart';

class CustomPhotoContainer extends StatelessWidget {
  const CustomPhotoContainer({super.key});

  @override
  Widget build(BuildContext context) {
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
                    topRight: Radius.circular(30)),
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
                url:
                    '${CacheServiceHeper().getData<UserModel>(boxName: 'user', key: 'user')?.data?.client?.image}',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
