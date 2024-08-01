import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/widgets/custom_navigator_button.dart';
import 'package:single_resturant_app/features/auth/presentation/widgets/custom_text_form_field.dart';

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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextFormField(
                            controller: username,
                            label: "User Name",
                            hintText: "Enter your Name",
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              return null;
                            },
                            icon: "assets/icons/red_profile.png",
                            onChanged: (value) {}),
                        CustomTextFormField(
                            controller: username,
                            label: "Email",
                            hintText: "example@gmail.com",
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              return null;
                            },
                            icon: "assets/icons/sms.png",
                            onChanged: (value) {}),
                        CustomTextFormField(
                            controller: username,
                            label: "Phone Number",
                            hintText: "0123456789",
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              return null;
                            },
                            icon: "assets/icons/phone.png",
                            onChanged: (value) {}),
                        CustomTextFormField(
                            controller: username,
                            label: "Message Type",
                            hintText: "select one",
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              return null;
                            },
                            icon: "assets/icons/message.png",
                            onChanged: (value) {}),
                        const CustomDropDownButtonFormField(
                          dropDownList: [
                            "Order",
                            "Suggestion",
                            "Inquiry",
                            "Complaint",
                            "Other"
                          ],
                          label: 'Message Type', icon:"assets/icons/message.png",
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: SizedBox(
                            height: 78,
                            child: Stack(
                              children: [
                                SizedBox(
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      return null;
                                    },
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
                            title: "Send Message", onPressed: () {}, padding: 0)
                      ],
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
