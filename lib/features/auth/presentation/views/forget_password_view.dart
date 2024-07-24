import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/features/auth/presentation/views/verification_view.dart';
import 'package:single_resturant_app/core/widgets/custom_navigator_button.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/custom_page_title.dart';
import '../widgets/custom_text_form_field.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController mobile = TextEditingController();
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
                  title: 'Forget Password',
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 50.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Enter your mobile number  to receive a verification code",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8A8A8A),
                      fontSize: 16,
                    ),
                  ),
                ),
                CustomTextFormField(
                  controller: mobile,
                  label: "Phone Number",
                  hintText: "0123456789",
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  icon: 'assets/icons/phone.png',
                  keyboardType: TextInputType.phone,
                ),
                CustomNavigatorButton(
                    title: "Send Message",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.navigateTo(const VerificationView());
                      }
                    }, padding: 50,)
              ],
            ),
          ),
        )),
      ),
    );
  }
}
