import 'package:reservon/screens/service_selection/service_selection.dart';
import 'package:reservon/utilities/exports.dart';
import 'package:reservon/screens/dashboard/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Design size of the iPhone X
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Reservon',
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFFF0F0F0), // Light grey background
            // primarySwatch: Color(0XFF0051C4),
              fontFamily: 'static',
          ),
          //home: const CombinedDashboardScreen(),
          home: const ServiceSelection(),
          //home: const Signup1(),
        );
      },
    );
  }
}
