import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/home_page.dart';
import 'package:savvybee/onboarding_data_provider.dart';
import 'package:savvybee/onboarding_screen15.dart';
import 'package:savvybee/reusable_button.dart';

class SavvyBeeOnboarding12 extends StatefulWidget {
  const SavvyBeeOnboarding12({super.key});

  @override
  _SavvyBeeOnboarding12State createState() => _SavvyBeeOnboarding12State();
}

class _SavvyBeeOnboarding12State extends State<SavvyBeeOnboarding12> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _firstNameController.addListener(_checkText);
    _lastNameController.addListener(_checkText);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _checkText() {
    setState(() {
      _hasText = _firstNameController.text.isNotEmpty &&
          _lastNameController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final onboardingData =
        Provider.of<OnboardingDataProvider>(context, listen: false);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final dynamicHeight = 220 / screenHeight;

    // Set status bar to black icons
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, // Black icons for Android
      statusBarBrightness: Brightness.light,    // Black icons for iOS
    ));

    return Scaffold(
      resizeToAvoidBottomInset:
          true, // This allows the body to resize when keyboard appears
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            'lib/assets/images/solar_close-square-linear.png', // Replace with your image path
            height: 20, // Adjust size as needed
            width: 20, // Adjust size as needed
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()),
            );
            // Navigate back when the button is pressed
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Provide Identity and Tax Information',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Manrope',
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 0,
                    left: 16,
                    right: 16,
                    bottom: 20,
                  ),
                  child: Column(
                    children: [
                      // Spacer to push content down from header
                      const SizedBox(height: 150),

                      Column(
                        children: [
                          // Title and Description
                          const Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  "What's your legal name?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Manrope',
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Enter your given name(s) as they appear on your government ID.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Manrope',
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),

                          // First Name Field
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    color: _firstNameController.text.isNotEmpty
                                        ? Colors.black
                                        : Colors.grey,
                                    width: 1),
                                left: BorderSide(
                                    color: _firstNameController.text.isNotEmpty
                                        ? Colors.black
                                        : Colors.grey,
                                    width: 1),
                                right: BorderSide(
                                    color: _firstNameController.text.isNotEmpty
                                        ? Colors.black
                                        : Colors.grey,
                                    width: 3),
                                bottom: BorderSide(
                                    color: _firstNameController.text.isNotEmpty
                                        ? Colors.black
                                        : Colors.grey,
                                    width: 3),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextField(
                              controller: _firstNameController,
                              onChanged: (value) =>
                                  onboardingData.updateFirstName(value),
                              decoration: const InputDecoration(
                                labelText: 'First Name',
                                hintText: 'Enter your first name',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Last Name Field
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    color: _lastNameController.text.isNotEmpty
                                        ? Colors.black
                                        : Colors.grey,
                                    width: 1),
                                left: BorderSide(
                                    color: _lastNameController.text.isNotEmpty
                                        ? Colors.black
                                        : Colors.grey,
                                    width: 1),
                                right: BorderSide(
                                    color: _lastNameController.text.isNotEmpty
                                        ? Colors.black
                                        : Colors.grey,
                                    width: 3),
                                bottom: BorderSide(
                                    color: _lastNameController.text.isNotEmpty
                                        ? Colors.black
                                        : Colors.grey,
                                    width: 3),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextField(
                              controller: _lastNameController,
                              onChanged: (value) =>
                                  onboardingData.updateLastName(value),
                              decoration: InputDecoration(
                                labelText: 'Last Name',
                                hintText: 'Enter your last name',
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Continue Button - Fixed at bottom
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 40,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          color: _hasText ? Colors.black : Colors.grey,
                          width: 1),
                      left: BorderSide(
                          color: _hasText ? Colors.black : Colors.grey,
                          width: 1),
                      right: BorderSide(
                          color: _hasText ? Colors.black : Colors.grey,
                          width: 3),
                      bottom: BorderSide(
                          color: _hasText ? Colors.black : Colors.grey,
                          width: 3),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    onPressed: _hasText
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PhoneVerificationPage(),
                              ),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _hasText ? Colors.yellow[700] : Colors.grey,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
