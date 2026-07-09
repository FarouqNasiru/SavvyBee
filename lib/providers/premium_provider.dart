import 'package:flutter/material.dart';

class PremiumProvider extends ChangeNotifier {
  int _currentIndex = 0;
  
  final List<PremiumData> _premiumData = const [
    PremiumData(
      title: 'Level up with Premium',
      imagePath: 'lib/assets/images/premium-image-1.png',
      subtitle: 'Learn Efficiently',
      description:
          'Absorb knowledge faster with structured lessons, interactive modules, and AI-powered recommendations tailored to your pace.',
    ),
    PremiumData(
      title: 'Level up with Premium',
      imagePath: 'lib/assets/images/premium-image-2.png',
      subtitle: 'Apply your learnings',
      description:
          'Bridge the gap between theory and practice with real-world scenarios, hands-on projects, and guided exercises.',
    ),
    PremiumData(
      title: 'Level up with Premium',
      imagePath: 'lib/assets/images/premium-image-3.png',
      subtitle: 'Master the fundamentals',
      description:
          'Build a strong foundation with in-depth explanations, expert insights, and practical examples for lasting expertise.',
    ),
    PremiumData(
      title: 'Level up with Premium',
      imagePath: 'lib/assets/images/premium-image-4.png',
      subtitle: 'Join Hive',
      description:
          'Access a supportive community to learn, collaborate, and save together through ROSCAs, growing your income.',
    ),
  ];

  // Subscription screen data
  final SubscriptionData _subscriptionData = const SubscriptionData(
    title: 'Access the \n Complete Experience',
    subtitle: 'Premium gives you full access to every course, hive and more.',
    imagePath: 'lib/assets/images/bee_jar.png',
    annualPlan: SubscriptionPlan(
      type: 'Annual',
      label: 'Most Popular',
      price: '\$100/Year',
      isPopular: true,
    ),
    monthlyPlan: SubscriptionPlan(
      type: 'Month',
      label: 'Recommended',
      price: '\$9.99/Month',
      isPopular: false,
    ),
    legalText: 'Upon subscribing, your Apple account will be charged ₩10,000.00/mo (1 month) or ₩100,000/yr (1 year). Your SavvyBee premium subscription will automatically renew at the same price within 24 hours before the end of your current subscription period. You can cancel anytime in your App store settings. View our terms of use and privacy policy for more details.',
    buttonText: 'Learn More',
  );

  // Getters
  int get currentIndex => _currentIndex;
  List<PremiumData> get premiumData => _premiumData;
  PremiumData get currentData => _premiumData[_currentIndex];
  SubscriptionData get subscriptionData => _subscriptionData;
  bool get isLastSlide => _currentIndex == _premiumData.length - 1;
  bool get isSubscriptionScreen => _currentIndex == _premiumData.length;

  // Methods
  void nextSlide() {
    if (_currentIndex < _premiumData.length) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void previousSlide() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }

  void goToSlide(int index) {
    if (index >= 0 && index <= _premiumData.length) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  void resetToFirst() {
    _currentIndex = 0;
    notifyListeners();
  }

  // Button action - cycles through content
  void onButtonPressed() {
    if (isSubscriptionScreen) {
      // If on subscription screen, implement premium purchase logic
      // TODO: Implement actual premium purchase
      print('Premium purchase initiated');
    } else {
      // Move to next slide
      nextSlide();
    }
  }

  // Subscription plan selection
  void selectAnnualPlan() {
    // TODO: Implement annual plan selection
    print('Annual plan selected');
  }

  void selectMonthlyPlan() {
    // TODO: Implement monthly plan selection
    print('Monthly plan selected');
  }
}

class PremiumData {
  final String title;
  final String subtitle;
  final String description;
  final String imagePath;

  const PremiumData({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imagePath,
  });
}

class SubscriptionData {
  final String title;
  final String subtitle;
  final String imagePath;
  final SubscriptionPlan annualPlan;
  final SubscriptionPlan monthlyPlan;
  final String legalText;
  final String buttonText;

  const SubscriptionData({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.annualPlan,
    required this.monthlyPlan,
    required this.legalText,
    required this.buttonText,
  });
}

class SubscriptionPlan {
  final String type;
  final String label;
  final String price;
  final bool isPopular;

  const SubscriptionPlan({
    required this.type,
    required this.label,
    required this.price,
    required this.isPopular,
  });
}

