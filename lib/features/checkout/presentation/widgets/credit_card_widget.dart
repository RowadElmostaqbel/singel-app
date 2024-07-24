import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../../../../core/utils/app_colors.dart';

class CreditCard extends StatelessWidget {
  CreditCard(
      {super.key,
      this.isCvvFocused = false,
      required this.cardNumber,
      required this.expiryDate,
      required this.cardHolderName,
      required this.cvvCode});

  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  bool isCvvFocused;

  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      enableFloatingCard: true,
      floatingConfig: const FloatingConfig(
        isGlareEnabled: true,
        isShadowEnabled: true,
        shadowConfig: FloatingShadowConfig(
          offset: Offset(2, 2),
          color: AppColors.primaryColor,
          blurRadius: 5,
        ),
      ),
      //backgroundNetworkImage: 'https://www.xyz.com/card_bg.png',
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      bankName: 'Axis Bank',
      frontCardBorder: Border.all(color: Colors.grey),
      backCardBorder: Border.all(color: Colors.grey),
      showBackView: isCvvFocused,
      obscureCardNumber: true,
      obscureCardCvv: true,
      isHolderNameVisible: true,
      cardBgColor: AppColors.primaryColor,
      //backgroundImage: useBackgroundImage ? 'assets/card_bg.png' : null,
      isSwipeGestureEnabled: true,
      onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
      customCardTypeIcons: <CustomCardTypeIcon>[
        CustomCardTypeIcon(
          cardType: CardType.mastercard,
          cardImage: Image.asset(
            'assets/images/mastercard.png',
            height: 48,
            width: 48,
          ),
        ),
      ],
    );
  }
}
