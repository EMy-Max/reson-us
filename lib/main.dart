import 'package:reservon/utilities/exports.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
          home: Signup1(),
        );
      },
    );
  }
}
