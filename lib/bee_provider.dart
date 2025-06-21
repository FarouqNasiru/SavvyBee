import 'package:flutter/material.dart';

class BeeProvider with ChangeNotifier {
  int currentIndex = 0;

  List<String> levels = [
    "Tracking Your Money",
    // Add more levels if needed
  ];

  void completeCurrentLevel() {
    currentIndex++;
    notifyListeners();
  }
}