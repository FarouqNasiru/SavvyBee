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
import 'package:savvybee/providers/auth_provider.dart';
import 'package:savvybee/providers/bank_account_provider.dart';
import 'package:savvybee/providers/fund_provider.dart';
import 'package:savvybee/providers/hive_provider.dart';
import 'package:savvybee/providers/user_provider.dart';
import 'package:savvybee/providers/wallet_provider.dart';
import 'package:savvybee/question_provider.dart';
import 'package:savvybee/screens/auth/bank_verification_screen.dart';
import 'package:savvybee/screens/auth/login_screen.dart';
import 'package:savvybee/screens/auth/register_screen.dart';
import 'package:savvybee/screens/create_hive_screen.dart';
import 'package:savvybee/screens/hive/create_hive_screen.dart';
import 'package:savvybee/screens/hive/join_hive_screen.dart';
import 'package:savvybee/screens/home/home_screen.dart';
import 'package:savvybee/screens/profile/profile_screen.dart';
import 'package:savvybee/user_preferences_provider.dart';
import 'splash_screen.dart';
import 'onboarding_screens.dart';
import 'onboarding_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:savvybee/onboarding_data_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
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
        ChangeNotifierProvider(create: (_) => OnboardingDataProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => HiveProvider()),
        ChangeNotifierProvider(create: (_) => BankAccountProvider()),
        ChangeNotifierProvider(create: (_) => WalletProvider()),
        ChangeNotifierProvider(create: (_) => FundProvider()),
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
        // Add fallback fonts that support naira symbol
        fontFamilyFallback: ['Roboto', 'Arial', 'sans-serif'],
        // Ensure text styles support naira symbol
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Inter', fontFamilyFallback: ['Roboto', 'Arial', 'sans-serif']),
          bodyMedium: TextStyle(fontFamily: 'Inter', fontFamilyFallback: ['Roboto', 'Arial', 'sans-serif']),
          bodySmall: TextStyle(fontFamily: 'Inter', fontFamilyFallback: ['Roboto', 'Arial', 'sans-serif']),
        ),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/bank-verification': (context) => BankVerificationScreen(),
        '/create-hive': (context) => CreateHiveScreen(),
        '/join-hive': (context) => JoinHiveScreen(),
        '/profile': (context) => ProfileScreen(),
        // ...other routes
      },
    );
  }
}
