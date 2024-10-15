import 'package:reservon/utilities/exports.dart';

class PasswordResetProvider extends ChangeNotifier {
  // Controllers for each input field
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Clean up controllers when no longer needed
  @override
  void dispose() {
    emailController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // Validation methods
  bool validateEmail() {
    return emailController.text.isNotEmpty && emailController.text.contains('@');
  }

  bool validateNewPassword() {
    return newPasswordController.text.isNotEmpty && newPasswordController.text.length >= 6; // Example condition
  }

  bool validateConfirmPassword() {
    return confirmPasswordController.text == newPasswordController.text; // Check if passwords match
  }
}