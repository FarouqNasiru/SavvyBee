import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

// State Management for Selected Country
class UserPreferencesProvider extends ChangeNotifier {
  String _selectedCountry = 'NG'; // Default to Nigeria

  String get selectedCountry => _selectedCountry;

  void updateCountry(String countryCode) {
    _selectedCountry = countryCode;
    notifyListeners();
  }
}