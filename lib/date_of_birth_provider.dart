import 'package:flutter/material.dart';

class DateOfBirthProvider extends ChangeNotifier {
  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  // Dispose controllers when provider is disposed
  @override
  void dispose() {
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
    super.dispose();
  }

  String get day => dayController.text;
  String get month => monthController.text;
  String get year => yearController.text;

  bool get isDayValid {
    if (day.isEmpty) return false;
    final dayInt = int.tryParse(day);
    return dayInt != null && dayInt >= 1 && dayInt <= 31;
  }

  bool get isMonthValid {
    if (month.isEmpty) return false;
    final monthInt = int.tryParse(month);
    return monthInt != null && monthInt >= 1 && monthInt <= 12;
  }

  bool get isYearValid {
    if (year.isEmpty) return false;
    final yearInt = int.tryParse(year);
    final currentYear = DateTime.now().year;
    return yearInt != null && yearInt >= 1900 && yearInt <= currentYear;
  }

  bool get isValid => isDayValid && isMonthValid && isYearValid;

  void updateDay(String value, BuildContext context) {
    if (value.length <= 2 && (value.isEmpty || int.tryParse(value) != null)) {
      dayController.text = value;
      dayController.selection = TextSelection.collapsed(
        offset: dayController.text.length,
      );
      
      // Auto-focus next field when 2 digits are entered
      if (value.length == 2) {
        FocusScope.of(context).nextFocus();
      }
      
      notifyListeners();
    }
  }

  void updateMonth(String value, BuildContext context) {
    if (value.length <= 2 && (value.isEmpty || int.tryParse(value) != null)) {
      monthController.text = value;
      monthController.selection = TextSelection.collapsed(
        offset: monthController.text.length,
      );
      
      if (value.length == 2) {
        FocusScope.of(context).nextFocus();
      }
      
      notifyListeners();
    }
  }

  void updateYear(String value) {
    if (value.length <= 4 && (value.isEmpty || int.tryParse(value) != null)) {
      yearController.text = value;
      yearController.selection = TextSelection.collapsed(
        offset: yearController.text.length,
      );
      notifyListeners();
    }
  }

  void clear() {
    dayController.clear();
    monthController.clear();
    yearController.clear();
    notifyListeners();
  }

  String? get formattedDate {
    if (!isValid) return null;
    return '${day.padLeft(2, '0')}-${month.padLeft(2, '0')}-$year';
  }
}