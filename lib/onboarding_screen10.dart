import 'package:flutter/material.dart';
import 'package:savvybee/home_page.dart';
import 'package:savvybee/onboarding_screen11.dart';
import 'package:savvybee/reusable_button.dart';
import 'package:google_fonts/google_fonts.dart';

class SavvyBeeOnboarding10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Dynamically calculate image height based on screen height
    final imageHeight = screenHeight * 0.5; // 50% of the screen height

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Illustration Placeholder with dynamic height
          Container(
            width: screenWidth,
            height: imageHeight, // Dynamically set height
            margin: const EdgeInsets.only(bottom: 20), // Reduced spacing
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0xFFACCDFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: -5,
                  child: Container(
                    width: screenWidth,
                    height: imageHeight, // Dynamically set height
                    decoration: BoxDecoration(color: const Color(0xFFFFF3CC)),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 91,
                    height: 107,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFEAF2FF),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: screenWidth,
                    height: imageHeight, // Dynamically set height
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("lib/assets/images/girl_and_bee.png"),
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter, // Crop from the top
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Image.asset(
                      "lib/assets/images/solar_close-square-linear.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Information Text - Now closer to the image
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Provide Identity And Tax Information",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "In order to know it's you when you log on to SavvyBee we're legally required to collect certain information. We use this to help us verify your tax status.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Spacer to push button to bottom
          const Spacer(),
          // Continue Button (stays at bottom)
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
            child: ReusableButton(
              text: "Continue",
              onPressed: () {
                // Handle button press
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SavvyBeeOnboarding11(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
