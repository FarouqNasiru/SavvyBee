import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvybee/crreate_account_page.dart';
import 'package:savvybee/home_page.dart';
import 'package:savvybee/login_page.dart';
import 'package:savvybee/reusable_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savvybee/google_auth_service.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Set status bar transparent and icons black
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, // Black icons for Android
      statusBarBrightness: Brightness.light,    // Black icons for iOS
    ));

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Top image, extends behind status bar
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  "lib/assets/images/BeeFamily.png",
                  width: screenWidth,
                  height: screenHeight * 0.6, // 60% of screen height
                  fit: BoxFit.cover,
                ),
              ),
              // Main content
              SafeArea(
                child: Container(
                  height: screenHeight,
                  child: Column(
                    children: [
                      // Spacer to push content below image
                      SizedBox(height: screenHeight * 0.45), // Adjust based on image height
                      // Content area
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: SingleChildScrollView(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05,
                              vertical: screenHeight * 0.03,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Welcome text
                                Text(
                                  'Welcome to Savvy Bee',
                                  style: GoogleFonts.manrope(
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                // Description text
                                Text(
                                  'We believe financial literacy should be practical, playful, and powerful. With SavvyBee, you\'re not just managing money — you\'re mastering it, with every tap.',
                                  style: GoogleFonts.manrope(
                                    fontSize: screenWidth * 0.035,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: screenHeight * 0.04),
                                
                                // Continue with email button
                                SizedBox(
                                  width: double.infinity,
                                  height: screenHeight * 0.06,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: const Border(
                                        top: BorderSide(color: Colors.black, width: 1),
                                        left: BorderSide(color: Colors.black, width: 1),
                                        right: BorderSide(color: Colors.black, width: 3),
                                        bottom: BorderSide(color: Colors.black, width: 3),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.yellow[700],
                                        foregroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        elevation: 2,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => CrreateAccountPage()),
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              "lib/assets/images/system-uicons_mail.png",
                                              width: screenWidth * 0.06,
                                              height: screenWidth * 0.06),
                                          SizedBox(width: screenWidth * 0.025),
                                          Text(
                                            'Continue with email',
                                            style: GoogleFonts.manrope(
                                              fontSize: screenWidth * 0.04,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.03),
                                
                                // Divider
                                Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        color: Colors.grey[300],
                                        height: 1,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                                      child: Text(
                                        'or login with',
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.035,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        color: Colors.grey[300],
                                        height: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.03),
                                
                                // Social login buttons
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: screenHeight * 0.05,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: const Border(
                                              top: BorderSide(color: Color.fromARGB(255, 220, 220, 220), width: 1),
                                              left: BorderSide(color: Color.fromARGB(255, 220, 220, 220), width: 1),
                                              right: BorderSide(color: Color.fromARGB(255, 220, 220, 220), width: 3),
                                              bottom: BorderSide(color: Color.fromARGB(255, 220, 220, 220), width: 3),
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              foregroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              elevation: 2,
                                            ),
                                            onPressed: () async {
                                              final userCredential =
                                                  await signInWithGoogle(context);
                                              if (userCredential != null) {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => const HomePage(),
                                                  ),
                                                );
                                              }
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                    "lib/assets/images/devicon_google.png",
                                                    width: screenWidth * 0.06,
                                                    height: screenWidth * 0.06),
                                                SizedBox(width: screenWidth * 0.025),
                                                Text(
                                                  'Google',
                                                  style: GoogleFonts.manrope(
                                                    fontSize: screenWidth * 0.035,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: screenWidth * 0.04),
                                    Expanded(
                                      child: SizedBox(
                                        height: screenHeight * 0.05,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: const Border(
                                              top: BorderSide(color: Color.fromARGB(255, 220, 220, 220), width: 1),
                                              left: BorderSide(color: Color.fromARGB(255, 220, 220, 220), width: 1),
                                              right: BorderSide(color: Color.fromARGB(255, 220, 220, 220), width: 3),
                                              bottom: BorderSide(color: Color.fromARGB(255, 220, 220, 220), width: 3),
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              foregroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              elevation: 2,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CrreateAccountPage()),
                                              );
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                    "lib/assets/images/logos_facebook.png",
                                                    width: screenWidth * 0.06,
                                                    height: screenWidth * 0.06),
                                                SizedBox(width: screenWidth * 0.025),
                                                Text(
                                                  'Facebook',
                                                  style: GoogleFonts.manrope(
                                                    fontSize: screenWidth * 0.035,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.04),
                                
                                // Register link
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CrreateAccountPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Don\'t have an account? Register Now',
                                    style: GoogleFonts.manrope(
                                      fontSize: screenWidth * 0.035,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


