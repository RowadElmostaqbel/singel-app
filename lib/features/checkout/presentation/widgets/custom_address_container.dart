import 'package:flutter/material.dart';
import 'package:single_resturant_app/features/my_address/data/models/addresses.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class CustomAddressContainer extends StatelessWidget {
  final AddressModel address;
  const CustomAddressContainer({
    super.key,
    required this.containerBorderColor,
    required this.address, required this.deleteAddress,
  });
  final Color containerBorderColor;
  final void Function()? deleteAddress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 16, 30),
      child: Container(
        padding: const EdgeInsets.all(12),
        //margin: const EdgeInsets.fromLTRB(0, 30, 16, 30),
        height: 82,
        width: 205,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: containerBorderColor,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      address.name ?? '',
                      style: TextStyles.black14Regular,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Image.asset("assets/icons/edit.png",
                        color: AppColors.primaryColor),
                  ],
                ),
                 GestureDetector(
                   onTap: deleteAddress,
                   child: Image.asset(
                     "assets/icons/delete_address.png",
                     width: 15,
                     color: const Color(0xff5C5C5C),
                   ),
                 )
              ],
            ),
            Row(
              children: [
                Image.asset("assets/icons/call.png"),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  address.phone ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xff5C5C5C),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Image.asset("assets/icons/gray_location.png"),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  address.details ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xff5C5C5C),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
