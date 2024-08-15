import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/features/wishlist/presentation/controllers/whishlist_cubit.dart';

class AddToFavBtn extends HookWidget {
  final bool isLiked;
  final String mealId;
  const AddToFavBtn({
    super.key,
    required this.isLiked,
    required this.mealId,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isFavorite = useState(isLiked);
    return BlocConsumer<WhishlistCubit, WhishlistState>(
      listener: (context, state) {
        if (state is WhishlistChangedState && state.id==int.tryParse(mealId)) {
          isFavorite.value = state.status;
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context
                .read<WhishlistCubit>()
                .toggleFavoriteLocally(int.tryParse(mealId) ?? 0);
          },
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
      },
    );
  }
}
