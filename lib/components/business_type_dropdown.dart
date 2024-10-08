import 'package:reservon/utilities/exports.dart';

class BusinessTypeDropdown extends StatefulWidget {
  @override
  _BusinessTypeDropdownState createState() => _BusinessTypeDropdownState();
}

class _BusinessTypeDropdownState extends State<BusinessTypeDropdown> {
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
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        value: _selectedBusinessType,
        icon: Icon(Icons.arrow_drop_up_sharp),
        hint: Text('Business type'),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: grey3),
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