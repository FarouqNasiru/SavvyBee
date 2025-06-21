import 'package:flutter/material.dart';

class DropdownProvider extends ChangeNotifier {
  bool _isExpanded = false;
  
  bool get isExpanded => _isExpanded;
  
  void toggleDropdown() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }
  
  void closeDropdown() {
    _isExpanded = false;
    notifyListeners();
  }
}