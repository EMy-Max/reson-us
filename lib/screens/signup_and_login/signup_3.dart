import 'package:reservon/utilities/exports.dart';

class Signup3 extends StatelessWidget {
  const Signup3({super.key});

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
                      style: TextStyle(color: grey3),
                    ),
                    SizedBox(height: 30),
                    BusinessTypeDropdown(),
                    SizedBox(height: 20.h),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Account number',
                        labelStyle: TextStyle(color: grey3),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 12),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:grey3, width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Account name',
                        labelStyle: TextStyle(color: grey3),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 12),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:grey3, width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
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

