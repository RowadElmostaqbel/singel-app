import 'package:flutter/material.dart';
import 'package:single_resturant_app/features/checkout/presentation/views/add_new_card_view.dart';
import 'package:single_resturant_app/features/checkout/presentation/widgets/wallet_dialog.dart';

class PaymentMethodContainer extends StatelessWidget {
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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: MediaQuery.sizeOf(context).height * 0.29,
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
            return GestureDetector(
              onTap: index == 0
                  ? () {}
                  : index == 1
                      ? () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => paymentScreens[0]));
                        }
                      : () {
                         showDialog(context: context, builder: (context)=>paymentScreens[1]);
                        },
              child: Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xffF4F4F4))),
                child: ListTile(
                  title: Text(
                    paymentMethods[index],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff5C5C5C),
                    ),
                  ),
                  leading: Image.asset(paymentIcons[index]),
                  trailing: index == 0
                      ? Image.asset("assets/icons/checked.png")
                      : Image.asset("assets/icons/unchecked.png"),
                ),
              ),
            );
          }),
    );
  }
}
