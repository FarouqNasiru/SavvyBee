import 'package:flutter/material.dart';

class Country {
  final String code;
  final String name;
  final String flag;

  Country({required this.code, required this.name, required this.flag});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Country && other.code == code;
  }

  @override
  int get hashCode => code.hashCode;
}

class CountryProvider extends ChangeNotifier {
  final List<Country> countries = [
    Country(code: 'NG', name: 'Nigeria', flag: '🇳🇬'),
    Country(code: 'US', name: 'United States', flag: '🇺🇸'),
    Country(code: 'GB', name: 'United Kingdom', flag: '🇬🇧'),
    Country(code: 'CA', name: 'Canada', flag: '🇨🇦'),
    Country(code: 'KE', name: 'Kenya', flag: '🇰🇪'),
    Country(code: 'GH', name: 'Ghana', flag: '🇬🇭'),
    Country(code: 'ZA', name: 'South Africa', flag: '🇿🇦'),
  ];

  Country? _selectedCountry;

  Country get selectedCountry => _selectedCountry ?? countries[0];
  
  bool get hasSelectedCountry => _selectedCountry != null;

  void setCountry(Country country) {
    // Find the exact instance from our list
    final newCountry = countries.firstWhere(
      (c) => c.code == country.code,
      orElse: () => country,
    );
    _selectedCountry = newCountry;
    notifyListeners();
  }
}