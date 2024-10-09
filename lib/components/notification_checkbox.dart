import 'package:reservon/utilities/exports.dart';

class NotificationCheckbox extends StatefulWidget {
  @override
  _NotificationCheckboxState createState() => _NotificationCheckboxState();
}

class _NotificationCheckboxState extends State<NotificationCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
            autofocus: true,
            checkColor: isChecked? Colors.white : grey3,
            activeColor: primaryColor,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r),side: BorderSide(color: grey2)),
          ),
          SizedBox(width: 5.w),
          Flexible( // Use Flexible instead of Expanded
            child: Text(
              'Notify me on new offers, product updates and more exclusive stuff.',
              style: TextStyle(fontSize: 10.sp, color: grey3),
            ),
          ),
        ],
      ),
    );
  }
}