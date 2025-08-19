import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/progress_provider.dart';

import 'quiz_provider.dart';
import 'multiple_choice_question.dart';
import 'word_meaning_question.dart';
import 'ordering_question.dart';
import 'package:flutter/services.dart';
import 'package:savvybee/budgeting_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Define the data for each card
final Map<String, Map<String, dynamic>> cardData = {
  'Budgeting': {
    'category': 'Budgeting',
    'title': 'Budgeting',
    'description':
        'Learn how a budget helps you manage income, control expenses, and plan for financial goals. By the end, you will understand budgeting basics and how to create your own.',
    'levels': 5,
    'games': 25,
    'coins': 2500,
  },
  'Savings': {
    'category': 'Savings',
    'title': 'Savings',
    'description':
        'Learn how to save money effectively and plan for future expenses. By the end, you will understand savings strategies and how to achieve your financial goals.',
    'levels': 4,
    'games': 20,
    'coins': 2000,
  },
  'Numeracy': {
    'category': 'Numeracy',
    'title': 'Numeracy',
    'description':
        'Improve your numerical skills to better manage your finances. By the end, you will understand key numeracy concepts and how to apply them in real-life scenarios.',
    'levels': 6,
    'games': 30,
    'coins': 3000,
  },
};

class QuizPage extends StatelessWidget {
  final String category;
  final int level;
  final int stage;
  final String title;
  final String description;
  final int levels;
  final int games;
  final int coins;

  const QuizPage({
    super.key,
    required this.category,
    required this.level,
    required this.stage,
    required this.title,
    required this.description,
    required this.levels,
    required this.games,
    required this.coins,
  });

  @override
  Widget build(BuildContext context) {
    // Set status bar to black icons
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, // Black icons for Android
      statusBarBrightness: Brightness.light,    // Black icons for iOS
    ));

    return ChangeNotifierProvider(
      create: (context) => QuizProvider(
        category: category,
        level: level,
        stage: stage,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/Hive.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Consumer<QuizProvider>(
            builder: (context, provider, child) {
              if (provider.isQuizComplete) {
                return _buildCompletionScreen(context);
              }
              switch (provider.currentQuestion.type) {
                case QuestionType.multipleChoice:
                  return const MultipleChoiceQuestion();
                case QuestionType.wordMeaning:
                  return const WordMeaningQuestion();
                case QuestionType.ordering:
                  return const OrderingQuestion();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCompletionScreen(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/Hive.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  "Lesson Complete",
                  style: GoogleFonts.manrope(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF000000),
                  ),
                ),
                SizedBox(
                  height: 61,
                ),
                SizedBox(
                  width: 258.67914,
                  height: 285.83337,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 2.5,
                        child: Image.asset(
                          "lib/assets/images/bee_hive_2d.png",
                          width: 258.67914,
                          height: 285.83337,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        child: Image.asset(
                          'lib/assets/images/budgeting bee pose 3 3.png',
                          width: 174,
                          height: 232,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Column(
                  children: [
                    _buildAnimatedCoinReward(),
                    SizedBox(
                      height: 52,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 40.0,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 50,
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
                          onPressed: () async {
                            final cardDescription =
                                cardData[category]?['description'] ?? '';
                            final progress = context.read<ProgressProvider>();
                            final hexagonData = [
                              'Stage 0',
                              'Stage 1',
                              'Stage 2',
                              'Stage 3',
                              'Stage 4',
                              'Stage 5'
                            ];
                            int nextStage = stage + 1; // stage is zero-based
                            if (nextStage < hexagonData.length) {
                              progress.unlockStage(
                                  category, level, hexagonData[nextStage]);
                            } else {
                              progress.unlockNextLevel(
                                  category, level + 1, 'Stage 1');
                            }
                            await incrementHearts();
                            // Go directly to BudgetingPage (replace with your actual page if needed)
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BudgetingPage(
                                  category: category,
                                  title: category, // or pass the correct title
                                  description:
                                      cardDescription, // or pass the correct description
                                  levels: levels,
                                  games: games,
                                  coins: coins,
                                ),
                              ),
                              (route) => false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFFC300),
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Text(
                            "Continue",
                            style: GoogleFonts.manrope(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedCoinReward() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 2000),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        // Phase 1 (0-0.2): Drop down fast from top center
        if (value < 0.2) {
          final dropProgress = value / 0.2;
          final scale = 4.0 + (dropProgress * 1.0); // Scale from 4x to 5x
          final offsetY = -200 + (dropProgress * 200); // Drop from -200 to 0
          
          return Transform.translate(
            offset: Offset(0, offsetY),
            child: Transform.scale(
              scale: scale,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "lib/assets/images/fluent-color_coin-multiple-16.png",
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(width: 12),
                    Text(
                      "+500 Coins",
                      style: GoogleFonts.manrope(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        
        // Phase 2 (0.2-0.4): Shake effect while big
        if (value < 0.4) {
          final shakeProgress = (value - 0.2) / 0.2;
          final shakeOffset = 10 * (1 - shakeProgress) * (shakeProgress % 0.1 > 0.05 ? 1 : -1);
          final scale = 5.0;
          
          return Transform.translate(
            offset: Offset(shakeOffset, 0),
            child: Transform.scale(
              scale: scale,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "lib/assets/images/fluent-color_coin-multiple-16.png",
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(width: 12),
                    Text(
                      "+500 Coins",
                      style: GoogleFonts.manrope(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        
        // Phase 3 (0.4-1.0): Animate to final position with size reduction
        final progress = (value - 0.4) / 0.6; // Normalize to 0-1
        final scale = 5.0 - (progress * 4.0); // Scale from 5x to 1x
        final fontSize = 32.0 - (progress * 16.0); // Font size from 32 to 16
        final imageSize = 40.0 - (progress * 24.0); // Image size from 40 to 16
        final spacing = 12.0 - (progress * 7.0); // Spacing from 12 to 5
        
        return Transform.scale(
          scale: scale,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "lib/assets/images/fluent-color_coin-multiple-16.png",
                width: imageSize,
                height: imageSize,
              ),
              SizedBox(width: spacing),
              Text(
                "+500 Coins",
                style: GoogleFonts.manrope(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF000000),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Call this after quiz completion
Future<void> incrementHearts() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final userDoc =
        FirebaseFirestore.instance.collection('users').doc(user.uid);
    await userDoc.update({
      'hearts': FieldValue.increment(1),
    });
  }
}
