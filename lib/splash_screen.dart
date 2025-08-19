// splash_screen.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:savvybee/auth_screen.dart';
import 'package:savvybee/home_page.dart';
import 'package:savvybee/onboarding_screens.dart';
import 'package:savvybee/utils/app_preferences.dart';
import 'firebase_options.dart';


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
    try {
      print('Starting app initialization...');
      
      // Wait for minimum splash duration
      await Future.delayed(Duration(seconds: 2));
      print('Splash delay completed');
      
      // Check if Firebase is already initialized
      try {
        if (Firebase.apps.isEmpty) {
          print('Initializing Firebase...');
          await Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          );
          print('Firebase initialized successfully');
        } else {
          print('Firebase already initialized');
        }
      } catch (e) {
        print('Firebase initialization failed: $e');
        // Continue without Firebase for now
      }

      print('Checking app preferences...');
      final isFirstLaunch = await AppPreferences.isFirstLaunch();
      final isLoggedIn = await AppPreferences.isLoggedIn();
      print('isFirstLaunch: $isFirstLaunch, isLoggedIn: $isLoggedIn');

      if (mounted) {
        print('Navigating to next screen...');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => _getNextScreen(isFirstLaunch, isLoggedIn),
          ),
        );
      }
    } catch (e) {
      print('Error initializing app: $e');
      // Even if Firebase fails, continue to the app
      if (mounted) {
        print('Continuing despite Firebase error...');
        final isFirstLaunch = await AppPreferences.isFirstLaunch();
        final isLoggedIn = await AppPreferences.isLoggedIn();
        
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => _getNextScreen(isFirstLaunch, isLoggedIn),
          ),
        );
      }
    }
  }

  Widget _getNextScreen(bool isFirstLaunch, bool isLoggedIn) {
    if (isFirstLaunch) {
      return OnboardingScreens();
    } else {
      return isLoggedIn ? HomePage() : AuthScreen();
    }
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
              "lib/assets/images/Vector.svg",
              errorBuilder: (context, error, stackTrace) {
                print('Error loading Vector.svg: $error');
                return Icon(Icons.bug_report, size: 50, color: Colors.grey);
              },
            ),
            const SizedBox(height: 30),
            Image.asset(
              "lib/assets/images/SavvyBee.png",
              errorBuilder: (context, error, stackTrace) {
                print('Error loading SavvyBee.png: $error');
                return Icon(Icons.image, size: 50, color: Colors.grey);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}