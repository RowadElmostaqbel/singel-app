
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/utils/app_colors.dart';

class AddOrRemoveBtn extends HookWidget {
  const AddOrRemoveBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isAdded = useState(true);
    return GestureDetector(
      onTap: () => isAdded.value = !isAdded.value,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        alignment: Alignment.center,
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isAdded.value
              ? AppColors.darkPrimaryColor
              : AppColors.primaryColor.withOpacity(.5),
        ),
        child: Icon(
          key: ValueKey<bool>(isAdded.value),
          isAdded.value ? Icons.remove : Icons.add,
          color: isAdded.value ? Colors.white : Colors.white,
          size: 12,
        ),
      ),
    );
  }
}
