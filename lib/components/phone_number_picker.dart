import 'package:reservon/utilities/exports.dart';

class PhoneNumberPicker extends StatefulWidget {
  const PhoneNumberPicker({super.key});

  @override
  State<PhoneNumberPicker> createState() => _PhoneNumberPickerState();
}

class _PhoneNumberPickerState extends State<PhoneNumberPicker> {
  String selectedCountryCode = '+47';
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Set a fixed width to match the image
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4.r,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: grey2,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    bottomLeft: Radius.circular(8.r)),
              ),
              child: Row(children: [
                CountryCodePicker(
                  onChanged: (CountryCode countryCode) {
                    setState(() {
                      selectedCountryCode = countryCode.dialCode!;
                    });
                  },
                  initialSelection: 'NO',
                  favorite: ['+47', '+234'],
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                  alignLeft: false,
                  showDropDownButton: true,
                  padding: EdgeInsets.zero,
                  textStyle: TextStyle(fontSize: 16),
                ),
              ]))
        ],
      ),
    );
  }
}
