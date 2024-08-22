import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_resturant_app/features/meal/data/models/category_meal_item.dart';
import 'package:single_resturant_app/features/wishlist/presentation/controllers/whishlist_cubit.dart';
import 'package:single_resturant_app/features/wishlist/presentation/widgets/wish_item.dart';

class whishlistGridView extends StatelessWidget {
  const whishlistGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<CategoryMealItem> whishlist =
        context.watch<WhishlistCubit>().myWishlist;
    return BlocConsumer<WhishlistCubit, WhishlistState>(
      listener: (context, state) {
        if (state is WhishlistChangedState) {
          context.read<WhishlistCubit>().fetchMyWishlist();
        }
      },
      builder: (context, state) {
        if (whishlist.isNotEmpty) {
          return GridView.builder(
            itemCount: whishlist.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) => WishItem(
              mealItem: whishlist[index],
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .8,
              crossAxisCount: 2,
              crossAxisSpacing: 25,
              mainAxisSpacing: 20,
            ),
          );
        } else if (state is FetchWishlistLoadingState && whishlist.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const SizedBox();
      },
    );
  }
}
