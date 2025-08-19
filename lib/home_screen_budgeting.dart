import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvybee/navbar.dart';
import 'package:savvybee/reading_screen.dart';
import 'package:savvybee/reusable_button.dart';
import 'package:savvybee/updated_card_onboarding_screen.dart';
import 'package:savvybee/videos_screen.dart';

class HomeScreenBudgeting extends StatelessWidget {
  final String category;
  final int level;
  final String stageKey;
  final String title;
  final String description;
  final int levels;
  final int games;
  final int coins;

  const HomeScreenBudgeting({
    Key? key,
    required this.category,
    required this.level,
    required this.stageKey,
    required this.title,
    required this.description,
    required this.levels,
    required this.games,
    required this.coins,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Optionally, you can make this image dynamic per category
    String beeImage = 'lib/assets/images/budgeting bee pose 2 1.png';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.07,
                bottom: screenHeight * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNavigationCard(
                      context, 'Highlights', screenHeight, screenWidth),
                  SizedBox(width: screenWidth * 0.01),
                  _buildNavigationCard(
                      context, 'Reading', screenHeight, screenWidth),
                  SizedBox(width: screenWidth * 0.01),
                  _buildNavigationCard(
                      context, 'Videos', screenHeight, screenWidth),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03,
                vertical: screenHeight * 0.02,
              ),
              decoration: BoxDecoration(
                border: const Border(
                  top: BorderSide(color: Colors.black, width: 2),
                  left: BorderSide(color: Colors.black, width: 2),
                  right: BorderSide(color: Colors.black, width: 4),
                  bottom: BorderSide(color: Colors.black, width: 4),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Image.asset(
                    beeImage,
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.4,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.01,
                      vertical: screenHeight * 0.01,
                    ),
                    child: Text(
                      '$title\n$description',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.manrope(
                        fontSize: screenHeight * 0.018,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.01,
                left: screenHeight * 0.015,
                right: screenHeight * 0.015,
                bottom: screenHeight * 0.015,
              ),
              child: ReusableButton(
                text: "Get Started",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdatedCardOnboardingScreen(
                        category: category,
                        level: level,
                        stageKey: stageKey,
                        title: title,
                        description: description,
                        levels: levels,
                        games: games,
                        coins: coins,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Navbar(),
    );
  }

  Widget _buildNavigationCard(BuildContext context, String title,
      double screenHeight, double screenWidth) {
    return GestureDetector(
      onTap: () {
        if (title == 'Highlights') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UpdatedCardOnboardingScreen(
                category: category,
                level: level,
                stageKey: stageKey,
                title: this.title,
                description: description,
                levels: levels,
                games: games,
                coins: coins,
              ),
            ),
          );
        } else if (title == 'Reading') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FlexibleReadingScreen(
                category: category,
                level: level,
                stage: int.tryParse(stageKey.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0,
                title: this.title,
                description: description,
                levels: levels,
                games: games,
                coins: coins,
                stageKey: stageKey,
              ),
            ),
          );
        } else if (title == 'Videos') {
          // Pass both category and level to VideosScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideosScreen(
                category: category,
                level: level, // Pass the current level
              ),
            ),
          );
        }
      },
      child: Container(
        width: screenWidth * 0.3,
        height: screenHeight * 0.13,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: const BorderSide(color: Colors.black, width: 1),
            left: const BorderSide(color: Colors.black, width: 1),
            right: const BorderSide(color: Colors.black, width: 3),
            bottom: const BorderSide(color: Colors.black, width: 3),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: screenWidth * 0.2,
              height: screenHeight * 0.08,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 2.5,
                    child: Image.asset(
                      'lib/assets/images/Rectangle 4.png',
                      width: screenWidth * 0.16,
                      height: 60,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: 0.2,
                    left: 15,
                    child: Image.asset(
                      'lib/assets/images/Rectangle 3.png',
                      width: screenWidth * 0.17,
                      height: 65,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: screenWidth * 0.09,
                    child: Image.asset(
                      'lib/assets/images/cbi_hive.png',
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.007,
                left: screenWidth * 0.02,
                right: screenWidth * 0.02,
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: screenHeight * 0.02,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
