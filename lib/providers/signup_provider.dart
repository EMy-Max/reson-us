import 'package:reservon/utilities/exports.dart';

class SignupProvider extends ChangeNotifier {
  // Controllers for each input field
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController accountNameController = TextEditingController();

  // Clean up controllers when no longer needed
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    businessNameController.dispose();
    accountNumberController.dispose();
    accountNameController.dispose();
    super.dispose();
  }

  // Validation methods
  bool validateEmail() {
    return emailController.text.isNotEmpty && emailController.text.contains('@');
  }

  bool validatePassword() {
    return passwordController.text.isNotEmpty && passwordController.text.length >= 6; // Example condition
  }

  bool validateConfirmPassword() {
    return confirmPasswordController.text == passwordController.text; // Check if passwords match
  }

  // Additional validation methods can be added as needed

  // Method to clear all fields (optional)
  void clearFields() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    nameController.clear();
    businessNameController.clear();
    accountNumberController.clear();
    accountNameController.clear();
    notifyListeners(); // Notify listeners if needed
  }
}