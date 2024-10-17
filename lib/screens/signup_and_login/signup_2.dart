import 'package:reservon/utilities/exports.dart';

class Signup2 extends StatelessWidget {
  const Signup2({super.key});

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
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width:250.w,
                      child: CustomProgressIndicator(totalSteps: 3, currentStep: 2,),
                    ),
                    SizedBox(height: 20.h,),
                    Text(
                      'Almost there!',
                      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Let’s know more about you and your business',
                      style: TextStyle(color: AppColors.grey3),
                    ),
                    SizedBox(height: 30.h),
                    // Use controller from provider for name
                    CustomTextField(
                      label: 'Your name',
                      controller: signupProvider.nameController,
                    ),
                    SizedBox(height: 20.h),
                    // Use controller from provider for business name
                    CustomTextField(
                      label: 'Business name',
                      controller: signupProvider.businessNameController,
                    ),
                    SizedBox(height: 20.h),
                    CustomDropdown(dropdownList: ['Barber','Designer','Technician','other', 'Example'], hint: 'Business type',),
                    SizedBox(height: 20.h),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8.h,),
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        // color: grey2,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: AppColors.grey3,
                          // width: 1.sp,
                        )
                      ),
                      child: Row(
                        children: [
                          CountryCodePicker(

                          ),
                        ],
                      ),
                    ),
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
                        AuthNavButton(buttonChild: Text('Continue',style: const TextStyle(color: Colors.white),), onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Signup3()),
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
