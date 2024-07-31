import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../checkout/presentation/widgets/custom_on_button.dart';

class MoreInformationContainer extends StatelessWidget {
  const MoreInformationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "Language",
      "About Us",
      "Terms & Conditions",
      "Notifications",
      "Theme",
    ];
    List<String> icons = [
      "global",
      "info",
      "conditions",
      "notification",
      "theme",
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 32,
        ),
        const Text(
          "More Informations",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          //   height: MediaQuery.sizeOf(context).height * 0.5,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xffF4F4F4))),
                  child: ListTile(
                    title: Text(
                      titles[index],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff5C5C5C),
                      ),
                    ),
                    leading:
                        Image.asset("assets/icons/profile/${icons[index]}.png"),
                    trailing: index == 0
                        ? const Text(
                            "ENG",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: AppColors.primaryColor,
                            ),
                          )
                        : index == 4
                            ? const CustomOnButton()
                            : Image.asset(
                                "assets/icons/profile/arrow_right.png" , color: AppColors.primaryColor,),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
