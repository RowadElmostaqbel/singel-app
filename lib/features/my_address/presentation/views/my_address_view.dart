import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/widgets/custom_navigator_button.dart';

import '../../../../core/widgets/add_new_address_dialog.dart';


class MyAddressView extends StatefulWidget {
  const MyAddressView({super.key});

  @override
  State<MyAddressView> createState() => _MyAddressViewState();
}

class _MyAddressViewState extends State<MyAddressView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                      color: Color(0xffFD784D),
                    ),
                  ),
                ),
              ),
            ),
            snap: false,
            pinned: false,
            floating: false,
            stretch: true,
            title: const Text("My Address"),
            titleTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16),
            centerTitle: true,
            flexibleSpace: Stack(
              children: [
                FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/images/profile_background.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                      )),
                ),
              ],
            ),
            expandedHeight: 180,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 36),
              child: Column(
                children: [
                  Image.asset("assets/images/no_address.png"),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "No Address Yet",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Text(
                    "Please add your address for your better experience",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff5C5C5C),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomNavigatorButton(title: "Add Address", onPressed: (){
                    showDialog(context: context, builder: (context){
                      return const AddNewAddressDialog();
                    }) ;
                  }, padding: 0),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}