import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvybee/data/budgeting_conent.dart';
import 'package:savvybee/reusable_button.dart';
import '../widgets/flexible_content_widget.dart';
import 'quiz_page.dart';
import 'navbar.dart';

class FlexibleReadingScreen extends StatelessWidget {
  final String? category;
  final int? level;
  final int? stage;
  final String title;
  final String description;
  final int levels;
  final int games;
  final int coins;
  final String stageKey;

  const FlexibleReadingScreen({
    super.key,
    this.category,
    this.level,
    this.stage,
    required this.title,
    required this.description,
    required this.levels,
    required this.games,
    required this.coins,
    required this.stageKey,
  });

  @override
  Widget build(BuildContext context) {
    // Set status bar to white with dark icons
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white, // Status bar background color
        statusBarIconBrightness: Brightness.dark, // For Android - black icons
        statusBarBrightness: Brightness.light, // For iOS - black icons
      ),
    );

    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    final String displayCategory = category ?? "Budgeting";

    // Get content from the new flexible structure
    final content = BudgetingContent.getContent(stageKey, level ?? 0, displayCategory);

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
                "Reading about $displayCategory",
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              _buildAppBarIconStack(context),
            ],
          ),
        ),
        body: Column(
          children: [
            // Content area that takes available space
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (content != null)
                        FlexibleContentWidget(sections: content.readingSections)
                      else
                        _buildFallbackContent(),
                    ],
                  ),
                ),
              ),
            ),
            // Button area that stays at bottom
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: ReusableButton(
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
            ),
          ],
        ),
        bottomNavigationBar: const Navbar(),
      ),
    );
  }

  Widget _buildFallbackContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Content not available',
          style: GoogleFonts.manrope(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'This content is being prepared. Please check back later.',
          style: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildAppBarIconStack(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double iconContainerWidth = screenWidth * 0.1;
    final double iconContainerHeight = iconContainerWidth * 1.28;

    return SizedBox(
      width: iconContainerWidth,
      height: iconContainerHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: iconContainerHeight * 0.052,
            child: Image.asset(
              'lib/assets/images/Rectangle 4.png',
              width: iconContainerWidth * 0.7,
              height: iconContainerHeight * 0.845,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: iconContainerHeight * 0.004,
            left: iconContainerWidth * 0.158,
            child: Image.asset(
              'lib/assets/images/Rectangle 3.png',
              width: iconContainerWidth * 0.81,
              height: iconContainerHeight * 0.99,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: iconContainerHeight * 0.206,
            left: iconContainerWidth * 0.264,
            child: Image.asset(
              'lib/assets/images/cbi_hive.png',
              width: iconContainerWidth * 0.634,
              height: iconContainerWidth * 0.634,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
