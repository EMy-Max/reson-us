import 'package:reservon/utilities/exports.dart';

class Signup3 extends StatelessWidget {
  const Signup3({super.key});

  @override
  Widget build(BuildContext context) {

    final signupProvider = Provider.of<SignupProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.grey1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthProcessAppBar(),
              SizedBox(
                height: ScreenUtil().setHeight(30), // Adapts to screen size
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
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
                      child: CustomProgressIndicator(totalSteps: 3, currentStep: 3,),
                    ),
                    SizedBox(height: 20.h,),
                    Text(
                      'Bank account details',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Let all payment made from your customers go to your bank account directly!',
                      style: TextStyle(color: AppColors.grey3),
                    ),
                    SizedBox(height: 30),
                    CustomDropdown(dropdownList: ['Zenith Bank', 'First Bank', 'Ecobank', 'Guarantee Trust Bank', 'Example Bank'], hint: 'Select your bank',),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      label: 'Account number',
                      controller: signupProvider.accountNumberController,
                    ),
                    SizedBox(height: 20),
                    // Use controller from provider for account name
                    CustomTextField(
                      label: 'Account name',
                      controller: signupProvider.accountNameController,
                    ),
                    SizedBox(height: 40),
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
                        AuthNavButton(buttonText: 'Sign Up', onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
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

