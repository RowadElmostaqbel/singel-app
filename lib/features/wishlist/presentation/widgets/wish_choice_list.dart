import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class WishChoiceList extends StatelessWidget {
  const WishChoiceList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> restaurantChoice = ["Restaurant", "Meals", "Offer"];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 70,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: restaurantChoice.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: index == 0
                    ? Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              const Color(0xffFE724C).withOpacity(0.01),
                              Colors.white
                            ], begin: Alignment.topCenter, end: Alignment.center),
                            border: const Border(
                                top: BorderSide(
                              width: 2,
                              color: Color(0xffFD784D),
                            ))),
                        margin: const EdgeInsets.only(top: 25, right: 60),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        height: 40,
                        child: Center(
                          child: Text(
                            restaurantChoice[index],
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryColor),
                          ),
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.only(top: 25, right: 60),
                        padding: const EdgeInsets.only(right: 0),
                        height: 40,
                        child: Center(
                          child: Text(
                            restaurantChoice[index],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff5C5C5C),
                            ),
                          ),
                        ),
                      ),
              );
            }),
      ),
    );
  }
}
