import 'package:reservon/utilities/exports.dart';

import '../dashboard/dashboard.dart';


class SuccessDialog extends StatelessWidget {
  final List<String> subscribedServices;

  const SuccessDialog({
    super.key,
    required this.subscribedServices,
  });


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: SizedBox(
        width: 700.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
            decoration:  BoxDecoration(
                  color: const Color(0xFFF7F9FF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
              padding: EdgeInsets.only(left: 22.w,right: 22.w,top: 18.h,bottom: 1.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 16.r,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 24.r,
                    ),
                  ),
                  IconButton(
                    icon: Container(
                      width: 24.r,
                      height: 24.r,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFEEF1F3),
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        size: 18.r,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft:  Radius.circular(16.r),
                    bottomRight:  Radius.circular(16.r),
                  )
              ),
              child: Padding(
                padding: EdgeInsets.all(22.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Success',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'You have successfully subscribed to',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 4.h),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: '"${subscribedServices[0]}"',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: ' and ',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[600],
                            ),

                          ),
                          TextSpan(
                            text: '"${subscribedServices[1]}"',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )
                    ,
                    SizedBox(height: 24.h),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the Dashboard screen
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const CombinedDashboardScreen(), // Replace with your dashboard screen widget
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                        minimumSize: Size(double.infinity, 48.h),
                      ),
                      child: Text(
                        'Ok',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],

                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}




