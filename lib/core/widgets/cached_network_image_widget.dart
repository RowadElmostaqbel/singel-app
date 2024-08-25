import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/assets.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final bool isProfileImage;
  final String url;
  const CachedNetworkImageWidget({
    super.key,
    required this.url,
    this.isProfileImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fill,
      imageUrl: url,
      placeholder: (context, url) => Image.asset(
        isProfileImage ? 'assets/images/person.png' : Assets.assetsImagesLogo,
      ),
      errorWidget: (context, url, error) => Image.asset(
        isProfileImage ? 'assets/images/person.png' : Assets.assetsImagesLogo,
      ),
    );
  }
}
