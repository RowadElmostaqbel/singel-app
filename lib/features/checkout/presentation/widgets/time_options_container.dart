import 'package:flutter/material.dart';
import 'package:single_resturant_app/features/checkout/presentation/widgets/selected_time_dialog.dart';

class TimeOptionsContainer extends StatelessWidget {
  const TimeOptionsContainer({super.key, this.isChecked = false});

  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    List<String> paymentMethods = [
      "Now",
      "Selected Time",
    ];
    String iconsPath = "assets/icons/";
    List<String> paymentIcons = [
      ("${iconsPath}clock.png"),
      ("${iconsPath}calendar.png"),
    ];
    List<Widget> dialogs=[
      const SelectedTimeDialog()
    ];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: MediaQuery.sizeOf(context).height * 0.2,
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
              onTap: index==0?(){}:(){
                showDialog(context: context, builder: (context){
                  return const SelectedTimeDialog();
                });
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
