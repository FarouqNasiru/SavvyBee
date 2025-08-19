import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/card_onboarding_provider.dart';
import 'package:savvybee/data/budgeting_conent.dart';
import 'package:savvybee/reading_screen.dart';
import 'navbar.dart';

class UpdatedCardOnboardingScreen extends StatelessWidget {
  final String category;
  final int level;
  final String stageKey;
  final String title;
  final String description;
  final int levels;
  final int games;
  final int coins;

  const UpdatedCardOnboardingScreen({
    super.key,
    required this.category,
    required this.level,
    required this.stageKey,
    required this.title,
    required this.description,
    required this.levels,
    required this.games,
    required this.coins,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final content = BudgetingContent.getContent(stageKey, level, category);
    final List<String> cardTexts = content?.cardTexts ?? ['Welcome!', 'Let\'s learn together.', 'Start now!'];
    
    final List<Map<String, String>> cardData = List.generate(
      cardTexts.length,
      (index) => {'mainText': cardTexts[index]},
    );

    return ChangeNotifierProvider(
      create: (_) => CardOnboardingProvider(),
      child: Scaffold(
        appBar: _buildAppBar(context),
        backgroundColor: Colors.white,
        body: _buildBody(context, cardData),
        bottomNavigationBar: const Navbar(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Highlights for $category",
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          _buildAppBarIconStack(context),
        ],
      ),
    );
  }

  Widget _buildAppBarIconStack(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth * 0.1;

    return SizedBox(
      width: iconSize,
      height: iconSize * 1.28,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: iconSize * 0.066,
            child: Image.asset(
              'lib/assets/images/Rectangle 4.png',
              width: iconSize * 0.7,
              height: iconSize * 1.08,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: iconSize * 0.005,
            left: iconSize * 0.16,
            child: Image.asset(
              'lib/assets/images/Rectangle 3.png',
              width: iconSize * 0.81,
              height: iconSize * 1.27,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: iconSize * 0.26,
            left: iconSize * 0.26,
            child: Image.asset(
              'lib/assets/images/cbi_hive.png',
              width: iconSize * 0.63,
              height: iconSize * 0.63,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, List<Map<String, String>> cardData) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Consumer<CardOnboardingProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              SizedBox(height: screenHeight * 0.025),
              _buildPageView(provider, screenHeight, cardData, context),
              _buildPageIndicator(provider, context, cardData),
              // Continue button that appears only on the last card
              if (provider.currentPage == cardData.length - 1)
                _buildContinueButton(context, screenHeight),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context, double screenHeight) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Padding(
      padding: EdgeInsets.only(
        bottom: screenHeight * 0.05,
        left: screenWidth * 0.05,
        right: screenWidth * 0.05,
      ),
      child: SizedBox(
        width: double.infinity,
        height: screenHeight * 0.06,
        child: Container(
          decoration: BoxDecoration(
            border: const Border(
              top: BorderSide(color: Colors.black, width: 1),
              left: BorderSide(color: Colors.black, width: 1),
              right: BorderSide(color: Colors.black, width: 3),
              bottom: BorderSide(color: Colors.black, width: 3),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow[700],
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 2,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FlexibleReadingScreen(
                    category: category,
                    level: level,
                    stage: int.tryParse(stageKey.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0,
                    title: title,
                    description: description,
                    levels: levels,
                    games: games,
                    coins: coins,
                    stageKey: stageKey,
                  ),
                ),
              );
            },
            child: Text(
              'Continue',
              style: GoogleFonts.manrope(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageView(
      CardOnboardingProvider provider,
      double screenHeight,
      List<Map<String, String>> cardData,
      BuildContext context) {
    return Expanded(
      child: PageView(
        controller: provider.pageController,
        onPageChanged: provider.goToPage,
        children: cardData.asMap().entries.map((entry) {
          final index = entry.key;
          final data = entry.value;
          return Builder(
            builder: (context) => _buildCard(
              context,
              data,
              screenHeight,
              isLastCard: index == cardData.length - 1,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPageIndicator(CardOnboardingProvider provider,
      BuildContext context, List<Map<String, String>> cardData) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          cardData.length,
          (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
            child: Container(
              width: screenWidth * 0.09,
              height: screenHeight * 0.01,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenHeight * 0.012),
                color: index == provider.currentPage
                    ? const Color(0xFFFFC300)
                    : Colors.grey[300],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context,
    Map<String, String> data,
    double screenHeight, {
    bool isLastCard = false,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.05),
      child: Stack(
        children: [
          _buildCardBackground(screenHeight),
          _buildCardOverlay(context),
          _buildCardContent(data, context),
        ],
      ),
    );
  }

  Widget _buildCardBackground(double screenHeight) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(screenHeight * 0.02),
      child: Image.asset(
        'lib/assets/images/image 5.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: screenHeight * 0.44,
      ),
    );
  }

  Widget _buildCardOverlay(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 252, 174, 4),
          width: screenHeight * 0.005,
        ),
        borderRadius: BorderRadius.circular(screenHeight * 0.02),
        color: const Color(0xFFFFE975).withOpacity(0.7),
      ),
    );
  }

  Widget _buildCardContent(Map<String, String> data, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
        child: Text(
          data['mainText']!,
          style: TextStyle(
            fontSize: screenWidth * 0.08,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
