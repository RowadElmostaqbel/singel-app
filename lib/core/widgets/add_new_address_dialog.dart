import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/widgets/custom_toast_widget.dart';
import 'package:single_resturant_app/features/my_address/presentation/manager/address_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../features/checkout/presentation/widgets/card_text_form_filed.dart';
import '../../features/my_address/presentation/views/map_view.dart';

class AddNewAddressDialog extends StatefulWidget {
  const AddNewAddressDialog({super.key});

  @override
  State<AddNewAddressDialog> createState() => _AddNewAddressDialogState();
}

class _AddNewAddressDialogState extends State<AddNewAddressDialog> {
  TextEditingController contactTitle = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController addressLocation = TextEditingController();
  bool isTurnOn = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listener: (context, state) {
        if (state is SendAddressToServerFailureState) {
          showTaost(
            state.message,
            Colors.redAccent,
          );
        } else if (state is SendAddressToServerLoadedState) {
          context.pop();
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            content: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: SizedBox(
                height: context.height * 0.76,
                child: Column(
                  children: [
                    Container(
                      height: 47,
                      padding: const EdgeInsets.only(top: 8, right: 8),
                      color: AppColors.primaryColor,
                      width: MediaQuery.sizeOf(context).width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Add Address",
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
                    CardTextFormFiled(
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        return null;
                      },
                      hintText: "El Mansoura-25 street",
                      controller: contactTitle,
                      label: "Contact Title",
                      onChanged: (String title) {
                        BlocProvider.of<AddressCubit>(context)
                            .addAddressName(title);
                      },
                      inputFormatters: const [],
                    ),
                    Stack(
                      children: [
                        CardTextFormFiled(
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            return null;
                          },
                          hintText: "0123456789",
                          controller: phoneNumber,
                          label: "Phone Number",
                          onChanged: (String phone) {
                            BlocProvider.of<AddressCubit>(context)
                                .addAddressPhone(phone);
                          },
                          inputFormatters: const [],
                        ),
                        Positioned(
                          right: 24,
                          bottom: 23,
                          child: Container(
                            height: 54,
                            width: 54,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Image.asset("assets/icons/white_add.png"),
                          ),
                        )
                      ],
                    ),
                    CardTextFormFiled(
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        return null;
                      },
                      hintText: "Mansoura",
                      controller: city,
                      label: "City ",
                      onChanged: (String city) {
                        BlocProvider.of<AddressCubit>(context).addAddressCity();
                      },
                      inputFormatters: const [],
                    ),
                    CardTextFormFiled(
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        return null;
                      },
                      hintText: "El Mansoura-25 street",
                      controller: addressLocation,
                      label: "Address Location ",
                      onChanged: (String location) {
                        BlocProvider.of<AddressCubit>(context)
                            .addAddresDetails(location);
                      },
                      inputFormatters: const [],
                    ),
                    GestureDetector(
                      onTap: () => context
                          .navigateTo<LatLng>(
                        const MapView(),
                      )
                          .then((value) async {
                        context.read<AddressCubit>().addAddresLatlng(
                              value ?? const LatLng(0, 0),
                            );
                      }),
                      child: Image.asset(
                        "assets/images/map_location.png",
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 24, left: 24, top: 12),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isTurnOn = !isTurnOn;
                              });
                            },
                            child: Stack(children: [
                              Container(
                                height: 12,
                                width: 22,
                                decoration: BoxDecoration(
                                  color: isTurnOn
                                      ? AppColors.primaryColor
                                      : AppColors.greyColor,
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: Align(
                                  alignment: isTurnOn
                                      ? const Alignment(1, 0)
                                      : const Alignment(-1, 0),
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    margin: const EdgeInsets.all(1),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "Set as Default Address",
                            style: TextStyles.darkGrey14Regular,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      height: 56,
                      width: 280,
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
                                onPressed: () {
                                  BlocProvider.of<AddressCubit>(context)
                                      .addAddress();
                                },
                                child: state is SendAddressToServerLoadingState
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : const Text(
                                        "Confirm",
                                        style: TextStyle(
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
