import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/auth_screen.dart';
import 'onboarding_provider.dart';

class OnboardingScreens extends StatelessWidget {
  const OnboardingScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final yellowColor = Colors.yellow[700];

    return Scaffold(
      
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<OnboardingProvider>(
          builder: (context, onboardingProvider, child) {
            return Column(
              children: [
                // Progress indicator
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 27.0),
                  child: Row(
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Container(
                          width:
                              (MediaQuery.of(context).size.width - 54 - 48) / 5,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index <= onboardingProvider.currentPage
                                ? yellowColor
                                : Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Update the PageView to use dynamic heights
                Expanded(
                  child: PageView(
                    controller: onboardingProvider.pageController,
                    onPageChanged: (page) {
                      onboardingProvider.goToPage(page);
                    },
                    children: [
                      OnboardingPageWidget(
                        title: 'Build Financial Health!',
                        description:
                            'Take control of your financial future with personalised pathways, engaging games, and a supportive community. It\'s time to improve your financial health.',
                        imagePath:
                            'lib/assets/images/budgeting bee pose 3 1 (1).png',
                        imageHeight: MediaQuery.of(context).size.height *
                            0.35, // Dynamic height
                      ),
                      OnboardingPageWidget(
                        title: 'Learn, Play, Grow, Earn!',
                        description:
                            'Master financial fundamentals with bite-sized lessons, quizzes, and gamified challenges designed to make learning fun and rewarding.',
                        imagePath: 'lib/assets/images/loan bee pose 1 1.png',
                        imageHeight: MediaQuery.of(context).size.height *
                            0.38, // Dynamic height
                      ),
                      OnboardingPageWidget(
                        title: 'Tailored, Personalised, Pathways!',
                        description:
                            'Receive tailored advice from certified experts, reliable curated information and AI-powered recommendations crafted for your goals and financial situation.',
                        imagePath: 'lib/assets/images/savings bee pose 2 1.png',
                        imageHeight: MediaQuery.of(context).size.height *
                            0.4, // Dynamic height
                      ),
                      OnboardingPageWidget(
                        title: 'Join Our Community, Hive!',
                        description:
                            'Collaborate with like-minded individuals through our unique group saving system, forums, focus groups and more. Together, we grow.',
                        imagePath:
                            'lib/assets/images/savings bee pose 2 1 (1).png',
                        imageHeight: MediaQuery.of(context).size.height *
                            0.4, // Dynamic height
                      ),
                      OnboardingPageWidget(
                        title: 'Start Your Journey, Today!',
                        description:
                            'Collaborate with like-minded individuals through our unique group saving system, forums, focus groups and more. Together, we grow.',
                        imagePath: 'lib/assets/images/scammer bee pose 1 1.png',
                        imageHeight: MediaQuery.of(context).size.height *
                            0.35, // Dynamic height
                        isLastPage: true,
                      ),
                    ],
                  ),
                ),

                // Navigation buttons
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 80.0, left: 20.0, right: 20.0),
                  child: Row(
                    children: [
                      if (onboardingProvider.currentPage != 4)
                        TextButton(
                          onPressed: () {
                            onboardingProvider.goToPage(4);
                          },
                          style: TextButton.styleFrom(
                            backgroundColor:
                                Colors.yellow[100], // Light yellow background
                            foregroundColor: Colors.black, // Black text color
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // Rounded corners
                            ),
                          ),
                          child: const Text(
                            'Skip',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      const SizedBox(
                          width: 10), // Small gap between Skip and Next buttons
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border(
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
                            borderRadius:
                                BorderRadius.circular(8), // Rounded corners
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .yellow[700], // Bright yellow background
                              foregroundColor: Colors.black, // Black text color
                               // Vertical padding
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(8), // Rounded corners
                              ),
                              elevation: 2, // Slight shadow
                            ),
                            onPressed: () {
                              if (onboardingProvider.currentPage == 4) {
                                // Navigate to home screen
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        const AuthScreen(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      );
                                    },
                                    transitionDuration:
                                        const Duration(milliseconds: 500),
                                  ),
                                  (Route<dynamic> route) => false,
                                );
                              } else {
                                onboardingProvider.goToNextPage();
                              }
                            },
                            child: Text(
                              onboardingProvider.currentPage == 4
                                  ? 'Get Started'
                                  : 'Next',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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

class OnboardingPageWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final bool isLastPage;
  final double? imageHeight; // Optional parameter for image height

  const OnboardingPageWidget({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    this.isLastPage = false,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        // Background image
        Positioned(
          top: screenHeight * 0.0005, // Adjust position dynamically
          left: screenWidth * 0.2, // Adjust position dynamically
          child: Image.asset(
            'lib/assets/images/BG.png',
            width: screenWidth * 1.2, // Scale width to 80% of screen width
            height: screenHeight * 0.55, // Scale height to 40% of screen height
            fit: BoxFit.contain, // Ensure the image is not cropped
          ),
        ),
        // Foreground content
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05, // Dynamic horizontal padding
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: imageHeight ?? screenHeight * 0.4, // Scaled height
                fit: BoxFit.contain,
              ),
              SizedBox(height: screenHeight * 0.05), // Dynamic spacing
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: title.substring(
                      0, title.lastIndexOf(' ')), // All words except the last
                  style: TextStyle(
                    fontSize: screenWidth * 0.06, // Scaled font size
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text:
                          '\n${title.split(' ').last}', // The last word on a new line
                      style: TextStyle(
                        fontSize: screenWidth * 0.06, // Scaled font size
                        fontWeight: FontWeight.bold,
                        color: Colors
                            .yellow[700], // Yellow color for the last word
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Dynamic spacing
              Text(
                description,
                style: TextStyle(
                  fontSize: screenWidth * 0.04, // Scaled font size
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
