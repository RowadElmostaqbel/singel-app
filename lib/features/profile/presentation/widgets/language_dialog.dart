import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';
import 'package:single_resturant_app/core/widgets/custom_btn_widget.dart';
import 'package:single_resturant_app/features/more_information_details/presentation/views/about_us_view.dart';

import '../../../../core/utils/app_colors.dart';

class LanguageDialog extends HookWidget {
  const LanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> langList = ["EN", "AR"];
    ValueNotifier<String> lang = useState('EN');
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Stack(children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.22,
              width: MediaQuery.sizeOf(context).width * 0.85,
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 16, left: 76, right: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Choose your Language",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      RadioListTile<String>(
                        title: const Text(
                          'العربيه',
                          style: TextStyles.black16Medium,
                        ),
                        value: langList[0],
                        groupValue: lang.value,
                        onChanged: (val) {
                          lang.value = val!;
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text(
                          'English',
                          style: TextStyles.black16Medium,
                        ),
                        value: langList[1],
                        groupValue: lang.value,
                        onChanged: (val) {
                          lang.value = val!;
                        },
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomBtnWidget(
                            color: AppColors.brightGreyColor,
                            text: 'Cancel',
                            titleStyle: TextStyles.black16SemiBold,
                            radius: 12,
                          ),
                          CustomBtnWidget(
                            color: AppColors.primaryColor,
                            text: 'Submit',
                            titleStyle: TextStyles.white16SemiBold,
                            radius: 12,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: context.height * .325,
          left: 40,
          child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                  color: AppColors.primaryColor, shape: BoxShape.circle),
              child: Image.asset("assets/icons/translation.png")),
        ),
        Positioned(
          top: context.height * .515,
          left: 35,
          child: Image.asset("assets/images/dialog_decoration.png"),
        ),
      ]),
    );
  }
}
