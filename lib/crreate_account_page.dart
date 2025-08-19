import 'package:flutter/material.dart';
import 'package:savvybee/login_page.dart';
import 'package:savvybee/onboarding_screen10.dart';
import 'package:savvybee/reusable_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firebase = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;

class CrreateAccountPage extends StatefulWidget {
  @override
  State<CrreateAccountPage> createState() => _CrreateAccountPageState();
}

class _CrreateAccountPageState extends State<CrreateAccountPage> {
  final _form = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredEmail = '';
  var _enteredPassword = '';

  void _submit() async {
    // Handle form submission logic here
    final isValid = _form.currentState!.validate();

    if (isValid) {
      _form.currentState!.save();
    
      try {
        final userCredentials = await _firebase.createUserWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
       
        // 2. Save user data to Firestore (only first name)
        await _firestore.collection('users').doc(userCredentials.user!.uid).set({
          'firstName': _enteredName, // Saving first name
          'email': _enteredEmail,
          'createdAt': FieldValue.serverTimestamp(),
          'points': 0, // Default points
          'hearts': 0,   // Default hearts
        });

        // 3. Navigate to onboarding
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
            SnackBar(
                content: Text('An error occurred. Please try again later.')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.12, // ~60px on 812px height
                left: screenWidth * 0.04, // ~16px on 375px width
                right: screenWidth * 0.04,
                bottom: screenHeight * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Join the Hive! 🐝',
                  style: TextStyle(
                      fontSize: screenWidth * 0.064, // ~24px on 375px width
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * 0.01), // ~8px
                Text(
                  'Create your SavvyBee account and start buzzing toward better money skills.',
                  style: TextStyle(fontSize: screenWidth * 0.043), // ~16px
                ),
                SizedBox(height: screenHeight * 0.02), // ~16px
                // Name Input Field
                Form(
                  key: _form,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: screenHeight * 0.0086), // ~7px
                        Container(
                          decoration: BoxDecoration(
                            border: const Border(
                              top: BorderSide(color: Colors.grey, width: 1),
                              left: BorderSide(color: Colors.grey, width: 1),
                              right: BorderSide(color: Colors.grey, width: 3),
                              bottom: BorderSide(color: Colors.grey, width: 3),
                            ),
                            borderRadius: BorderRadius.circular(
                                screenWidth * 0.021), // ~8px
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter your name',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(12),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter your name';
                              }
                              // Add more validation if needed
                              return null;
                            },
                            onSaved: (value) {
                              _enteredName = value!;
                            },
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02), // ~16px
                        // Email Input Field
                        Text(
                          "Email Address",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: screenHeight * 0.0086), // ~7px
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: const BorderSide(
                                  color: Colors.grey, width: 1),
                              left: const BorderSide(
                                  color: Colors.grey, width: 1),
                              right: const BorderSide(
                                  color: Colors.grey, width: 3),
                              bottom: const BorderSide(
                                  color: Colors.grey, width: 3),
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
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return 'Please enter your email';
                              }
                              // Add more validation if needed
                              return null;
                            },
                            onSaved: (value) {
                              _enteredEmail = value!;
                            },
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02), // ~16px
                        // Password Input Field
                        Text(
                          "Password",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: screenHeight * 0.0086), // ~7px
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: const BorderSide(
                                  color: Colors.grey, width: 1),
                              left: const BorderSide(
                                  color: Colors.grey, width: 1),
                              right: const BorderSide(
                                  color: Colors.grey, width: 3),
                              bottom: const BorderSide(
                                  color: Colors.grey, width: 3),
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
                            validator: (value) {
                              if (value == null || value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              // Add more validation if needed
                              return null;
                            },
                            onSaved: (value) {
                              _enteredPassword = value!;
                            },
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.012), // ~10px
                        Text(
                          "Password must contain 6+ characters, mix letters & numbers",
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: Colors.black,
                            fontSize: screenWidth * 0.037, // ~14px
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02), // ~16px
                        // Join Button
                        ReusableButton(
                          text: 'Join the Hive!',
                          onPressed: _submit,
                        ),
                        SizedBox(height: screenHeight * 0.02), // ~16px
                        Text(
                          'By signing up, you agree to our Terms of Service and Privacy Policy.',
                          style:
                              TextStyle(fontSize: screenWidth * 0.037), // ~14px
                        ),
                      ]),
                ),
              ],
            ),
          ),
          // Text at the bottom
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.086), // ~70px
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: Text(
                  'Already have an account? Log in',
                  style: TextStyle(
                      fontSize: screenWidth * 0.043, // ~16px
                      color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
