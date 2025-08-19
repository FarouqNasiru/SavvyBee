import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCodeProvider extends ChangeNotifier {
  final List<String> _otpDigits = ['', '', '', '', '', '']; // Store OTP digits (6 digits for Firebase)
  bool _isValid = false;
  bool _isLoading = false;
  String? _errorMessage;

  bool get isValid => _isValid;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String get otpCode => _otpDigits.join('');

  void updateDigit(int index, String value) {
    if (index >= 0 && index < _otpDigits.length) {
      _otpDigits[index] = value;

      // Check if all digits are filled
      _isValid = _otpDigits.every((digit) => digit.isNotEmpty);

      notifyListeners(); // Notify UI of changes
    }
  }

  Future<bool> verifyOTP(String verificationId) async {
    if (!_isValid) return false;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpCode,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Invalid verification code';
      notifyListeners();
      return false;
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  void reset() {
    for (int i = 0; i < _otpDigits.length; i++) {
      _otpDigits[i] = '';
    }
    _isValid = false;
    _isLoading = false;
    _errorMessage = null;
    notifyListeners();
  }
}