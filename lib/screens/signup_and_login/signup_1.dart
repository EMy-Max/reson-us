import 'package:reservon/utilities/exports.dart';

class Signup1 extends StatelessWidget {
  const Signup1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                AuthProcessAppBar(),
              SizedBox(
                height: 30.h, // Adapts to screen size
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width:250.w,
                      child: CustomProgressIndicator(totalSteps: 3, currentStep: 1,),
                    ),
                    SizedBox(height: 20.h,),
                    Text(
                      'Sign up to $brandName!',
                      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'To experience the ultimate solution for managing appointments and invoices.',
                      style: TextStyle(color: grey3, fontSize: 14.sp,),
                    ),
                    SizedBox(height: 30.h),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Enter your email',
                        labelStyle: TextStyle(color: grey3),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 12),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:grey3, width: 2.0.w),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Create a password',
                        labelStyle: TextStyle(color: grey3),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 12),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:grey3, width: 2.0.w),
                        ),
                        suffixIcon: Icon(Icons.visibility_off),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm password',
                        labelStyle: TextStyle(color: grey3),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 12),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:grey3, width: 2.0.w),
                        ),
                        suffixIcon: Icon(Icons.visibility_off),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    NotificationCheckbox(),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('Got an account?', style: TextStyle(color: primaryColor),),
                            SizedBox(width: 5.w,),
                            Text('Login', style: TextStyle(color: yellowWarningD,fontWeight: FontWeight.w500),),
                          ],
                        ),
                        AuthNavButton(buttonText: 'Continue', onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Signup2()),
                          );
                        },),
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GoogleSignUpButton(),
                        SizedBox(width: 20.w),
                        AppleSignUpButton(),
                      ],
                    ),
                    // SizedBox(height: 20),
                  ],
                ),
              ),
              AuthBottomCard()
            ],
          ),
        ),
      ),
    );
  }
}



