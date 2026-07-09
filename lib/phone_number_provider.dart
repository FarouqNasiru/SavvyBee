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

    // Simulate loading for 2 seconds to show the loading state
    await Future.delayed(const Duration(seconds: 2));
    
    // Skip Firebase verification and simulate success
    _verificationId = 'mock_verification_id';
    _isLoading = false;
    _errorMessage = null;
    notifyListeners();
    
    return true;
  }

  Future<bool> verifyOTP(String otp) async {
    if (_verificationId == null) return false;

    // Skip Firebase verification and accept any 6-digit code
    if (otp.length == 6 && RegExp(r'^[0-9]+$').hasMatch(otp)) {
      // Simulate successful verification
      return true;
    } else {
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

