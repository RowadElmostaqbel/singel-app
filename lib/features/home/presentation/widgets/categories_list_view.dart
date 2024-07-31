import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/utils/assets.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';
import 'package:single_resturant_app/core/widgets/cached_network_image_widget.dart';
import 'package:single_resturant_app/features/home/presentation/views/category_view.dart';
import 'package:single_resturant_app/features/meal/data/models/category_model.dart';
import 'package:single_resturant_app/features/meal/presentation/controllers/categories_cubit.dart';

class CategoriesListView extends HookWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> index =
        useState(context.read<CategoriesCubit>().selectedMainCategoryId);
    useEffect(() {
      context.read<CategoriesCubit>().fetchMainCategories();
      return null;
    }, []);
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {
        if (state is CategoriesFailureState) {
          log(name: 'failure', state.failure.msg);
        } else if (state is CategoriesLoadedState) {
          context
              .read<CategoriesCubit>()
              .changeSelectedMainCategoryId(state.categories[0].id ?? 0);
          index.value = state.categories[0].id ?? 0;
        }
      },
      builder: (context, state) {
        if (context.read<CategoriesCubit>().mainCategories.isNotEmpty) {
          final categories = context.read<CategoriesCubit>().mainCategories;
          return Align(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories
                    .map((item) => index.value == item.id
                        ? SelectedCategoryListItem(
                            categoryModel: item,
                          )
                        : GestureDetector(
                            onTap: () {
                              index.value = item.id ?? 0;
                              context
                                  .read<CategoriesCubit>()
                                  .changeSelectedMainCategoryId(item.id ?? 0);
                            },
                            child: UnSelectedCategoryListItem(
                              categoryModel: item,
                            ),
                          ))
                    .toList(),
              ),
            ),
          );
        } else if (state is CategoriesLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Image.asset(Assets.assetsImagesEmpty);
      },
    );
  }
}

class SelectedCategoryListItem extends StatelessWidget {
  final CategoryModel categoryModel;
  const SelectedCategoryListItem({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 64,
            width: 64,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.primaryColor,
            ),
            child: CachedNetworkImageWidget(url: categoryModel.img ?? ""),
          ),
          const Gap(8),
          Text(
            categoryModel.name!,
            style: TextStyles.primary14Medium,
          )
        ],
      ),
    );
  }
}

class UnSelectedCategoryListItem extends StatelessWidget {
  final CategoryModel categoryModel;

  const UnSelectedCategoryListItem({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 64,
            width: 64,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xffF4F4F4),
            ),
            child: CachedNetworkImageWidget(url: categoryModel.img ?? ""),
          ),
          const Gap(8),
          Text(
            categoryModel.name!,
            style: TextStyles.darkGrey14Regular,
          )
        ],
      ),
    );
  }
}
