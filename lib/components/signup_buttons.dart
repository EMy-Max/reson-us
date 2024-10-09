import 'package:reservon/utilities/exports.dart';

class AppleSignUpButton extends StatelessWidget {
  const AppleSignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle sign up
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: AppColors.grey2, // Light grey color
              width: 1.0, // Border width of 1px
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.apple_rounded),
              SizedBox(width: 5.w,),
              Text('Signup with apple', style: TextStyle(fontSize: 12.sp),)
            ],
          )
      ),
    );
  }
}

class GoogleSignUpButton extends StatelessWidget {
  const GoogleSignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle sign up
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: AppColors.grey2, // Light grey color
              width: 1.0, // Border width of 1px
            ),
          ),
          child: Row(
            children: [
              const Image(image: AssetImage('images/google icon.png')),
              SizedBox(width: 5.w,),
              Text('Signup with google', style: TextStyle(fontSize: 12.sp),)
            ],
          )
      ),
    );
  }
}
