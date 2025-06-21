import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvybee/Hive_dashboard.dart';
import 'package:savvybee/navbar.dart';
import 'package:savvybee/reusable_button.dart';
import 'package:savvybee/reusable_button_black.dart';

class HiveHomePage extends StatelessWidget {
  const HiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'lib/assets/images/hive_bg.png', // <-- Use your PNG here
            width: size.width,
            height: size.height,
            fit: BoxFit.fill, // Stretches PNG to fit the screen
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(
                  left: 26.0,
                  right: 100.0,
                  top: 40.0,
                ),
                child: Text(
                  'Your Hive Journey Starts Here 🐝',
                  style: GoogleFonts.manrope(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    height: 1.0, // Adjust line height
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(
                  left: 26.0,
                  right: 100.0,
                ),
                child: Text(
                  "Hives are group savings circles that help you reach your money goals together. Pick how you'd like to begin.",
                  style: GoogleFonts.manrope(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                    height: 1.2, // Adjust line height
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 26.0,
                  right: 26.0,
                ),
                child: ReusableButtonBlack(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HiveDashboard(),
                      ),
                    );
                  },
                  text: 'Go to Dashboard',
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
