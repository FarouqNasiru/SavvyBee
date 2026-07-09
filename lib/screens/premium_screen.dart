import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/navbar.dart';
import 'package:savvybee/reusable_button.dart';
import 'package:savvybee/providers/premium_provider.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<PremiumProvider>(
        builder: (context, premiumProvider, child) {
          // Check if we're on the subscription screen
          if (premiumProvider.isSubscriptionScreen) {
            return _buildSubscriptionScreen(context, premiumProvider);
          } else {
            return _buildRegularScreen(context, premiumProvider);
          }
        },
      ),
      bottomNavigationBar: Navbar(),
    );
  }

  Widget _buildRegularScreen(BuildContext context, PremiumProvider premiumProvider) {
    final currentData = premiumProvider.currentData;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.08, 
          left: screenWidth * 0.04, 
          right: screenWidth * 0.04, 
          bottom: screenHeight * 0.023),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Level up with",
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.w700,
                height: 1.0,
              ),
            ),
            Text(
              "Premium",
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.w700,
                height: 1.0,
              ),
            ),
            SizedBox(height: screenHeight * 0.035),

          // Dynamic Image
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Image.asset(
              currentData.imagePath,
              key: ValueKey(currentData.imagePath),
              width: double.infinity,
              height: screenHeight * 0.45,
              fit: BoxFit.contain,
            ),
            ),

            SizedBox(height: screenHeight * 0.035),

          // Dynamic Subtitle
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Text(
              currentData.subtitle,
              key: ValueKey('subtitle_${premiumProvider.currentIndex}'),
              style: GoogleFonts.manrope(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                height: 1.0,
              ),
            ),
            ),

          // Dynamic Description
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                currentData.description,
                key: ValueKey(
                    'description_${premiumProvider.currentIndex}'),
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.020),
          
          // Progress Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              premiumProvider.premiumData.length + 1, // +1 for subscription screen
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                width: index == premiumProvider.currentIndex ? screenWidth * 0.06 : screenWidth * 0.02,
                height: screenHeight * 0.01,
                decoration: BoxDecoration(
                  color: index == premiumProvider.currentIndex
                      ? const Color(0xFFFFD700)
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(screenWidth * 0.01),
                ),
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.030),

          // Dynamic Button
          ReusableButton(
            text: premiumProvider.isLastSlide ? "Get Premium" : "Next",
            onPressed: () {
              premiumProvider.onButtonPressed();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionScreen(BuildContext context, PremiumProvider premiumProvider) {
    final subscriptionData = premiumProvider.subscriptionData;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
          top: screenHeight * 0.08, 
          left: screenWidth * 0.065, 
          right: screenWidth * 0.065, 
          bottom: screenHeight * 0.025),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Bees and Honey Jar Image
          Image.asset(
            subscriptionData.imagePath,
            width: screenWidth * 0.5,
            height: screenHeight * 0.22,
            fit: BoxFit.contain,
          ),

          SizedBox(height: screenHeight * 0.005),

          // Title
          Text(
            subscriptionData.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              height: 1.0,
            ),
          ),

          SizedBox(height: screenHeight * 0.005),

          // Subtitle
          Text(
            subscriptionData.subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),

          SizedBox(height: screenHeight * 0.025),

          // Subscription Plans
          _buildSubscriptionPlan(
            context,
            subscriptionData.annualPlan,
            () => premiumProvider.selectAnnualPlan(),
          ),

          SizedBox(height: screenHeight * 0.02),

          _buildSubscriptionPlan(
            context,
            subscriptionData.monthlyPlan,
            () => premiumProvider.selectMonthlyPlan(),
          ),

          SizedBox(height: screenHeight * 0.025),

          // Legal Text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: GoogleFonts.manrope(
                  fontSize: screenWidth * 0.032,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: subscriptionData.legalText.split('terms of use')[0]),
                  TextSpan(
                    text: 'terms of use',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(text: ' and '),
                  TextSpan(
                    text: 'privacy policy',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(text: subscriptionData.legalText.split('privacy policy')[1]),
                ],
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.03),

          // Learn More Button
          ReusableButton(
            text: subscriptionData.buttonText,
            onPressed: () {
              premiumProvider.onButtonPressed();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionPlan(BuildContext context, SubscriptionPlan plan, VoidCallback onTap) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: screenHeight * 0.09,
        width: double.infinity,
        
        decoration: BoxDecoration(
          color: plan.isPopular ? Colors.black : const Color(0xFFFFD700),
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
        ),
        child: Stack(
          children: [
            // Triangular Ribbon
            Positioned(
              top: 0, 
              left: 0, 
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(screenWidth * 0.03),
                ),
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(screenWidth * 0.15, screenHeight * 0.07),
                      painter: TrianglePainter(
                        color: plan.isPopular ? const Color(0xFFFFD700) : Colors.black,
                      ),
                    ),
                    Positioned(
                      top: screenHeight * 0.015,
                      left: screenWidth * 0.015,
                      child: Transform.rotate(
                        angle: -0.785398, // -45 degrees in radians
                        child: Text(
                          plan.type,
                          style: GoogleFonts.manrope(
                            fontSize: screenWidth * 0.028,
                            fontWeight: FontWeight.w600,
                            color: plan.isPopular ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Centered Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    plan.label,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w700,
                      color: plan.isPopular ? Colors.white : Colors.black,
                      height: 1.0,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    plan.price,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w700,
                      color: plan.isPopular ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom painter for triangular ribbon
class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
