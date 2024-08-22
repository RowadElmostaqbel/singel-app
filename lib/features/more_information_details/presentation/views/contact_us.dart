import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:single_resturant_app/core/widgets/custom_navigator_button.dart';
import 'package:single_resturant_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:single_resturant_app/features/more_information_details/presentation/controllers/contact_us_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_drop_down_button_form_field.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  List icons = ["snapchat", "facebook", "x", "Instagram", "tiktok"];
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController textMessage = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
            title: const Text("Contact Us"),
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
                            topLeft: Radius.circular(80),
                            topRight: Radius.circular(80)),
                      )),
                ),
              ],
            ),
            expandedHeight: 120,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Connection Information with Management :",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    margin: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                            color: AppColors.greyColor,
                            blurRadius: 2,
                            spreadRadius: 0.5)
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.greyColor,
                                      blurRadius: 2,
                                      spreadRadius: 0.5),
                                ],
                              ),
                              child: Image.asset("assets/icons/phone.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              "96678754546",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.greyColor,
                                      blurRadius: 2,
                                      spreadRadius: 0.5),
                                ],
                              ),
                              child: Image.asset("assets/icons/whatsapp.png"),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              "http//: what’s App.com",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Color(0xff007AFF),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          "Connect through :",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.sizeOf(context).width,
                          child: ListView.builder(
                              itemCount: icons.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.greyColor,
                                          blurRadius: 2,
                                          spreadRadius: 0.5),
                                    ],
                                  ),
                                  child: Image.asset(
                                      "assets/icons/${icons[index]}.png"),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "Send Message :",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                            color: AppColors.greyColor,
                            blurRadius: 2,
                            spreadRadius: 0.5)
                      ],
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextFormField(
                              controller: username,
                              label: "User Name",
                              hintText: "Enter your Name",
                              keyboardType: TextInputType.name,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              icon: "assets/icons/red_profile.png",
                              onChanged: (userName) {
                                BlocProvider.of<ContactUsCubit>(context)
                                    .addUserName(userName);
                              }),
                          CustomTextFormField(
                              controller: email,
                              label: "Email",
                              hintText: "example@gmail.com",
                              keyboardType: TextInputType.name,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.email(),
                              ]),
                              icon: "assets/icons/sms.png",
                              onChanged: (email) {
                                BlocProvider.of<ContactUsCubit>(context)
                                    .addEmail(email);
                              }),
                          CustomTextFormField(
                              controller: phone,
                              label: "Phone Number",
                              hintText: "0123456789",
                              keyboardType: TextInputType.number,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.phoneNumber(),
                              ]),
                              icon: "assets/icons/phone.png",
                              onChanged: (phone) {
                                BlocProvider.of<ContactUsCubit>(context)
                                    .addPhone(phone);
                              }),
                          CustomDropDownButtonFormField(
                            dropDownList: const [
                              "Order",
                              "Suggestion",
                              "Inquiry",
                              "Complaint",
                              "Other"
                            ],
                            label: 'Message Type',
                            icon: "assets/icons/message.png",
                            onChanged: (String? messageType) {
                              BlocProvider.of<ContactUsCubit>(context)
                                  .messageType(messageType!);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: SizedBox(
                              height: 78,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    child: TextFormField(
                                      onChanged: (message) {
                                        BlocProvider.of<ContactUsCubit>(context)
                                            .addMessage(message);
                                      },
                                      controller: textMessage,
                                      keyboardType: TextInputType.text,
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                      ]),
                                      decoration: InputDecoration(
                                        hintMaxLines: 3,
                                        hintText: "Type Here...",
                                        hintStyle: TextStyles.grey14Regular,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          borderSide: const BorderSide(
                                            color: Color(0xffE9E9E9),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          borderSide: const BorderSide(
                                            color: Color(0xffE9E9E9),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          borderSide: const BorderSide(
                                            color: Color(0xffE9E9E9),
                                            width: 1.5,
                                          ),
                                        ),
                                      ),
                                      //controller: controller,
                                    ),
                                  ),
                                  Align(
                                    alignment: const Alignment(0, -1.9),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6),
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              "assets/icons/message_text.png"),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          const Text("Message Text",
                                              style: TextStyles.black14Bold),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CustomNavigatorButton(
                              title: "Send Message",
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<ContactUsCubit>(context)
                                      .sendMessage();
                                  Navigator.of(context).pop();
                                }
                              },
                              padding: 0)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
