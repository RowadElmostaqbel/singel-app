import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../core/widgets/custom_navigator_button.dart';
import '../widgets/custom_page_title.dart';
import '../widgets/custom_text_form_field.dart';
import 'login_view.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
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
                const Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: CustomPageTitle(
                    title: 'Reset Your Password',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 50.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    "At least 9 characters, with uppercase, lowercase letters and numbers",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      color: Color(0xff8A8A8A),
                      fontSize: 18,
                    ),
                  ),
                ),
                CustomTextFormField(
                  controller: newPassword,
                  label: "New Password",
                  obscureText: true,
                  hintText: "********",
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  icon: 'assets/icons/lock.png',
                  keyboardType: TextInputType.name,
                  onChanged: (String) {},
                ),
                CustomTextFormField(
                  controller: confirmPassword,
                  label: "Confirm Password",
                  obscureText: true,
                  hintText: "********",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please repeat your password";
                    } else if (newPassword.text != confirmPassword.text) {
                      return "Please enter the same password";
                    }
                    return null;
                  },
                  icon: 'assets/icons/lock.png',
                  keyboardType: TextInputType.name,
                  onChanged: (String) {},
                ),
                CustomNavigatorButton(
                  title: 'Save',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ),
                      );
                    }
                  },
                  padding: 50,
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
