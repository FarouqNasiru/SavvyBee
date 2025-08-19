import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvybee/crreate_account_page.dart';
import 'package:savvybee/home_page.dart';
import 'package:savvybee/onboarding_screen10.dart';
import 'package:savvybee/reusable_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>();

  String _enteredEmail = '';
  String _enteredPassword = '';

  void _submit() async {
    try {
      final UserCredentials = await _firebase.signInWithEmailAndPassword(
        email: _enteredEmail,
        password: _enteredPassword,
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SavvyBeeOnboarding10()),
      );
    } on FirebaseAuthException catch (error) {
      // Handle errors here, e.g., show a dialog or a snackbar
      if (error.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Email is already in use. Please try another.')),
        );
      } else if (error.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Password is too weak. Please choose a stronger password.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred. Please try again later.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.043, // ~16px on 375px width
                right: screenWidth * 0.043,
                bottom: screenHeight * 0.071,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "lib/assets/images/bee_jar.png",
                      width: 300,
                      height: 300,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Welcome Back, Bee! 🐝',
                    style: TextStyle(
                      fontSize: screenWidth * 0.064, // ~24px
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.008), // ~8px
                  Text(
                    'Log in and keep building your hive of money skills.',
                    style: GoogleFonts.manrope(
                      fontSize: screenWidth * 0.043, // ~16px
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025), // ~20px
                  // Email Input Field
                  Form(
                    key: _form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email Address",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: screenHeight * 0.0086), // ~7px
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: const BorderSide(color: Colors.grey, width: 1),
                              left:
                                  const BorderSide(color: Colors.grey, width: 1),
                              right:
                                  const BorderSide(color: Colors.grey, width: 3),
                              bottom:
                                  const BorderSide(color: Colors.grey, width: 3),
                            ),
                            borderRadius: BorderRadius.circular(
                                screenWidth * 0.021), // ~8px
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter valid email address',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(12),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _enteredEmail = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.025), // ~20px
                        // Password Input Field
                        Text(
                          "Password",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: screenHeight * 0.0086), // ~7px
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: const BorderSide(color: Colors.grey, width: 1),
                              left:
                                  const BorderSide(color: Colors.grey, width: 1),
                              right:
                                  const BorderSide(color: Colors.grey, width: 3),
                              bottom:
                                  const BorderSide(color: Colors.grey, width: 3),
                            ),
                            borderRadius: BorderRadius.circular(
                                screenWidth * 0.021), // ~8px
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Create Password',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(12),
                            ),
                            obscureText: true,
                            onChanged: (value) {
                              setState(() {
                                _enteredPassword = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025), // ~20px
                  // Log In Button
                  ReusableButton(
                    text: 'Log In',
                    onPressed: _submit,
                  ),
                  SizedBox(height: screenHeight * 0.012), // ~10px
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: Colors.grey,
                      fontSize: screenWidth * 0.037, // ~14px
                    ),
                  ),
                ],
              ),
            ),
            // Text at the bottom
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CrreateAccountPage(),
                    ),
                  );
                },
                child: Text(
                  'New to SavvyBee? Create Account',
                  style: TextStyle(
                    fontSize: screenWidth * 0.043, // ~16px
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
