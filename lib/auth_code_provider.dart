import 'package:flutter/material.dart';

class AuthCodeProvider extends ChangeNotifier {
  final List<String> _otpDigits = ['', '', '', '', '']; // Store OTP digits
  bool _isValid = false;

  bool get isValid => _isValid;

  void updateDigit(int index, String value) {
    if (index >= 0 && index < _otpDigits.length) {
      _otpDigits[index] = value;

      // Check if all digits are filled
      _isValid = _otpDigits.every((digit) => digit.isNotEmpty);

      notifyListeners(); // Notify UI of changes
    }
  }
}