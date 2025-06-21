import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/auth_code_provider.dart';
import 'package:savvybee/bee_provider.dart';
import 'package:savvybee/card_onboarding_provider.dart';
import 'package:savvybee/country_provider.dart';
import 'package:savvybee/date_of_birth_provider.dart';
import 'package:savvybee/home_page.dart';
import 'package:savvybee/nin_provider.dart';
import 'package:savvybee/phone_number_provider.dart';
import 'package:savvybee/progress_provider.dart';

import 'package:savvybee/question_provider.dart';
import 'package:savvybee/user_preferences_provider.dart';
import 'splash_screen.dart';
import 'onboarding_screens.dart';
import 'onboarding_provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => CardContentProvider()),
        ChangeNotifierProvider(create: (context) => PhoneNumberProvider()),
        ChangeNotifierProvider(create: (context) => UserPreferencesProvider()),
        ChangeNotifierProvider(create: (context) => AuthCodeProvider()),
        ChangeNotifierProvider(create: (context) => DateOfBirthProvider()),
        ChangeNotifierProvider(create: (context) => CountryProvider()),
        ChangeNotifierProvider(create: (context) => NinProvider()),
        ChangeNotifierProvider(create: (context) => QuestionProvider()),
        ChangeNotifierProvider(create: (_) => BeeProvider()),
        ChangeNotifierProvider(create: (context) => CardOnboardingProvider()),
        ChangeNotifierProvider(create: (context) => QuestionProvider()),
        ChangeNotifierProvider(create: (_) => ProgressProvider()),
       
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    return MaterialApp(
      title: 'SavvyBee',
      theme: ThemeData(
        primarySwatch: Colors.yellow, // Set primary color to yellow
        fontFamily: 'Inter',
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
