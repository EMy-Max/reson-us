import 'package:reservon/utilities/exports.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {

    final loginProvider = Provider.of<LoginProvider>(context);

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
                      'Welcome Back!',
                      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h),
                    const Text(
                      'Provide your login details to continue',
                      style: TextStyle(color: AppColors.grey3),
                    ),
                    SizedBox(height: 30.h),
                    CustomTextField(
                      label: 'Email',
                      controller: loginProvider.emailController,
                    ),
                    SizedBox(height: 15.h),
                    // Use CustomTextField for password input
                    CustomTextField(
                      label: 'Password',
                      controller: loginProvider.passwordController,
                      obscureText: true,
                    ),
                    SizedBox(height: 10.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PasswordReset()), // Navigate to PasswordReset
                        );
                      },
                      child: Row(
                        children: [
                          Text('Forgot Password?', style: TextStyle(color: AppColors.primaryColor, fontSize: 10.sp),),
                          SizedBox(width: 5.w,),
                          Text('Reset', style: TextStyle(color: AppColors.primaryColor, fontSize: 10.sp, fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Signup1()), // Navigate to PasswordReset
                            );
                          },
                          child: Row(
                            children: [
                               Text("Don't have an account?", style: TextStyle(color: AppColors.primaryColor, fontSize: 10.sp),),
                              SizedBox(width: 5.w,),
                               Text('Sign up', style: TextStyle(color: AppColors.yellowWarningD,fontSize: 10.sp,fontWeight: FontWeight.w500),),
                            ],
                          ),
                        ),
                        AuthNavButton(buttonText: 'Continue', onTap: () {

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

