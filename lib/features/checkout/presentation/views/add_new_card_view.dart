import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';
import 'package:single_resturant_app/core/widgets/custom_navigator_button.dart';

import '../../../../core/utils/text_styles.dart';
import '../widgets/card_details_row.dart';
import '../widgets/card_text_form_filed.dart';
import '../widgets/credit_card_widget.dart';
import '../widgets/custom_order_button.dart';

class AddNewCardView extends StatefulWidget {
  const AddNewCardView({super.key});

  @override
  State<AddNewCardView> createState() => _AddNewCardViewState();
}

class _AddNewCardViewState extends State<AddNewCardView> {
  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  String cardName = "";
  String cardNumber = "";
  String expiryDate = "";
  String cvv = "";
  bool isBackView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  color: AppColors.primaryColor
                ),
              ),
            ),
          ),
        ),
        title: const Text(
          "Add New Card",
          style: TextStyles.black16SemiBold,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CreditCard(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardName,
            cvvCode: cvv,
            isCvvFocused: isBackView,
          ),
          const SizedBox(
            height: 16,
          ),
          //const VisaBanners(),
          CardTextFormFiled(
            keyboardType: TextInputType.text,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
            hintText: 'Jack Lewis',
            controller: cardNameController,
            label: 'Card Name',
            onChanged: (name) {
              setState(() {
                cardName = cardNameController.text;
                isBackView = false;
              });
            },
            inputFormatters: [],
          ),
          CardTextFormFiled(
            keyboardType: TextInputType.number,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.integer(),
            ]),
            hintText: '**** **** **** 2346',
            controller: cardNumberController,
            label: 'Card Number',
            onChanged: (number) {
              setState(() {
                cardNumber = cardNumberController.text;
                var type = detectCCType(cardNumber);
                isBackView = false;
                // assert(type.contains(CreditCardType.visa()));
                print(type);
              });
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(16),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.41,
                  child: CardTextFormFiled(
                    isHaveSize: true,
                    keyboardType: TextInputType.number,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    hintText: 'MM/YY',
                    controller: expiryDateController,
                    label: 'Expiry Date',
                    onChanged: (date) {
                      setState(() {
                        if (date.length == 2) {
                          expiryDateController.text += "/";
                        }
                        expiryDate = expiryDateController.text;
                        isBackView = false;
                      });
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(5),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.41,
                  child: CardTextFormFiled(
                    isHaveSize: true,
                    keyboardType: TextInputType.number,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.integer(),
                      FormBuilderValidators.equalLength(3),
                    ]),
                    hintText: '000',
                    controller: cvvController,
                    label: 'CVV',
                    onChanged: (pass) {
                      setState(() {
                        cvv = cvvController.text;
                        isBackView = true;
                      });
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const CardDetailsRow(),
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomNavigatorButton(title: 'Save', onPressed: () {}, padding: 0,)
          )
        ],
      ),
    );
  }
}
