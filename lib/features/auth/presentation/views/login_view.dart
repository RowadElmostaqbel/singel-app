import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:single_resturant_app/core/utils/api_services.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/widgets/custom_toast_widget.dart';
import 'package:single_resturant_app/features/auth/presentation/manager/login_cubit.dart';
import 'package:single_resturant_app/features/auth/presentation/views/sign_up_view.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../bottom_nav/presentation/views/bottom_nav_view.dart';
import '../../data/repo/login_repo.dart';
import '../widgets/custom_bottom_text_action.dart';
import '../../../../core/widgets/custom_navigator_button.dart';
import '../widgets/custom_or_spacer.dart';
import '../widgets/custom_page_title.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/guest_action_text.dart';
import '../widgets/social_media.dart';
import 'forget_password_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isChecked = false;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            context.navigateTo(const BottomNavView());
          } else if (state is LoginFailureState) {
            showTaost(state.failure, Colors.redAccent);
          }
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    print('state now is $state');
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        const CustomPageTitle(
                          title: 'Login',
                        ),
                        CustomTextFormField(
                          label: 'Phone Number',
                          hintText: '0123456789',
                          controller: phone,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                          ]),
                          icon: 'assets/icons/phone.png',
                          keyboardType: TextInputType.phone,
                          onChanged: (String phone) {
                            BlocProvider.of<LoginCubit>(context)
                                .enterPhoneNumber(phone);
                          },
                        ),
                        CustomTextFormField(
                          label: 'Password',
                          hintText: '********',
                          obscureText: true,
                          controller: password,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          icon: 'assets/icons/lock.png',
                          keyboardType: TextInputType.name,
                          onChanged: (String password) {
                            BlocProvider.of<LoginCubit>(context)
                                .enterPassword(password);
                          },
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
                            const Text(
                              "Save me",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                color: Color(0xffB7B7B7),
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgetPasswordView()));
                              },
                              child: const Text(
                                "Forgot Your Password?",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.primaryColor,
                                  decorationThickness: 1,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        CustomNavigatorButton(
                          title: "Login",
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<LoginCubit>().login();
                              // BlocProvider.of<LoginCubit>(context).login();
                            }
                          },
                          padding: 50,
                        ),
                        CustomBottomTextAction(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SignUpView(),
                              ),
                            );
                          },
                          textOne: "Don't have an Account ? ",
                          textTwo: "Let's Sign Up",
                          textOneColor: Colors.black,
                        ),
                        const GuestActionText(),
                        const CustomOrSpacer(),
                        const SocialMedia()
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
