import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Provider class for phone number state
class PhoneNumberProvider extends ChangeNotifier {
  String _phoneNumber = '';
  String _countryCode = '+234'; // Default to Nigeria
  String _completePhoneNumber = '';
  bool _isValid = false;
  bool _isLoading = false;
  String? _verificationId;
  String? _errorMessage;

  String get phoneNumber => _phoneNumber;
  String get countryCode => _countryCode;
  String get completePhoneNumber => _completePhoneNumber;
  bool get isValid => _isValid;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get verificationId => _verificationId;

  void updatePhoneNumber(String number) {
    _phoneNumber = number;
    _updateCompletePhoneNumber();
    _validatePhoneNumber();
    notifyListeners();
  }

  void updateCountryCode(String code) {
    _countryCode = code;
    _updateCompletePhoneNumber();
    _validatePhoneNumber();
    notifyListeners();
  }

  void _updateCompletePhoneNumber() {
    _completePhoneNumber = _countryCode + _phoneNumber;
  }

  void _validatePhoneNumber() {
    // Basic validation - phone number should be at least 7 digits
    _isValid = _phoneNumber.length >= 7 && _phoneNumber.length <= 15;
  }

  Future<bool> sendVerificationCode() async {
    if (!_isValid) return false;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _completePhoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          // Auto-verification if supported
          _isLoading = false;
          notifyListeners();
        },
        verificationFailed: (FirebaseAuthException e) {
          _isLoading = false;
          _errorMessage = e.message ?? 'Verification failed';
          notifyListeners();
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          _isLoading = false;
          _errorMessage = null;
          notifyListeners();
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
          _isLoading = false;
          notifyListeners();
        },
        timeout: const Duration(seconds: 60),
      );
      return true;
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> verifyOTP(String otp) async {
    if (_verificationId == null) return false;

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } catch (e) {
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
    _phoneNumber = '';
    _countryCode = '+234';
    _completePhoneNumber = '';
    _isValid = false;
    _isLoading = false;
    _verificationId = null;
    _errorMessage = null;
    notifyListeners();
  }
}

