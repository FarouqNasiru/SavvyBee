import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvybee/navbar.dart';
import 'package:savvybee/quiz_page.dart';
import 'package:savvybee/reusable_button.dart';
import 'package:savvybee/text_dropdown.dart';
import 'package:savvybee/bullet_point_list.dart';

class ReadingScreen extends StatelessWidget {
  final List<String> readingTexts;
  final List<Map<String, String>> dropdownData;
  final List<String> bulletPoints;
  final String? category;
  final int? level;
  final int? stage;
  final String title;
  final String description;
  final int levels;
  final int games;
  final int coins;

  const ReadingScreen({
    super.key,
    required this.readingTexts,
    required this.dropdownData,
    required this.bulletPoints,
    this.category,
    this.level,
    this.stage,
    required this.title,
    required this.description,
    required this.levels,
    required this.games,
    required this.coins,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    final String displayCategory = category ?? "Budgeting";

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Reading about $category",
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              _buildAppBarIconStack(context),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.05), // ~5% of screen width
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Card texts
                if (readingTexts.isNotEmpty)
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.012),
                    child: Text(
                      readingTexts[0],
                      style: GoogleFonts.manrope(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                if (readingTexts.length > 1)
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.012),
                    child: Text(
                      readingTexts[1],
                      style: GoogleFonts.manrope(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                if (readingTexts.length > 2)
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.012),
                    child: Text(
                      readingTexts[2],
                      style: GoogleFonts.manrope(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                SizedBox(
                    height: screenHeight * 0.025), // ~2.5% of screen height
                // Dropdowns
                ...dropdownData.map((dropdown) => Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.012),
                      child: TextDropdown(
                        headerText: dropdown['header'] ?? '',
                        dropdownText: dropdown['body'] ?? '',
                        backgroundColor: const Color(0xFFFAFAFA),
                        textColor: Colors.black,
                      ),
                    )),
                SizedBox(height: screenHeight * 0.025),
                // Bullet points
                if (bulletPoints.isNotEmpty)
                  BulletPointList(points: bulletPoints),
                SizedBox(
                    height: screenHeight * 0.075), // ~7.5% of screen height
                ReusableButton(
                  text: "Take the Quiz",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizPage(
                          category: displayCategory,
                          level: level ?? 0,
                          stage: stage ?? 0,
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
              ],
            ),
          ),
        ),
        bottomNavigationBar: const Navbar(),
      ),
    );
  }

  Widget _buildAppBarIconStack(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double iconContainerWidth = screenWidth * 0.1; // ~10% of screen width
    final double iconContainerHeight =
        iconContainerWidth * 1.28; // Maintain aspect ratio

    return SizedBox(
      width: iconContainerWidth,
      height: iconContainerHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: iconContainerHeight * 0.052, // ~5.2% of container height
            child: Image.asset(
              'lib/assets/images/Rectangle 4.png',
              width: iconContainerWidth * 0.7, // 70% of container width
              height: iconContainerHeight * 0.845, // 84.5% of container height
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: iconContainerHeight * 0.004, // ~0.4% of container height
            left: iconContainerWidth * 0.158, // ~15.8% of container width
            child: Image.asset(
              'lib/assets/images/Rectangle 3.png',
              width: iconContainerWidth * 0.81, // 81% of container width
              height: iconContainerHeight * 0.99, // 99% of container height
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: iconContainerHeight * 0.206, // ~20.6% of container height
            left: iconContainerWidth * 0.264, // ~26.4% of container width
            child: Image.asset(
              'lib/assets/images/cbi_hive.png',
              width: iconContainerWidth * 0.634, // 63.4% of container width
              height:
                  iconContainerWidth * 0.634, // Same as width for square aspect
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
