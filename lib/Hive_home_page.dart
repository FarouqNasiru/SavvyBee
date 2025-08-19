import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvybee/Hive_dashboard.dart';
import 'package:savvybee/navbar.dart';
import 'package:savvybee/reusable_button.dart';
import 'package:savvybee/reusable_button_black.dart';
import 'package:savvybee/screens/home/home_screen.dart';
import 'package:savvybee/screens/splash_screen.dart';

class HiveHomePage extends StatelessWidget {
  const HiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // Calculate relative sizes based on screen dimensions
    final horizontalPadding = size.width * 0.07; // ~7% of screen width
    final topPadding = size.height * 0.06; // ~6% of screen height
    final titleFontSize = size.height * 0.045; // ~4.5% of screen height
    final subtitleFontSize = size.height * 0.025; // ~2.5% of screen height
    final buttonBottomMargin = size.height * 0.05; // ~5% of screen height
    final verticalSpacingSmall = size.height * 0.015; // ~1.5% of screen height
    final verticalSpacingMedium = size.height * 0.03; // ~3% of screen height
    final rightTextPadding = size.width * 0.23; // ~25% of screen width

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'lib/assets/images/hive_bg.png',
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: topPadding),
              Padding(
                padding: EdgeInsets.only(
                  left: horizontalPadding,
                  right: rightTextPadding,
                  top: size.height * 0.05,
                ),
                child: Text(
                  'Your Hive Journey Starts Here 🐝',
                  style: GoogleFonts.manrope(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    height: 1.0,
                  ),
                ),
              ),
              SizedBox(height: verticalSpacingSmall),
              Padding(
                padding: EdgeInsets.only(
                  left: horizontalPadding,
                  right: rightTextPadding,
                ),
                child: Text(
                  "Hives are group savings circles that help you reach your money goals together. Pick how you'd like to begin.",
                  style: GoogleFonts.manrope(
                    fontSize: subtitleFontSize,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                    height: 1.2,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  left: horizontalPadding,
                  right: horizontalPadding,
                ),
                child: ReusableButtonBlack(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SplashScreen(),
                      ),
                    );
                  },
                  text: 'Go to Dashboard',
                ),
              ),
              SizedBox(height: buttonBottomMargin),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
