import 'package:reservon/utilities/exports.dart';

class Signup1 extends StatelessWidget {
  const Signup1({super.key});

  @override
  Widget build(BuildContext context) {

    // Access the SignupProvider instance
    final signupProvider = Provider.of<SignupProvider>(context);

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
                    SizedBox(
                      width:250.w,
                      child: CustomProgressIndicator(totalSteps: 3, currentStep: 1,),
                    ),
                    Text(
                      'Sign up to $brandName!',
                      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'To experience the ultimate solution for managing appointments and invoices.',
                      style: TextStyle(color: AppColors.grey3),
                    ),
                    SizedBox(height: 30.h),
                    CustomTextField(
                      label: 'Enter your email',
                      controller: signupProvider.emailController,
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      label: 'Create a password',
                      controller: signupProvider.passwordController,
                      obscureText: true,
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      label: 'Confirm password',
                      controller: signupProvider.confirmPasswordController,
                      obscureText: true,
                    ),
                    SizedBox(height: 20.h),
                    NotificationCheckbox(),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('Got an account?', style: TextStyle(color: AppColors.primaryColor),),
                            SizedBox(width: 5.w,),
                            Text('Login', style: TextStyle(color: AppColors.yellowWarningD,fontWeight: FontWeight.w500),),
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
