import 'package:reservon/utilities/exports.dart';

class ScheduleAppointmentButton extends StatelessWidget {
  const ScheduleAppointmentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){}, // Use the passed onTap function
      child: Container(
        alignment: Alignment.center,
        width: 210.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.calendar_today_outlined, color: Colors.white,),
            Spacer(),
            Text(
              AppText.schedulingAnAppointment, // Use the passed button text
              style: const TextStyle(color: Colors.white),
            ),

          ],
        ),
      ),
    );
  }
}