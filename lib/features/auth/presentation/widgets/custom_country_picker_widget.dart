import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:single_resturant_app/core/utils/text_styles.dart';
import 'package:single_resturant_app/features/auth/presentation/manager/login_cubit.dart';
import 'package:single_resturant_app/features/auth/presentation/manager/user_cubit.dart';

class CustomCountryPickerWidget extends HookWidget {
  final bool fromRegister;
  const CustomCountryPickerWidget({
    super.key,
    required this.fromRegister,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> pickedCountryCode = useState('+20');
    useEffect(() {
      if (fromRegister) {
 BlocProvider.of<UserCubit>(context)
          .addDataToModel(countryCode: pickedCountryCode.value);
      }else{
 BlocProvider.of<LoginCubit>(context)
          .addDataToModel(countryCode: pickedCountryCode.value);
      }
     
      return null;
    }, []);
    return GestureDetector(
      onTap: () {
        showCountryPicker(
          context: context,
          countryListTheme: CountryListThemeData(
            flagSize: 25,
            backgroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey),
            bottomSheetHeight: 500, // Optional. Country list modal height
            //Optional. Sets the border radius for the bottomsheet.
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            //Optional. Styles the search field.
            inputDecoration: InputDecoration(
              labelText: 'Search',
              hintText: 'Start typing to search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color(0xFF8C98A8).withOpacity(0.2),
                ),
              ),
            ),
          ),
          onSelect: (Country country) {
            pickedCountryCode.value = '+${country.phoneCode}';
              if (fromRegister) {
 BlocProvider.of<UserCubit>(context)
          .addDataToModel(countryCode: pickedCountryCode.value);
      }else{
 BlocProvider.of<LoginCubit>(context)
          .addDataToModel(countryCode: pickedCountryCode.value);
      }
          },
        );
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: const Color(0xffE9E9E9),
          ),
        ),
        child: Text(
          pickedCountryCode.value,
          style: TextStyles.black16Medium,
        ),
      ),
    );
  }
}
