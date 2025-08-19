import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/auth_screen.dart';
import 'package:savvybee/onboarding_screen10.dart';
import 'onboarding_provider.dart';

class OnboardingScreens extends StatelessWidget {
  const OnboardingScreens({super.key});

  final List<OnboardingData> _onboardingData = const [
    OnboardingData(
      title: 'Build Financial',
      highlightWord: 'Health!',
      description:
          'Take control of your financial future with personalised pathways, engaging games, and a supportive community. It\'s time to improve your financial health.',
      imagePath: 'lib/assets/images/budgeting bee pose 3 1 (1).png',
    ),
    OnboardingData(
      title: 'Learn, Play, Grow,',
      highlightWord: 'Earn!',
      description:
          'Master financial fundamentals with bite-sized lessons, quizzes, and gamified challenges designed to make learning fun and rewarding.',
      imagePath: 'lib/assets/images/loan bee pose 1 1.png',
    ),
    OnboardingData(
      title: 'Tailored, Personalised,',
      highlightWord: 'Pathways!',
      description:
          'Receive tailored advice from certified experts, reliable curated information and AI-powered recommendations crafted for your goals and financial situation.',
      imagePath: 'lib/assets/images/savings bee pose 2 1.png',
    ),
    OnboardingData(
      title: 'Join Our Community,',
      highlightWord: 'Hive!',
      description:
          'Collaborate with like-minded individuals through our unique group saving system, forums, focus groups and more. Together, we grow.',
      imagePath: 'lib/assets/images/savings bee pose 2 1 (1).png',
    ),
    OnboardingData(
      title: 'Start Your Journey,',
      highlightWord: 'Today!',
      description:
          'Collaborate with like-minded individuals through our unique group saving system, forums, focus groups and more. Together, we grow.',
      imagePath: 'lib/assets/images/scammer bee pose 1 1.png',
    ),
  ];

  void _skipOnboarding(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SavvyBeeOnboarding10()),
    );
  }

  void _completeOnboarding(BuildContext context) {
    // Navigate to main app or authentication screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              const AuthScreen()), // Replace with your main app screen
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white, // White background
      body: SafeArea(
        child: Consumer<OnboardingProvider>(
          builder: (context, onboardingProvider, child) {
            return Column(
              children: [
                // Skip Button
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: onboardingProvider.currentPage != 4
                        ? TextButton(
                            onPressed: () => _skipOnboarding(context),
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFFFFF9C4),
                              foregroundColor: Colors.black87,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: Colors.yellow.shade300,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Text(
                              'Skip',
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ),

                // Main Content Area
                Expanded(
                  child: PageView.builder(
                    controller: onboardingProvider.pageController,
                    onPageChanged: (index) {
                      onboardingProvider.goToPage(index);
                    },
                    itemCount: _onboardingData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Stack(
                          children: [
                            // Background gradient image positioned behind bee
                            Positioned(
                              top: screenHeight * 0.01,
                              left: 0, // Set to 0 to align with the left edge
                              right: 0, // Set to 0 to align with the right edge
                              child: Container(
                                width:
                                    screenWidth, // Make width equal to screen width
                                height: screenHeight * 0.9, // Increased height to extend below bottom section
                                child: Image.asset(
                                  'lib/assets/images/BG2.png',
                                  fit: BoxFit
                                      .cover, // Use cover to fill the width
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: screenWidth,
                                      height: screenHeight * 0.9,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.white,
                                            Color(0xFFFFF9C4),
                                            Color(0xFFFFE082),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            // Bee Character Image (on top of background)
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: screenHeight * 0.35,
                                  child: Center(
                                    child: Image.asset(
                                      _onboardingData[index].imagePath,
                                      fit: BoxFit.contain,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          height: screenHeight * 0.35,
                                          width: screenWidth * 0.6,
                                          decoration: BoxDecoration(
                                            color: Colors.yellow.shade200,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: const Icon(
                                            Icons.pets,
                                            size: 100,
                                            color: Colors.orange,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Bottom Section
                SizedBox(
                  height: screenHeight * 0.5,
                  width: double.infinity,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max, // Fill the SizedBox
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // ...existing code...
// Progress Dots with background image
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                child: Image.asset(
                                  'lib/assets/images/half-blur.png',
                                  height: 245.883,
                                  width: 222.479, // Adjust height as needed
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  _onboardingData.length,
                                  (index) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    width:
                                        index == onboardingProvider.currentPage
                                            ? 32
                                            : 9,
                                    height: 9,
                                    decoration: BoxDecoration(
                                      color: index <=
                                              onboardingProvider.currentPage
                                          ? const Color(0xFFFFD700)
                                          : const Color.fromARGB(
                                              255, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 55),

                          // Title
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: _onboardingData[
                                            onboardingProvider.currentPage]
                                        .title +
                                    '\n',
                                style: GoogleFonts.manrope(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  height: 1.2,
                                ),
                                children: [
                                  TextSpan(
                                    text: _onboardingData[
                                            onboardingProvider.currentPage]
                                        .highlightWord,
                                    style: GoogleFonts.manrope(
                                      color: Color(0xFFFFD700),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 6),

                          // Description
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              right: 15.0,
                            ),
                            child: Text(
                              _onboardingData[onboardingProvider.currentPage]
                                  .description,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.manrope(
                                  fontSize: 16,
                                  color: Colors.white,
                                  height: 1.5,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),

                          const SizedBox(height: 55),

                          // Next Button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (onboardingProvider.currentPage == 4) {
                                  _completeOnboarding(context);
                                } else {
                                  onboardingProvider.goToNextPage();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFFD700),
                                foregroundColor: Colors.black,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                onboardingProvider.currentPage == 4
                                    ? 'Get Started'
                                    : 'Next',
                                style: GoogleFonts.manrope(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String highlightWord;
  final String description;
  final String imagePath;

  const OnboardingData({
    required this.title,
    required this.highlightWord,
    required this.description,
    required this.imagePath,
  });
}
