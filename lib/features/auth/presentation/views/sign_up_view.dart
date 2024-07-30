import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:single_resturant_app/features/auth/presentation/manager/user_cubit.dart';
import 'package:single_resturant_app/features/auth/presentation/widgets/social_media.dart';
import 'package:single_resturant_app/features/auth/presentation/widgets/terms_and_conditions_row.dart';

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
  File? _image;
  final picker = ImagePicker();

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
              child: BlocConsumer<UserCubit, UserState>(
                listener: (context, state) {
                  print('state now is $state');
                },
                builder: (context, state) {
                  return Column(
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
                      CustomPhotoContainer(
                        mainImage: _image == null
                            ? Image.asset("assets/images/person.png")
                            : Image.file(_image!),
                        onPressedGallery: () async {
                          var image = await picker.pickImage(
                              source: ImageSource.gallery);
                          _image = File(image!.path);
                          BlocProvider.of<UserCubit>(context).uploadImage(_image!);
                          // await BlocProvider.of<UserCubit>(context)
                          //     .addImage(_image!);
                        },
                        onPressedCamera: () async {
                          var image = await picker.pickImage(
                              source: ImageSource.camera);
                          _image = File(image!.path);
                          BlocProvider.of<UserCubit>(context).uploadImage(_image!);
                          // await BlocProvider.of<UserCubit>(context)
                          //     .addImage(_image!);
                        },
                      ),
                      CustomTextFormField(
                        label: 'User Name',
                        hintText: 'Enter Your Name',
                        obscureText: false,
                        controller: userName,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        icon: 'assets/icons/profile.png',
                        keyboardType: TextInputType.name,
                        onChanged: (String name) {
                          BlocProvider.of<UserCubit>(context).addUserName(name);
                        },
                      ),
                      CustomTextFormField(
                        label: 'Email',
                        hintText: 'example@gmail.com',
                        controller: email,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                        icon: 'assets/icons/sms.png',
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (String email) {
                          BlocProvider.of<UserCubit>(context).addEmail(email);
                        },
                      ),
                      CustomTextFormField(
                        label: 'Phone Number',
                        hintText: '0123456789',
                        controller: mobile,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        icon: 'assets/icons/phone.png',
                        keyboardType: TextInputType.phone,
                        onChanged: (String phone) {
                          BlocProvider.of<UserCubit>(context)
                              .addPhoneNumber(phone);
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
                          BlocProvider.of<UserCubit>(context)
                              .addPassword(password);
                        },
                      ),
                      CustomTextFormField(
                        label: 'Confirm Password',
                        hintText: '********',
                        obscureText: true,
                        controller: confirmPassword,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        icon: 'assets/icons/lock.png',
                        keyboardType: TextInputType.name,
                        onChanged: (String confirmPassword) {
                          BlocProvider.of<UserCubit>(context)
                              .addConfirmPassword(confirmPassword);
                        },
                      ),
                      const TermsAndConditionsRow(),
                      CustomNavigatorButton(
                        title: "Sign Up",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<UserCubit>(context).register();
                            //context.navigateTo(const BottomNavView());
                          }
                        },
                        padding: 50,
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
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
