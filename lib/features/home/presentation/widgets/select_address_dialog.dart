import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:single_resturant_app/core/utils/cache_service.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/widgets/add_new_address_dialog.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../my_address/data/models/addresses.dart';
import '../../../my_address/presentation/manager/address_cubit.dart';

class SelectAddressDialog extends HookWidget {
   SelectAddressDialog({
    super.key,
  });
  late int indexAddress;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<AddressCubit>().fetchMyAddresses();
      return null;
    }, []);
    final List<AddressModel> addresses =
        context.watch<AddressCubit>().addresses;
    ValueNotifier<String> groupValue = useState(addresses[0].details!);
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.75,
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: addresses.length,
                        itemBuilder: (context, index) {
                          return RadioListTile<String>(
                            activeColor: AppColors.primaryColor,
                            value: addresses[index].details!,
                            groupValue: groupValue.value,
                            onChanged: (val) {
                              groupValue.value = val!;
                              indexAddress = index;
                            },
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      addresses[index].name!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff5C5C5C),
                                      ),
                                    ),
                                    Text(
                                      addresses[index].details!,
                                      style: TextStyles.brightBlack11SemiMedium,
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 34,
                                  width: 34,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF4F4F4),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SizedBox(
                                    child: Image.asset(
                                        "assets/icons/location_home.png",
                                        scale: 3),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),

                      // >>>>>>>>>>>> Static Data

                      // ListTile(
                      //   contentPadding: EdgeInsets.zero,
                      //   title: const Text(
                      //     "Home",
                      //     style: TextStyles.darkGrey14Regular,
                      //   ),
                      //   subtitle: const Text(
                      //     "El Huda We Elnoor, street",
                      //     style: TextStyles.brightBlack11SemiMedium,
                      //   ),
                      //   leading: Container(
                      //     height: 34,
                      //     width: 34,
                      //     decoration: BoxDecoration(
                      //       color: const Color(0xffF4F4F4),
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //     child: SizedBox(
                      //       child: Image.asset(
                      //         "assets/icons/location_home.png",
                      //         scale: 3,
                      //       ),
                      //     ),
                      //   ),
                      //   trailing: Image.asset("assets/icons/check.png"),
                      // ),
                      // ListTile(
                      //   contentPadding: EdgeInsets.zero,
                      //   title: const Text(
                      //     "Office",
                      //     style: TextStyles.darkGrey14Regular,
                      //   ),
                      //   subtitle: const Text(
                      //     "52 Riverside St.Norcross",
                      //     style: TextStyles.brightBlack11SemiMedium,
                      //   ),
                      //   leading:
                      //   Container(
                      //     height: 34,
                      //     width: 34,
                      //     decoration: BoxDecoration(
                      //       color: const Color(0xffF4F4F4),
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //     child: SizedBox(
                      //       child: Image.asset(
                      //           "assets/icons/location_home.png",
                      //           scale: 3),
                      //     ),
                      //   ),
                      //   trailing: Image.asset("assets/icons/unchecked.png"),
                      // ),
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
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            groupValue.value,
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
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const AddNewAddressDialog());
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
                                    print(indexAddress);
                                    CacheServiceHeper().storeData<int>(
                                        data: indexAddress!,
                                        boxName: 'index',
                                        key: "index");
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
