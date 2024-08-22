import 'package:flutter/material.dart';

import '../../../../core/utils/text_styles.dart';
import '../widgets/custom_grid_view_elements.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/custom_spacer.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 34,
                  ),
                  const CustomSearchBar(),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recent",
                        style: TextStyles.black18Medium,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Delete all",
                          style: TextStyles.black18Medium,
                        ),
                      ),
                    ],
                  ),
                  const CustomSpacer(),
                  const CustomGridViewElements(),
                  // const CustomSpacer(),
                  // const Text(
                  //   "Suggest",
                  //   style: TextStyles.black18Medium,
                  // ),
                  // const CustomGridViewElements(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
