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
                    Text(
                      'Sign up to $brandName!',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'To experience the ultimate solution for managing appointments and invoices.',
                      style: TextStyle(color: grey3),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Enter your email',
                        labelStyle: TextStyle(color: grey3),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 12),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:grey3, width: 2.0),
                        ),
                      ),
                    ),
                    // TextField(
                    //   decoration: InputDecoration(
                    //     hintText: 'Enter your email',
                    //     border: OutlineInputBorder(),
                    //   ),
                    // ),
                    SizedBox(height: 20),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Create a password',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.visibility_off),
                      ),
                    ),
                    // SizedBox(height: 20),
                    // TextField(
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //     hintText: 'Confirm password',
                    //     border: OutlineInputBorder(),
                    //     suffixIcon: Icon(Icons.visibility_off),
                    //   ),
                    // ),
                    // SizedBox(height: 20),
                    // Row(
                    //   children: [
                    //     Checkbox(value: false, onChanged: (value) {}),
                    //     Expanded(
                    //       child: Text(
                    //         'Notify me on new offers, product updates and more exclusive stuff.',
                    //         style: TextStyle(fontSize: 12),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 20),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text('Got an account? Login'),
                    //     ElevatedButton(
                    //       onPressed: () {},
                    //       child: Text('Continue'),
                    //     ),
                    //   ],
                    // ),
                    // Spacer(),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     ElevatedButton.icon(
                    //       onPressed: () {},
                    //       icon: Icon(Icons.g_mobiledata, size: 24),
                    //       label: Text('Sign up with Google'),
                    //     ),
                    //     SizedBox(width: 20),
                    //     ElevatedButton.icon(
                    //       onPressed: () {},
                    //       icon: Icon(Icons.apple, size: 24),
                    //       label: Text('Sign up with Apple'),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 20),
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


