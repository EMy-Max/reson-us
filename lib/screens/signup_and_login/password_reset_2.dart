import 'package:reservon/utilities/exports.dart';

class PasswordReset2 extends StatelessWidget {
  const PasswordReset2({super.key});

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
                      'Create your new password to continue',
                      style: TextStyle(color: AppColors.grey3),
                    ),
                    SizedBox(height: 30.h),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Create a password',
                        labelStyle: const TextStyle(color: AppColors.grey3),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:AppColors.grey3, width: 2.0.w),
                        ),
                        suffixIcon: const Icon(Icons.visibility_off),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm password',
                        labelStyle: const TextStyle(color: AppColors.grey3),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:AppColors.grey3, width: 2.0.w),
                        ),
                        suffixIcon: const Icon(Icons.visibility_off),
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
                            showDialog(
                            context: context,
                            builder: (BuildContext context) {
                            return ResetSuccessModal(onOkPressed: () {  },); // Your modal widget
                            },
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
