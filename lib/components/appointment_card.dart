import 'package:reservon/utilities/exports.dart';

///////////APPOINTMENT CARD///////////////////
class AppointmentCard extends StatelessWidget {
  final String title;
  final int count;
  final String? subtitle;
  final Color color;
  final Color textColor;
  final Color textBoxColor;

  const AppointmentCard({
    super.key,
    required this.title,
    required this.count,
    this.subtitle,
    required this.color,
    required this.textColor,
    required this.textBoxColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h, // Set the height of the card
      width: 180.w,
      child: Card(
        color: color,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r), // Use .r for border radius
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h), // Use .w and .h for padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: textBoxColor,
                  borderRadius: BorderRadius.all(Radius.circular(20.r)), // Use .r for border radius
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w), // Use .h and .w for padding
                  child: Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 12.sp, // Use .sp for text size
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    count.toString(),
                    style: TextStyle(
                      fontSize: 24.sp, // Use .sp for text size
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: TextStyle(
                        color: const Color(0xFF667085),
                        fontSize: 12.sp, // Use .sp for text size
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
