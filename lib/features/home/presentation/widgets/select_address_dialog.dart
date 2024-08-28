import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class SelectAddressDialog extends HookWidget {
  const SelectAddressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> paymentMethods = [
      "On Site",
      "Delivery",
    ];
    String iconsPath = "assets/icons/";
    List<String> paymentIcons = [
      ("${iconsPath}on_site.png"),
      ("${iconsPath}delivery_ic.png"),
    ];
    ValueNotifier<String> groupValue = useState("On Site");
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.55,
            width: MediaQuery.sizeOf(context).width * 0.75,
            child: Column(
              children: [
                Container(
                  height: 47,
                  padding: const EdgeInsets.only(top: 8),
                  color: AppColors.primaryColor,
                  width: MediaQuery.sizeOf(context).width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Select Address",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: context.width * 0.2,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  "assets/icons/delete.png",
                                  color: Colors.white,
                                  scale: 0.7,
                                )),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const Text(
                        "Specify an address to be delivered to",
                        style: TextStyles.grey14Regular,
                      ),
                      // ListView.builder(
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   itemCount: paymentMethods.length,
                      //   itemBuilder: (context, index) {
                      //     return RadioListTile<String>(
                      //       activeColor: AppColors.primaryColor,
                      //       value: paymentMethods[index],
                      //       groupValue: groupValue.value,
                      //       onChanged: (val) {
                      //         groupValue.value = val.toString();
                      //       },
                      //       title: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Text(
                      //             paymentMethods[index],
                      //             style: const TextStyle(
                      //               fontSize: 16,
                      //               fontWeight: FontWeight.w500,
                      //               color: Color(0xff5C5C5C),
                      //             ),
                      //           ),
                      //           Image.asset(paymentIcons[index])
                      //         ],
                      //       ),
                      //     );
                      //   },
                      // ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text(
                          "Home",
                          style: TextStyles.darkGrey14Regular,
                        ),
                        subtitle: const Text(
                          "El Huda We Elnoor, street",
                          style: TextStyles.brightBlack11SemiMedium,
                        ),
                        leading: Container(
                          height: 34,
                          width: 34,
                          decoration: BoxDecoration(
                            color: const Color(0xffF4F4F4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SizedBox(
                            child: Image.asset(
                              "assets/icons/location_home.png",
                              scale: 3,
                            ),
                          ),
                        ),
                        trailing: Image.asset("assets/icons/check.png"),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text(
                          "Office",
                          style: TextStyles.darkGrey14Regular,
                        ),
                        subtitle: const Text(
                          "52 Riverside St.Norcross",
                          style: TextStyles.brightBlack11SemiMedium,
                        ),
                        leading: Container(
                          height: 34,
                          width: 34,
                          decoration: BoxDecoration(
                            color: const Color(0xffF4F4F4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SizedBox(
                            child: Image.asset("assets/icons/location_home.png",
                                scale: 3),
                          ),
                        ),
                        trailing: Image.asset("assets/icons/unchecked.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 1,
                          color: const Color(0xffE0E0E0),
                        ),
                      ),
                      const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Your current location",
                            style: TextStyles.black14Regular,
                          )),
                      const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Mansoura, Hay Elgama, street",
                            style: TextStyles.brightBlack11SemiMedium,
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: InkWell(
                            onTap: () {
                              //context.navigateTo(const CustomMap());
                            },
                            child: SizedBox(
                                width: MediaQuery.sizeOf(context).width,
                                child: Image.asset(
                                  "assets/images/map_location.png",
                                  fit: BoxFit.fitWidth,
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: const BorderSide(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                context.pop();
                              },
                              child: const Text(
                                "Add New",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryColor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      )),
                                  onPressed: () {
                                    context.pop();
                                  },
                                  child: const Text(
                                    "Confirm",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      )
                      //const CustomConfirmationButton(),
                      //const CustomCancelButton(),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
