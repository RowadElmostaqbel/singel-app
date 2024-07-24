import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/features/auth/presentation/widgets/social_media.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/custom_bottom_text_action.dart';
import '../../../../core/widgets/custom_navigator_button.dart';
import '../widgets/custom_or_spacer.dart';
import '../widgets/custom_page_title.dart';
import '../widgets/custom_photo_container.dart';
import '../widgets/custom_text_form_field.dart';
import 'login_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController userName = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Card(
                          elevation: 4,
                          color: Colors.white,
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const CustomPageTitle(
                    title: 'Sign Up',
                  ),
                  const CustomPhotoContainer(),
                  CustomTextFormField(
                    label: 'User Name',
                    hintText: 'Enter Your Name',
                    obscureText: true,
                    controller: userName,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    icon: 'assets/icons/profile.png', keyboardType: TextInputType.name,
                  ),
                  CustomTextFormField(
                    label: 'Email',
                    hintText: 'example@gmail.com',
                    controller: email,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                    icon: 'assets/icons/sms.png', keyboardType: TextInputType.emailAddress,
                  ),
                  CustomTextFormField(
                    label: 'Phone Number',
                    hintText: '0123456789',
                    controller: mobile,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    icon: 'assets/icons/phone.png', keyboardType: TextInputType.phone,
                  ),
                  CustomTextFormField(
                    label: 'Password',
                    hintText: '********',
                    obscureText: true,
                    controller: password,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    icon: 'assets/icons/lock.png', keyboardType: TextInputType.name,
                  ),
                  CustomTextFormField(
                    label: 'Confirm Password',
                    hintText: '********',
                    obscureText: true,
                    controller: confirmPassword,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    icon: 'assets/icons/lock.png', keyboardType: TextInputType.name,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          side: const BorderSide(
                            color: Color(0xffB7B7B7),
                          ),
                          activeColor: const Color(0xffB7B7B7),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          }),
                      RichText(
                          text: const TextSpan(
                              text: "By Clicking, you agree to ",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              children: [
                            TextSpan(
                              text: "Terms & Conditions",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryColor,
                                fontSize: 14,
                              ),
                            )
                          ])),
                    ],
                  ),
                  CustomNavigatorButton(
                    title: "Sign Up",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        //context.navigateTo(const BottomNavView());
                      }
                    }, padding: 50,
                  ),
                  CustomBottomTextAction(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginView()));
                    },
                    textOne: "Already have an Account ? ",
                    textTwo: "Login",
                    textOneColor: Colors.black,
                  ),
                  const CustomOrSpacer(),
                  const SocialMedia(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
