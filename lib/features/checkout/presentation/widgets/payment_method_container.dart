import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/features/checkout/presentation/views/add_new_card_view.dart';
import 'package:single_resturant_app/features/checkout/presentation/widgets/wallet_dialog.dart';

class PaymentMethodContainer extends HookWidget {
  const PaymentMethodContainer({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> paymentMethods = ["Cash on delivery", "Credit Card", 'Wallet'];
    String iconsPath = "assets/icons/";
    List<String> paymentIcons = [
      ("${iconsPath}colored_money.png"),
      ("${iconsPath}colored_credit_card.png"),
      ("${iconsPath}colored_empty_wallet.png"),
    ];
    List paymentScreens = [const AddNewCardView(), const WalletDialog()];
    ValueNotifier<String> groupValue = useState(paymentMethods.first);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: paymentMethods.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(
                    0xffF4F4F4,
                  ),
                ),
              ),
              child: RadioListTile<String>(
                activeColor: AppColors.primaryColor,
                value: paymentMethods[index],
                groupValue: groupValue.value,
                onChanged: (val) {
                  groupValue.value = val!;
                  if (index == 1) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => paymentScreens[0]));
                  } else if (index == 2) {
                    showDialog(
                        context: context,
                        builder: (context) => paymentScreens[1]);
                  }
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      paymentMethods[index],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff5C5C5C),
                      ),
                    ),
                    Image.asset(paymentIcons[index])
                  ],
                ),
              ),
            );
          }),
    );
  }
}
