import 'package:reservon/utilities/exports.dart';

class BusinessTypeDropdown extends StatefulWidget {
  const BusinessTypeDropdown({super.key});

  @override
  BusinessTypeDropdownState createState() => BusinessTypeDropdownState();
}

class BusinessTypeDropdownState extends State<BusinessTypeDropdown> {
  String? _selectedBusinessType; // Initialize as null

  final List<String> _businessTypes = [
    'Baker',
    'Makeup artist',
    'Example',
    'Value',
    'Profession',
    'Others',
  ];

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
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        value: _selectedBusinessType,
        icon: const Icon(Icons.arrow_drop_up_sharp),
        hint: const Text('Business type'),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: AppColors.grey3),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        ),
        onChanged: (String? newValue) {
          setState(() {
            _selectedBusinessType = newValue;
          });
        },
        items: _businessTypes.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}