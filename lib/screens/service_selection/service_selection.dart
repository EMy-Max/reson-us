import 'package:reservon/utilities/exports.dart';

class ServiceSelection extends StatefulWidget {
  const ServiceSelection({super.key});

  @override
  State<ServiceSelection> createState() => _ServiceSelection();
}

class _ServiceSelection extends State<ServiceSelection> {
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


