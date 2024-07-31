import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/widgets/cached_network_image_widget.dart';
import 'package:single_resturant_app/features/meal/presentation/controllers/categories_cubit.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';
import '../../data/models/category_model.dart';

class SubCategoryListView extends HookWidget {
  const SubCategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, List<CategoryModel>> subCategories =
        context.watch<CategoriesCubit>().subCategories;
    int categoryId = context.watch<CategoriesCubit>().selectedMainCategoryId;
    int subCategoryId = context.watch<CategoriesCubit>().selectedSubCategoryId;
    useEffect(() {
      context.read<CategoriesCubit>().fetchSubCategories(categoryId.toString());
      return null;
    }, [categoryId]);
    ValueNotifier<int> selectedIndex = useState(subCategoryId);

    return BlocListener<CategoriesCubit, CategoriesState>(
      listener: (context, state) {
        if (state is SubCategoriesLoadedState) {
          context
              .read<CategoriesCubit>()
              .changeSelectedSubCategoryId(state.subCategories.first.id ?? 0);
          selectedIndex.value = state.subCategories[0].id ?? 0;
        }
      },
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is SubCategoriesLoadingState &&
              subCategories[categoryId.toString()] == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (subCategories[categoryId.toString()] == null ||
              subCategories[categoryId.toString()]!.isEmpty) {
            return Image.asset(Assets.assetsImagesEmpty);
          }
          return ListView.separated(
            padding: const EdgeInsets.only(
              bottom: 8,
              left: 8,
              right: 8,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: subCategories[categoryId.toString()]!.length,
            separatorBuilder: (context, index) => const Gap(20),
            itemBuilder: (context, index) {
              return selectedIndex.value ==
                      subCategories[categoryId.toString()]![index].id
                  ? SelecetedSubCategoryListItem(
                      categoryModel:
                          subCategories[categoryId.toString()]![index],
                    )
                  : GestureDetector(
                      onTap: () {
                        selectedIndex.value =
                            subCategories[categoryId.toString()]![index].id!;
                        context
                            .read<CategoriesCubit>()
                            .changeSelectedSubCategoryId(
                                subCategories[categoryId.toString()]![index]
                                    .id!);
                      },
                      child: UnSelecetedSubCategoryListItem(
                        categoryModel:
                            subCategories[categoryId.toString()]![index],
                      ),
                    );
            },
          );
        },
      ),
    );
  }
}

class UnSelecetedSubCategoryListItem extends StatelessWidget {
  final CategoryModel categoryModel;
  const UnSelecetedSubCategoryListItem({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(
                top: 12,
                right: 8,
                left: 8,
              ),
              alignment: Alignment.center,
              height: 115,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Text(
                categoryModel.name ?? '',
                style: TextStyles.black16Medium,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 80,
              width: 80,
              child: CachedNetworkImageWidget(
                url: categoryModel.img ?? '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelecetedSubCategoryListItem extends HookWidget {
  final CategoryModel categoryModel;
  const SelecetedSubCategoryListItem({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    int subCategoryId = context.watch<CategoriesCubit>().selectedSubCategoryId;

    useEffect(() {
      log(name: 'subCategoryId', '$subCategoryId');
      context.read<CategoriesCubit>().fetchMealsBySubCategories(
            subCategoryId.toString(),
          );
      return null;
    }, [subCategoryId]);
    return SizedBox(
      width: 150,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(
                top: 12,
                right: 8,
                left: 8,
              ),
              alignment: Alignment.center,
              height: 115,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: AppColors.primaryColor,
                  )),
              child: Text(
                categoryModel.name ?? '',
                style: TextStyles.black16Medium,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 80,
              width: 80,
              child: CachedNetworkImageWidget(
                url: categoryModel.img ?? '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
