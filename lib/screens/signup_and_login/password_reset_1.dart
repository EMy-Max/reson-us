import 'package:reservon/utilities/exports.dart';

class PasswordReset extends StatelessWidget {
  const PasswordReset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthProcessAppBar(),
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
                    Text(
                      'Reset password',
                      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h),
                    const Text(
                      'Provide your login details to continue',
                      style: TextStyle(color: AppColors.grey3),
                    ),
                    SizedBox(height: 30.h),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: AppColors.grey3),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 12),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:AppColors.grey3, width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text("Remember password?", style: TextStyle(color: AppColors.primaryColor),),
                            SizedBox(width: 5.w,),
                            const Text('Login', style: TextStyle(color: AppColors.yellowWarningD,fontWeight: FontWeight.w500),),
                          ],
                        ),
                        AuthNavButton(buttonText: 'Continue', onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PasswordReset2()),
                          );
                        },),
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const GoogleSignUpButton(),
                        SizedBox(width: 20.w),
                        const AppleSignUpButton(),
                      ],
                    ),
                  ],
                ),
              ),
              const AuthBottomCard()
            ],
          ),
        ),
      ),
    );
  }
}
