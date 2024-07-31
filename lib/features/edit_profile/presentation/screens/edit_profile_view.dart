import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../profile/presentation/widgets/custom_photo_container.dart';
import '../widgets/edit_profile_text_form_field.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

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
                child: const SizedBox(
                  height: 40,
                  width: 40,
                  child: Card(
                    elevation: 4,
                    color: Colors.white,
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Color(0xffFD784D),
                    ),
                  ),
                ),
              ),
            ),
            snap: false,
            pinned: false,
            floating: false,
            stretch: true,
            flexibleSpace: Stack(
              children: [
                FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/images/profile_background.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const CustomPhotoContainer(),
              ],
            ),
            expandedHeight: 250,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
              child: Form(
                child: Column(
                  children: [const SizedBox(height: 50,),
                    EditProfileTextFormField(
                      initialValue: 'Mohamed Ali',
                      prefixIcon:
                          Image.asset("assets/icons/profile/person.png"),
                    ),
                    const SizedBox(height: 16,),
                    EditProfileTextFormField(
                      initialValue: 'Mohamed Ali @gmail.com',
                      prefixIcon: Image.asset("assets/icons/profile/email.png"),
                    ),
                    const SizedBox(height: 16,),
                    EditProfileTextFormField(
                      initialValue: '+96676438754',
                      prefixIcon: Image.asset("assets/icons/profile/phone.png"),
                    ),
                    const SizedBox(height: 16,),
                    EditProfileTextFormField(
                      initialValue: '*************',
                      prefixIcon: Image.asset("assets/icons/profile/lock.png"),
                    ),
                    const SizedBox(height: 80,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        height: 56,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 56,
                              width: MediaQuery.sizeOf(context).width,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      )),
                                  onPressed:(){},
                                  child: Text(
                                    "Save",
                                    style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  )),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward_outlined,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
