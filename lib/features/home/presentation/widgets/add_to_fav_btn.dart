import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';

class AddToFavBtn extends HookWidget {
  const AddToFavBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isFavorite = useState(false);
    return GestureDetector(
      onTap: () => isFavorite.value = !isFavorite.value,
      child: Container(
        margin: const EdgeInsets.only(right: 10, top: 10),
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: const Color(0xff898989).withOpacity(.24),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.favorite_rounded,
          size: 20,
          color: isFavorite.value ? AppColors.primaryColor : Colors.white,
        ),
      ),
    );
  }
}
