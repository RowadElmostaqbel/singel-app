import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Stack(children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.22,
              width: MediaQuery.sizeOf(context).width * 0.8,
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 16, left: 76, right: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Choose your Language",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("العربية"),
                          Padding(
                            padding: const EdgeInsets.only(right: 50.0),
                            child: Image.asset("assets/icons/selected_red_item.png"),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("English"),
                          Padding(
                            padding: const EdgeInsets.only(right: 50.0),
                            child: Image.asset("assets/icons/un_selected_item.png"),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: const BorderSide(
                                          color: AppColors.primaryColor))),
                              onPressed: () {},
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryColor,
                                  fontSize: 20,
                                ),
                              )),
                          SizedBox(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    )),
                                onPressed: () {},
                                child: const Text(
                                  "Confirm",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 300,
          left: 50,
          child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                  color: AppColors.primaryColor, shape: BoxShape.circle),
              child: Image.asset("assets/icons/translation.png")),
        ),
        Positioned(
          top: 425,
          left: 35,
          child: Image.asset("assets/images/dialog_decoration.png"),
        ),
      ]),
    );
  }
}
