import 'package:reservon/utilities/exports.dart';

class ServiceSelectionProvider extends ChangeNotifier {
  bool isSchedulingSelected = false;
  bool isInvoicingSelected = false;

  // Getter to check if any service is selected
  bool get isAnyServiceSelected => isSchedulingSelected || isInvoicingSelected;

  // Method to toggle scheduling service
  void toggleScheduling(bool value) {
    isSchedulingSelected = value;
    notifyListeners();
  }

  // Method to toggle invoicing service
  void toggleInvoicing(bool value) {
    isInvoicingSelected = value;
    notifyListeners();
  }
}