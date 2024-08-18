import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:single_resturant_app/core/widgets/custom_toast_widget.dart';
import 'package:single_resturant_app/features/checkout/presentation/controllers/checkout_cubit.dart';
import 'package:single_resturant_app/features/checkout/presentation/widgets/reservation_way_container.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_navigator_button.dart';
import '../../../../core/widgets/add_new_address_dialog.dart';
import '../../../my_address/data/models/addresses.dart';
import '../../../my_address/presentation/manager/address_cubit.dart';
import '../widgets/custom_price_container.dart';
import '../widgets/custom_address_container.dart';
import '../widgets/custom_main_row.dart';
import '../widgets/order_done_dialog.dart';
import '../widgets/payment_method_container.dart';
import '../widgets/time_options_container.dart';

class CheckoutView extends HookWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<AddressCubit>().fetchMyAddresses();
      return null;
    }, []);
    final List<Addresses> addressess = context.watch<AddressCubit>().addresses;
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutSuccess) {
          showDialog(
            context: context,
            builder: (context) {
              return const OrderDoneDialog();
            },
          );
        } else if (state is CheckoutFailure) {
          showTaost(state.error, Colors.redAccent);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
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
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            title: const Text(
              "Checkout",
              style: TextStyles.black16SemiBold,
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomMainRow(
                    title: 'Delivery Address',
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AddNewAddressDialog();
                          });
                    },
                  ),
                  SizedBox(
                    height: 143,
                    child: BlocListener<AddressCubit, AddressState>(
                      listener: (context, state) {
                        if (state is SendAddressToServerLoadedState) {
                          context.read<AddressCubit>().fetchMyAddresses();
                        }
                      },
                      child: BlocBuilder<AddressCubit, AddressState>(
                        builder: (context, state) {
                          if (addressess.isNotEmpty) {
                            return MyAddressesListView(addressess: addressess);
                          } else if (state is FetchAddressLoadingState &&
                              addressess.isEmpty) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                  ),
                  const Text(
                    "Time Options",
                    style: TextStyles.black16SemiBold,
                  ),
                  const TimeOptionsContainer(),
                  const Text(
                    "Reservation Way",
                    style: TextStyles.black16SemiBold,
                  ),
                  const ReservationWayContainer(),
                  const Text(
                    "Payment Methods",
                    style: TextStyles.black16SemiBold,
                  ),
                  const PaymentMethodContainer(),
                  // const Padding(
                  //   padding: EdgeInsets.only(top: 20, bottom: 8.0),
                  //   child: Text(
                  //     "Coupons",
                  //     style: TextStyles.black16SemiBold,
                  //   ),
                  // ),
                  // const CustomCouponRow(),
                  const CustomPriceContainer(),
                  CustomNavigatorButton(
                    title: "Order Now",
                    onPressed: () {
                      context.read<CheckoutCubit>().checkout();
                    },
                    padding: 20,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MyAddressesListView extends HookWidget {
  const MyAddressesListView({
    super.key,
    required this.addressess,
  });

  final List<Addresses> addressess;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> selectedIndex = useState(-1);
    return ListView.separated(
      itemCount: addressess.length,
      separatorBuilder: (context, index) => const Gap(10),
      itemBuilder: (context, index) => selectedIndex.value == index
          ? CustomAddressContainer(
              containerBorderColor: AppColors.primaryColor,
              address: addressess[index],
            )
          : GestureDetector(
              onTap: () {
                selectedIndex.value = index;
                context.read<CheckoutCubit>().addDeliveryAddressToDataModel(
                      addressess[selectedIndex.value].id.toString(),
                    );
              },
              child: CustomAddressContainer(
                containerBorderColor: AppColors.greyColor,
                address: addressess[index],
              ),
            ),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
    );
  }
}
