import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:single_resturant_app/features/auth/presentation/views/reset_password_view.dart';
import 'package:single_resturant_app/core/widgets/custom_navigator_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/custom_bottom_text_action.dart';
import '../widgets/custom_page_title.dart';
import '../widgets/custom_verification_text_field.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                  title: 'Verify Your Phone',
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 50.0, horizontal: 28),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Please Enter The 4 Digits Code Sent To Your Mobile Number",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8A8A8A),
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  height: 80,
                  width: MediaQuery.sizeOf(context).width,
                  child: Center(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: index == 3
                                ? EdgeInsets.zero
                                : const EdgeInsets.only(right: 21.0),
                            child: CustomVerificationTextField(
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                            ),
                          );
                        }),
                  ),
                ),
                CustomNavigatorButton(title: "Verify", onPressed: (){
                  if (formKey.currentState!.validate()) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ResetPasswordView()));
                  }
                }, padding: 50,),
                CustomBottomTextAction(
                  onTap: () {},
                  textOne: "Didn’t receive code.",
                  textTwo: "Resend ( 40s )",
                  textOneColor: const Color(0xff8A8A8A),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
