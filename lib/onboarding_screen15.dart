import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/home_page.dart';
import 'package:savvybee/onboarding_data_provider.dart';
import 'package:savvybee/otp_page.dart';
import 'package:savvybee/phone_number_provider.dart';
import 'package:savvybee/reusable_button.dart';
import 'package:savvybee/reusable_button_black.dart';
import 'package:savvybee/user_preferences_provider.dart';

class PhoneVerificationPage extends StatelessWidget {
  String _getCountryFlag(String countryCode) {
    switch (countryCode) {
      case '+234':
        return '🇳🇬';
      case '+1':
        return '🇺🇸'; // Default to US flag for +1
      default:
        return '🇳🇬'; // Default to Nigeria flag
    }
  }

  @override
  Widget build(BuildContext context) {
    final phoneProvider = Provider.of<PhoneNumberProvider>(context);
    final preferencesProvider = Provider.of<UserPreferencesProvider>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final onboardingData = Provider.of<OnboardingDataProvider>(context, listen: false);

    // Set status bar to black icons
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, // Black icons for Android
      statusBarBrightness: Brightness.light,    // Black icons for iOS
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            'lib/assets/images/solar_close-square-linear.png',
            height: 20,
            width: 20,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()),
            );
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.17),
                
                // Title
                Text(
                  'Verify your phone number',
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Manrope',
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                
                // Description with clickable "Learn more"
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Manrope',
                      color: Colors.black,
                    ),
                    children: [
                       TextSpan(
                        text: 'We\'ll use this to help make sure it\'s you when you log in and to verify when you make changes to your account. ',
                         style: GoogleFonts.manrope(
                          color: Colors.black,
                          
                        ),
                      ),
                      TextSpan(
                        text: 'Learn more',
                        style: GoogleFonts.manrope(
                          color: Colors.black,
                          
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle learn more tap
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                
                // Phone Number Input
                Row(
                  children: [
                    // Country flag selector
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              color: Colors.white,
                              height: 200,
                              child: ListView(
                                children: [
                                  ListTile(
                                    leading: Text('🇳🇬'),
                                    title: Text('Nigeria (+234)'),
                                    onTap: () {
                                      phoneProvider.updateCountryCode('+234');
                                      onboardingData.updatecountryCode('+234');
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Text('🇨🇦'),
                                    title: Text('Canada (+1)'),
                                    onTap: () {
                                      phoneProvider.updateCountryCode('+1');
                                      onboardingData.updatecountryCode('+1');
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Text('🇺🇸'),
                                    title: Text('United States (+1)'),
                                    onTap: () {
                                      phoneProvider.updateCountryCode('+1');
                                      onboardingData.updatecountryCode('+1');
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey, width: 1),
                            left: BorderSide(color: Colors.grey, width: 1),
                            right: BorderSide(color: Colors.grey, width: 3),
                            bottom: BorderSide(color: Colors.grey, width: 3),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            _getCountryFlag(phoneProvider.countryCode),
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    // Country code and phone number input
                    Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey, width: 1),
                            left: BorderSide(color: Colors.grey, width: 1),
                            right: BorderSide(color: Colors.grey, width: 3),
                            bottom: BorderSide(color: Colors.grey, width: 3),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            // Country code display
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                phoneProvider.countryCode,
                                style: GoogleFonts.manrope(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            // Vertical divider
                            Container(
                              height: 30,
                              width: 1,
                              color: Colors.grey[300],
                            ),
                            // Phone number input
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  hintText: 'Phone number',
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 14,
                                  ),
                                ),
                                keyboardType: TextInputType.phone,
                                onChanged: (value) {
                                  phoneProvider.updatePhoneNumber(value);
                                  onboardingData.updatePhoneNumber(value);
                                },
                                style: TextStyle(
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
                
                // Error message display
                if (phoneProvider.errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red[200]!),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.error_outline, color: Colors.red[600], size: 20),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              phoneProvider.errorMessage!,
                              style: TextStyle(
                                color: Colors.red[700],
                                fontSize: 14,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, color: Colors.red[600], size: 20),
                            onPressed: () => phoneProvider.clearError(),
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                          ),
                        ],
                      ),
                    ),
                  ),
                
              ],
            ),
          ),
        ),
      ),
      // Consent text and Buttons - Fixed at bottom
      Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.04),
            
            // Consent text
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Manrope',
                  color: Colors.grey[600],
                ),
                children: [
                   TextSpan(
                    text: 'You are consenting to be contacted at this phone number for the purpose of receiving a verification code from ',
                    style: GoogleFonts.manrope(
                      color: Colors.black,
                     
                    ),
                  ),
                  TextSpan(
                    text: 'SavvyBee',
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                   TextSpan(
                    text: '. Wireless and text message charges from your carrier may apply. Your phone number will only be used consistent with our ',
                    style: GoogleFonts.manrope(
                      color: Colors.black,
                     
                    ),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: GoogleFonts.manrope(
                      color: Colors.black,
                     
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle privacy policy tap
                      },
                  ),
                  const TextSpan(
                    text: '.',
                  ),
                ],
              ),
            ),
            
            SizedBox(height: screenHeight * 0.06),
            
            // Send Buttons
            Column(
              children: [
                ReusableButton(
                  text: phoneProvider.isLoading ? 'Sending...' : 'Send by Text',
                  onPressed: phoneProvider.isValid && !phoneProvider.isLoading
                      ? () {
                          phoneProvider.sendVerificationCode().then((success) {
                            if (success && context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AuthCodePage(),
                                ),
                              );
                            }
                          });
                        }
                      : () {},
                ),
                SizedBox(height: screenHeight * 0.02),
                ReusableButtonBlack(
                  text: phoneProvider.isLoading ? 'Sending...' : 'Send by Call',
                  onPressed: phoneProvider.isValid && !phoneProvider.isLoading
                      ? () {
                          phoneProvider.sendVerificationCode().then((success) {
                            if (success && context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AuthCodePage(),
                                ),
                              );
                            }
                          });
                        }
                      : () {},
                ),
              ],
            ),
            
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    ],
  ),
),
    );
  }
}
