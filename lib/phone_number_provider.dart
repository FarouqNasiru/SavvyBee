import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl_phone_field/intl_phone_field.dart';





// Provider class for phone number state
class PhoneNumberProvider extends ChangeNotifier {
  String _phoneNumber = '';
  bool _isValid = true;

  String get phoneNumber => _phoneNumber;
  bool get isValid => _isValid;

  void updatePhoneNumber(String number) {
    _phoneNumber = number;
    _isValid = number.length == 10 || number.length == 11;
    notifyListeners();
  }
}

