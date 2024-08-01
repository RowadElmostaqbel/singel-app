import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:single_resturant_app/core/widgets/custom_navigator_button.dart';
import 'package:single_resturant_app/features/my_address/presentation/manager/address_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/add_new_address_dialog.dart';

class MyAddressView extends StatefulWidget {
  const MyAddressView({super.key});

  @override
  State<MyAddressView> createState() => _MyAddressViewState();
}

class _MyAddressViewState extends State<MyAddressView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 36),
              child: Column(
                children: [
                  Image.asset("assets/images/no_address.png"),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "No Address Yet",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    "Please add your address for your better experience",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff5C5C5C),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomNavigatorButton(
                      title: "Add Address",
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AddNewAddressDialog();
                            });
                      },
                      padding: 0),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
