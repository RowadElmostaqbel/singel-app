import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:single_resturant_app/core/errors/error_handler.dart';
import 'package:single_resturant_app/core/errors/failure.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/features/edit_password/presentation/views/edit_password.dart';
import 'package:single_resturant_app/features/wishlist/presentation/views/wishlist_view.dart';

import '../../../../core/utils/cache_service.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../edit_profile/presentation/screens/edit_profile_view.dart';
import '../../../my_address/presentation/views/my_address_view.dart';
import '../../../notifications/presentation/views/notifications_view.dart';
import '../../../orders/presentation/views/my_orders_view.dart';

class MyAccountContainer extends StatelessWidget {
  const MyAccountContainer({super.key});

  navigateIfLoggedIn(Widget screen, BuildContext context) {
    if (checkIfUserISLoggedIn()) {
      context.navigateTo(
        screen,
      );
    } else {
      ErrorHandler.handleError(
          failure: ServerFailure('', statusCode: 401), context: context);
    }
  }

  bool checkIfUserISLoggedIn() {
    return CacheServiceHeper()
            .getData<UserModel>(boxName: 'user', key: 'user') !=
        null;
  }

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "My Account",
      "My Orders",
      "My Address",
      "Notifications",
      "Edit password",
      "Wishlist",
    ];
    List<String> icons = [
      "person",
      "bag",
      "location",
      "notification",
      "lock",
      "heart",
    ];

    List<Function> functions = [
      () {
        navigateIfLoggedIn(const EditProfileView(), context);
      },
      () {
        navigateIfLoggedIn(const MyOrdersView(), context);
      },
      () {
        navigateIfLoggedIn(const MyAddressView(), context);
      },
      () {
        navigateIfLoggedIn(const NotificationsView(), context);
      },
      () {
        navigateIfLoggedIn(const EditPassword(), context);
      },
      () {
        navigateIfLoggedIn(const WishListView(), context);
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 32,
        ),
        const Text(
          "My Account",
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
          //height: MediaQuery.sizeOf(context).height * 0.64,
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
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => functions[index](),
                  child: Container(
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
                      leading: Image.asset(
                          "assets/icons/profile/${icons[index]}.png"),
                      trailing:
                          Image.asset("assets/icons/profile/arrow_right.png"),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
