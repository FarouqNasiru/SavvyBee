// splash_screen.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:savvybee/auth_screen.dart';
import 'package:savvybee/home_page.dart';
import 'package:savvybee/onboarding_screens.dart';
import 'package:savvybee/screens/home/home_screen.dart';
import 'package:savvybee/utils/app_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Wait for minimum splash duration and Firebase initialization
    await Future.wait([
      Future.delayed(Duration(seconds: 2)),
      Firebase.initializeApp(), // Initialize Firebase if not already done
    ]);

    final isFirstLaunch = await AppPreferences.isFirstLaunch();
    final isLoggedIn = await AppPreferences.isLoggedIn();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => _getNextScreen(isLoggedIn),
      ),
    );
  }

  Widget _getNextScreen(bool isLoggedIn) {
    return isLoggedIn ? HomeScreen() : AuthScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Or your preferred color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
                "lib/assets/images/Vector.svg"), // Replace with your logo asset
            const SizedBox(height: 30),
            Image.asset(
                "lib/assets/images/SavvyBee.png"), // Replace with your logo asset
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
