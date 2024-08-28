import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/features/checkout/presentation/widgets/custom_address_container.dart';
import 'package:single_resturant_app/features/my_address/data/models/addresses.dart';
import 'package:single_resturant_app/features/my_address/presentation/manager/address_cubit.dart';
import 'package:single_resturant_app/features/my_address/presentation/views/no_address_view.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/add_new_address_dialog.dart';
import '../../../checkout/presentation/widgets/custom_add_button.dart';

class MyAddressView extends HookWidget {
  const MyAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<AddressCubit>().fetchMyAddresses();
      return null;
    }, []);
    final List<AddressModel> addressess =
        context.watch<AddressCubit>().addresses;
    return Scaffold(
      body: BlocConsumer<AddressCubit, AddressState>(
        listener: (context, state) {
          if (state is DeleteAddressSuccessState ||
              state is SendAddressToServerLoadedState) {
            context.read<AddressCubit>().fetchMyAddresses();
          }
        },
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: Align(
                  alignment: const Alignment(1.5, 0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.5),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 15,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                snap: false,
                pinned: false,
                floating: false,
                stretch: true,
                title: const Text("My Address"),
                titleTextStyle: TextStyles.white18SemiBold,
                centerTitle: true,
                flexibleSpace: Stack(
                  children: [
                    FlexibleSpaceBar(
                      background: Image.asset(
                        "assets/images/profile_background.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          height: 80,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50)),
                          )),
                    ),
                  ],
                ),
                expandedHeight: 180,
              ),
              if (state is FetchAddressLoadingState && addressess.isEmpty)
                const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              if (state is FetchAddressSuccessState && addressess.isEmpty)
                const SliverToBoxAdapter(
                  child: NoAddressView(),
                ),
              if (addressess.isNotEmpty) ...[
                const SliverToBoxAdapter(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: AddNewAddressBtn(),
                  ),
                ),
                SliverList.separated(
                  itemCount: addressess.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: CustomAddressContainer(
                        containerBorderColor: AppColors.greyColor,
                        address: addressess[index],
                        deleteAddress: () {
                          BlocProvider.of<AddressCubit>(context)
                              .deleteAddress(addressess[index].id);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Gap(
                    16,
                  ),
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}

class AddNewAddressBtn extends StatelessWidget {
  const AddNewAddressBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => const AddNewAddressDialog(),
      ),
      child: Container(
        margin: const EdgeInsets.only(
          right: 16,
          bottom: 12,
        ),
        alignment: Alignment.center,
        width: 120,
        height: 36,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.primaryColor.withOpacity(.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: AppColors.primaryColor,
                size: 20,
              ),
            ),
            const Text(
              'Add New',
              style: TextStyles.primary14SemiBold,
            ),
          ],
        ),
      ),
    );
  }
}

// >>>>>> add new address dialog

// Positioned(
// left: 100,
// child: GestureDetector(
// onTap: (){showDialog(
// context: context,
// builder: (context) {
// return const AddNewAddressDialog();
// });},
// child: const CustomAddButton()),
// ),