import 'package:flutter/material.dart';

import '../../../../core/widgets/add_new_address_dialog.dart';
import '../../../../core/widgets/custom_navigator_button.dart';

class NoAddressView extends StatelessWidget {
  const NoAddressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 36),
      child: Column(
        children: [
          Image.asset("assets/images/no_address.png"),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "No Address Yet",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            "Please add your address for your better experience",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color(0xff5C5C5C),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          CustomNavigatorButton(
            title: "Add Address",
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const AddNewAddressDialog();
                  });
            },
            padding: 0,
          ),
        ],
      ),
    );
  }
}
