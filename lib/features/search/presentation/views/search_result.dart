import 'package:flutter/material.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';

import '../../../../core/utils/text_styles.dart';
import '../widgets/custom_search_result_item.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
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
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
        title: const Text(
          "Search Results",
          style: TextStyles.black16SemiBold,
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(21.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomSearchResultItem(),
            CustomSearchResultItem(),
          ],
        ),
      ),
    );
  }
}
