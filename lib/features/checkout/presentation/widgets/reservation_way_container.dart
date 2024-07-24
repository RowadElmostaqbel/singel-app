import 'package:flutter/material.dart';

class ReservationWayContainer extends StatelessWidget {
  const ReservationWayContainer({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> paymentMethods = [
      "On Site",
      "Delivery",
    ];
    String iconsPath = "assets/icons/";
    List<String> paymentIcons = [
      ("${iconsPath}on_site.png"),
      ("${iconsPath}delivery_ic.png"),
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
            return Container(
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
            );
          }),
    );
  }
}
