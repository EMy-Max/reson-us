import 'package:reservon/utilities/exports.dart';

class NotificationCheckbox extends StatefulWidget {
  const NotificationCheckbox({super.key});

  @override
  NotificationCheckboxState createState() => NotificationCheckboxState();
}

class NotificationCheckboxState extends State<NotificationCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            checkColor: isChecked? Colors.white : AppColors.grey3,
            activeColor: AppColors.primaryColor,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r),side: const BorderSide(color: AppColors.grey2)),
          ),
          SizedBox(width: 5.w),
          Flexible( // Use Flexible instead of Expanded
            child: Text(
              'Notify me on new offers, product updates and more exclusive stuff.',
              style: TextStyle(fontSize: 10.sp, color: AppColors.grey3),
            ),
          ),
        ],
      ),
    );
  }
}