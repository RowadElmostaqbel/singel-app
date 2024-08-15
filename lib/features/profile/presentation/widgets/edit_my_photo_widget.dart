import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:single_resturant_app/core/widgets/cached_network_image_widget.dart';
import 'package:single_resturant_app/features/cart/presentation/views/cart_view.dart';
import 'package:single_resturant_app/features/profile/presentation/controllers/profile_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/cache_service.dart';
import '../../../auth/data/models/user_model.dart';

class EditMyPhotoWidget extends HookWidget {
  pickImage({
    required ImageSource source,
    required ValueNotifier<File?> pickedImage,
    required BuildContext context,
  }) async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: source);

    pickedImage.value = File(image!.path);

    context.read<ProfileCubit>().updateDataMap['image'] = pickedImage.value;
  }

  const EditMyPhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<File?> pickedImage = useState(null);
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
                  topRight: Radius.circular(
                    30,
                  ),
                ),
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
              child: pickedImage.value == null
                  ? CachedNetworkImageWidget(
                      url:
                          '${CacheServiceHeper().getData<UserModel>(boxName: 'user', key: 'user')?.data?.client?.image}',
                    )
                  : Image.file(
                      pickedImage.value!,
                      fit: BoxFit.fill,
                    ),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(0.3, 1),
          child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      insetPadding: EdgeInsets.zero,
                      content: SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.12,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                pickImage(
                                  source: ImageSource.gallery,
                                  pickedImage: pickedImage,
                                  context: context,
                                );
                              },
                              child: const Text(
                                'Choose form Gallery',
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                pickImage(
                                  source: ImageSource.camera,
                                  pickedImage: pickedImage,
                                  context: context,
                                );
                              },
                              child: const Text(
                                'Open Camera',
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: Image.asset(
                "assets/icons/camera.png",
                color: AppColors.primaryColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
