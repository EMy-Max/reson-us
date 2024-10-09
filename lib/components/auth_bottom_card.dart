import 'package:reservon/utilities/exports.dart';

class AuthBottomCard extends StatelessWidget {
  const AuthBottomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFFEEF4FE),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
              alignment: Alignment.center,
              child: Image(image: AssetImage('images/calender image.png'))),
          SizedBox(height: 20.h,),
          Text('Let your clients schedule with no hassle',
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: 20.h,),
          Text('To experience the ultimate solution for managing appointments and invoices.',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w300
            ),
          ),
          SizedBox(height: 20.h,),
          Image(image: AssetImage('images/auth bottom frame.png'))
        ],
      ),
    );
  }
}


