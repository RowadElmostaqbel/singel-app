import 'package:flutter/material.dart';
import 'package:single_resturant_app/features/auth/presentation/widgets/custom_text_form_field.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_navigator_button.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
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
            title: const Text("Change Password"),
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
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                      )),
                ),
              ],
            ),
            expandedHeight: 210,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 36),
              child: Column(
                children: [
                  CustomTextFormField(
                      controller: oldPassword,
                      label: "Old Password",
                      hintText: "************",
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        return null;
                      },
                      icon: "assets/icons/lock.png",
                      onChanged: (String value) {}),
                  CustomTextFormField(
                      controller: newPassword,
                      label: " New Password",
                      hintText: "************",
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        return null;
                      },
                      icon: "assets/icons/new_lock.png",
                      onChanged: (String value) {}),
                  CustomTextFormField(
                      controller: confirmPassword,
                      label: "Confirm Password",
                      hintText: "************",
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        return null;
                      },
                      icon: "assets/icons/new_lock.png",
                      onChanged: (String value) {}),
                  CustomNavigatorButton(
                      title: "Save", onPressed: () {}, padding: 50),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
