import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/assets.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String url;
  const CachedNetworkImageWidget({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => Image.asset(
        Assets.assetsImagesLogo,
      ),
      errorWidget: (context, url, error) => Image.asset(
        Assets.assetsImagesLogo,
      ),
    );
  }
}
