import 'package:reservon/utilities/exports.dart';

class Signup1 extends StatefulWidget {
  const Signup1({super.key});

  @override
  State<Signup1> createState() => _Signup1State();
}

class _Signup1State extends State<Signup1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const AuthProcessAppBar(),
              SizedBox(
                height: ScreenUtil().setHeight(30), // Adapts to screen size
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign up to $brandName!',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10), // Adapts to screen size
                    ),
                    Text(
                      'To experience the ultimate solution for managing appointments and invoices.',
                      style: TextStyle(color: grey3),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(30), // Adapts to screen size
                    ),
                    TextField(
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Enter your email',
                        labelStyle: TextStyle(color: grey3),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        //contentPadding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:grey3, width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(30), // Adapts to screen size
                    ),
                    TextField(
                      obscureText: true,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Create a password',
                        labelStyle: TextStyle(color: grey3),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        //contentPadding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:grey3, width: 2.0),
                        ),
                        suffixIcon: const Icon(Icons.visibility_off),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(30), // Adapts to screen size
                    ),
                    TextField(
                      obscureText: true,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Confirm password',
                        labelStyle: TextStyle(color: grey3),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        //contentPadding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:grey3, width: 2.0),
                        ),
                        suffixIcon: const Icon(Icons.visibility_off),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


