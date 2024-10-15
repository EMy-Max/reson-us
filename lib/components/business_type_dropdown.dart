import 'package:reservon/utilities/exports.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> dropdownList; // Accept a list of business types
  final String? initialValue; // Optionally accept an initial value
  final String hint; // Accept a hint text

  const CustomDropdown({
    Key? key,
    required this.dropdownList,
    this.initialValue,
    required this.hint, // Make hint required
  }) : super(key: key);

  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  String? _selectedBusinessType;

  @override
  void initState() {
    super.initState();
    // Initialize with the provided initial value if any
    _selectedBusinessType = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
        hint: Text(widget.hint), // Use the hint parameter here
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: AppColors.grey3),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
        ),
        onChanged: (String? newValue) {
          setState(() {
            _selectedBusinessType = newValue;
          });
        },
        items: widget.dropdownList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}