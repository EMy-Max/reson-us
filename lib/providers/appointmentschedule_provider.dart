import 'package:reservon/utilities/exports.dart';


class AppointmentProvider extends ChangeNotifier {
  // Controllers for each input field
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController selectServiceController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController hoursController = TextEditingController();
  final TextEditingController minutesController = TextEditingController();
  final TextEditingController noteController = TextEditingController();


  // Date and time are not typically controlled by TextEditingController
  DateTime _appointmentDate = DateTime.now();
  TimeOfDay _appointmentTime = TimeOfDay.now();

  bool _isFirstVisit = false;

  // Getters for date, time, and isFirstVisit
  DateTime get appointmentDate => _appointmentDate;
  TimeOfDay get appointmentTime => _appointmentTime;
  bool get isFirstVisit => _isFirstVisit;

  // Setters for date, time, and isFirstVisit
  void setAppointmentDate(DateTime value) {
    _appointmentDate = value;
    notifyListeners();
  }

  void setAppointmentTime(TimeOfDay value) {
    _appointmentTime = value;
    notifyListeners();
  }

  void setIsFirstVisit(bool value) {
    _isFirstVisit = value;
    notifyListeners();
  }

  // Clean up controllers when no longer needed
  @override
  void dispose() {
    customerNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    selectServiceController.dispose();
    super.dispose();
  }

  // Validation methods
  bool validateActivityType() {
    return customerNameController.text.isNotEmpty;
  }

  bool validatePhoneNumber() {
    // Simple validation, you might want to use a more robust regex
    return phoneNumberController.text.isNotEmpty && phoneNumberController.text.length >= 10;
  }

  bool validateEmail() {
    return emailController.text.isNotEmpty && emailController.text.contains('@');
  }

  bool validateTherapySession() {
    return selectServiceController.text.isNotEmpty;
  }

  // Method to validate and submit the form
  bool submitForm() {
    return validateActivityType() &&
        validatePhoneNumber() &&
        validateEmail() &&
        validateTherapySession();
    // You can add more complex validation logic here if needed
  }
}