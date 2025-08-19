import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/auth_code_provider.dart';
import 'package:savvybee/date_of_birth_page.dart';
import 'package:savvybee/home_page.dart';
import 'package:savvybee/phone_number_provider.dart';

class AuthCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<AuthCodeProvider>(context);
    final phoneProvider = Provider.of<PhoneNumberProvider>(context);

    return Scaffold(
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
            bottom: 40.0, top: 0, left: 16.0, right: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 150),

            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Enter your verification code',
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
                        'A text message with a verification code has been sent to you.',
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
                SizedBox(height: 20),
              ],
            ),

            // Error message display
            if (authProvider.errorMessage != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                          authProvider.errorMessage!,
                          style: TextStyle(
                            color: Colors.red[700],
                            fontSize: 14,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.red[600], size: 20),
                        onPressed: () => authProvider.clearError(),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      ),
                    ],
                  ),
                ),
              ),

            // Code Input Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) { // Changed to 6 digits for Firebase
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.8),
                  child: Container(
                    width: 50, // Slightly smaller for 6 digits
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: authProvider.isValid
                                ? Colors.black
                                : Colors.grey,
                            width: 1),
                        left: BorderSide(
                            color: authProvider.isValid
                                ? Colors.black
                                : Colors.grey,
                            width: 1),
                        right: BorderSide(
                            color: authProvider.isValid
                                ? Colors.black
                                : Colors.grey,
                            width: 3),
                        bottom: BorderSide(
                            color: authProvider.isValid
                                ? Colors.black
                                : Colors.grey,
                            width: 3),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      onChanged: (value) =>
                          authProvider.updateDigit(index, value),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                );
              }),
            ),

            const Spacer(),
            // Verify Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color:
                            authProvider.isValid ? Colors.black : Colors.grey,
                        width: 1),
                    left: BorderSide(
                        color:
                            authProvider.isValid ? Colors.black : Colors.grey,
                        width: 1),
                    right: BorderSide(
                        color:
                            authProvider.isValid ? Colors.black : Colors.grey,
                        width: 3),
                    bottom: BorderSide(
                        color:
                            authProvider.isValid ? Colors.black : Colors.grey,
                        width: 3),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ElevatedButton(
                  onPressed: (authProvider.isValid && !authProvider.isLoading)
                      ? () async {
                          if (phoneProvider.verificationId != null) {
                            final success = await authProvider.verifyOTP(
                              phoneProvider.verificationId!,
                            );
                            if (success && context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DateOfBirthPage(),
                                ),
                              );
                            }
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        authProvider.isValid ? Colors.yellow[700] : Colors.grey,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 2,
                  ),
                  child: authProvider.isLoading
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                          ),
                        )
                      : const Text(
                          "Continue",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
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
