import 'package:reservon/utilities/exports.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Clean up controllers when no longer needed
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Optionally, you can add validation methods here
  bool validateEmail() {
    return emailController.text.isNotEmpty && emailController.text.contains('@');
  }

  bool validatePassword() {
    return passwordController.text.isNotEmpty; // Example condition
  }
}