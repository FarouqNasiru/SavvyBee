import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/home_page.dart';
import 'package:savvybee/otp_page.dart';
import 'package:savvybee/phone_number_provider.dart';
import 'package:savvybee/reusable_button.dart';
import 'package:savvybee/reusable_button_black.dart';
import 'package:savvybee/user_preferences_provider.dart';

class PhoneVerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final phoneProvider = Provider.of<PhoneNumberProvider>(context);
    final preferencesProvider = Provider.of<UserPreferencesProvider>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
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
        title: const Text(
          'Provide Identity and Tax Information',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Manrope',
            color: Colors.black,
          ),
        ),
        // Placeholder for spacing
      ),
      body: Column(
        children: [
          // Top Section (header)

          const SizedBox(height: 100),

          // Main content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.05),

                  // Title and Description
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Verify your phone number',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Manrope',
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Manrope',
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    'We’ll use this to help make sure it’s you when you log in and to verify when you make changes to your account. ',
                              ),
                              TextSpan(
                                text: 'Learn more',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700, // Bold
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Phone Number Input
                  Row(
                    children: [
                      // Flag in a separate box with dropdown functionality
                      GestureDetector(
                        onTap: () {
                          // Show dropdown menu when the flag is clicked
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                color: Colors.white,
                                height: 200,
                                child: ListView(
                                  children: [
                                    ListTile(
                                      title: Text('Nigeria (+234)'),
                                      onTap: () {
                                        // Handle country selection
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      title: Text('Canada (+1)'),
                                      onTap: () {
                                        // Handle country selection
                                        Navigator.pop(context);
                                      },
                                    ),
                                    // Add more countries as needed
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 50, // Same height as the reusable button
                          width: 50, // Fixed width for the flag container
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: const Border(
                              top: BorderSide(
                                  color: Colors.black,
                                  width: 1), // Default border width
                              left: BorderSide(
                                  color: Colors.black,
                                  width: 1), // Default border width
                              right: BorderSide(
                                  color: Colors.black,
                                  width: 3), // Thicker right border
                              bottom: BorderSide(
                                  color: Colors.black,
                                  width: 3), // Thicker bottom border
                            ),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 2), // Shadow position
                              ),
                            ],
                          ),
                          child: Center(
                            child: Image.asset(
                              'lib/assets/images/flag.png', // Replace with your flag image path
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      // Country code and phone number input in a shared container
                      Expanded(
                        child: Container(
                          height: 50, // Same height as the reusable button
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: const Border(
                              top: BorderSide(
                                  color: Colors.black,
                                  width: 1), // Default border width
                              left: BorderSide(
                                  color: Colors.black,
                                  width: 1), // Default border width
                              right: BorderSide(
                                  color: Colors.black,
                                  width: 3), // Thicker right border
                              bottom: BorderSide(
                                  color: Colors.black,
                                  width: 3), // Thicker bottom border
                            ),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 2), // Shadow position
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              // Country code
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  '+234', // Replace with your default country code
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),

                              // Phone number input
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    hintText: 'Phone number',
                                  ),
                                  keyboardType: TextInputType.phone,
                                  onChanged: (value) =>
                                      phoneProvider.updatePhoneNumber(value),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Bottom section with consent text and buttons
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
            child: Column(
              children: [
                // Consent Statement
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text:
                            "You are consenting to be contacted at this phone number for the purpose of receiving a verification code from ",
                      ),
                      TextSpan(
                        text: "SavvyBee",
                        style: TextStyle(fontWeight: FontWeight.w700), // Bold
                      ),
                      TextSpan(
                        text: ". Wireless and text message charges may apply. ",
                      ),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(fontWeight: FontWeight.w700), // Bold
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),

                // Send Buttons
                Column(
                  children: [
                    ReusableButton(
                      text: 'Send by Text',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AuthCodePage(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    ReusableButtonBlack(
                      text: 'Send by Call',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AuthCodePage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
