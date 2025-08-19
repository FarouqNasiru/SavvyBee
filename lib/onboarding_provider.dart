// onboarding_provider.dart
import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  final PageController pageController = PageController();

  int _currentPage = 0;

  int get currentPage => _currentPage;

  void goToNextPage() {
    if (_currentPage < 4) { // Assuming 5 pages (0-4)
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      _currentPage++;
      notifyListeners();
    }
  }

  void goToPreviousPage() {
    if (_currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      _currentPage--;
      notifyListeners();
    }
  }

  void goToPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    _currentPage = page;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}