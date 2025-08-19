import 'package:flutter/material.dart';

class CardOnboardingProvider extends ChangeNotifier {
  final PageController pageController = PageController();
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void goToPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
