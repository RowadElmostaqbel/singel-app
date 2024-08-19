import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';

import '../views/search_result.dart';

class CustomGridViewElements extends StatelessWidget {
  const CustomGridViewElements({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> searchTerms = ["Burger", "Pizza", "Pasta", "Salad"];
    return Container(
      margin: const EdgeInsets.only(top: 12),
      width: MediaQuery.sizeOf(context).width,
      height: 120,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: searchTerms.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  index == 0 ? context.navigateTo(const SearchResult()) : null;
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffF5F5F8),
                  ),
                  child: Center(child: Text(searchTerms[index])),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              mainAxisExtent: 42,
            ),
          );
        },
      ),
    );
  }
}
