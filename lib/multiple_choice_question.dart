import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_provider.dart';

class MultipleChoiceQuestion extends StatelessWidget {
  const MultipleChoiceQuestion({super.key});

  @override
  Widget build(BuildContext context) {
   
    final provider = Provider.of<QuizProvider>(context);
    final question = provider.currentQuestion;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenHeight < 700;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/Hive.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: isSmallScreen ? 20.0 : 40.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Column(
              children: [
                // Header with back, progress, and X2 multiplier
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Question ${provider.currentQuestionNumber}/${provider.totalQuestions}",
                          style: GoogleFonts.manrope(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    // X2 Multiplier Display
                    if (provider.showX2Multiplier)
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "X2",
                            style: GoogleFonts.manrope(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFFFC300),
                            ),
                          ),
                        ),
                      )
                    else
                      const SizedBox(width: 40), // Placeholder to maintain layout
                  ],
                ),
                _buildProgressHeader(context),
                SizedBox(height: isSmallScreen ? 20 : 30),

                // Question Container
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3CC),
                    border: const Border(
                      top: BorderSide(color: Color(0xFFDF7600), width: 2),
                      left: BorderSide(color: Color(0xFFDF7600), width: 2),
                      right: BorderSide(color: Color(0xFFDF7600), width: 3),
                      bottom: BorderSide(color: Color(0xFFDF7600), width: 3),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      question.question,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 18 : 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: isSmallScreen ? 20 : 30),

                // Options
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        question.options.length,
                        (index) => _buildOption(
                          context,
                          text: question.options[index],
                          isSelected: provider.selectedIndex == index,
                          onTap: () => provider.selectAnswer(index),
                          isSmallScreen: isSmallScreen,
                        ),
                      ),
                    ),
                  ),
                ),

                // Continue/Try Again button with feedback
                _buildActionButton(context, isSmallScreen),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressHeader(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context, listen: true);
    final progress = provider.progress;

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 8,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: (progress * 100).round(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow[700],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 100 - (progress * 100).round(),
                    child: const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(
    BuildContext context, {
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
    required bool isSmallScreen,
  }) {
    final provider = Provider.of<QuizProvider>(context, listen: true);
    final showFeedback = provider.showFeedback;
    final isCorrectAnswer = provider.currentQuestion.correctAnswerIndex ==
        provider.currentQuestion.options.indexOf(text);
    final wasSelected = isSelected;

    Color getOptionColor() {
      if (!showFeedback) {
        return isSelected ? const Color(0xFFFFC300) : const Color(0xFFF5F5F5);
      } else {
        if (wasSelected && !isCorrectAnswer) {
          return const Color(0xFFFF3B30); // Red for wrong selected
        } else if (wasSelected && isCorrectAnswer) {
          return const Color(0xFF37BA2B); // Green for correct selected
        }
        // Do NOT highlight the correct answer if not selected
        return const Color(0xFFF5F5F5); // Default for others
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: isSmallScreen ? 52 : 60, // Fixed height for option
        margin: EdgeInsets.only(bottom: isSmallScreen ? 12 : 16),
        padding: EdgeInsets.symmetric(
          vertical: 0, // Remove vertical padding to fit text
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: getOptionColor(),
          border: Border(
            top: BorderSide(
                color: isSelected ? Colors.black : const Color(0xFFAEAEB2), width: 1),
            left: BorderSide(
                color: isSelected ? Colors.black : const Color(0xFFAEAEB2), width: 1),
            right: BorderSide(
                color: isSelected ? Colors.black : const Color(0xFFAEAEB2), width: 3),
            bottom: BorderSide(
                color: isSelected ? Colors.black : const Color(0xFFAEAEB2), width: 3),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "lib/assets/images/Ellipse 1.png",
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: isSmallScreen ? 14 : 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, bool isSmallScreen) {
    final provider = Provider.of<QuizProvider>(context, listen: true);
    final hasSelected = provider.selectedIndex != null;
    final showFeedback = provider.showFeedback;
    final isCorrect = showFeedback &&
        provider.selectedIndex == provider.currentQuestion.correctAnswerIndex;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showFeedback)
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                border: Border(
                  top: BorderSide(
                    color: isCorrect ? const Color(0xFF37BA2B) : const Color(0xFFFF3B30),
                    width: 4,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    isCorrect
                        ? "lib/assets/images/lets-icons_check-fill.png"
                        : "lib/assets/images/material-symbols_cancel-rounded.png",
                    width: 24,
                    height: 24,
                  ),
                  Text(
                    isCorrect ? "Great work!" : "Oops! Try again",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  if (isCorrect)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            "lib/assets/images/fluent-color_coin-multiple-16.png",
                            width: 24),
                        const SizedBox(width: 8),
                        const Text("100", style: TextStyle(fontSize: 24)),
                        const Text(" coins", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  const SizedBox(height: 2),
                ],
              ),
            ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: !hasSelected ? const Color(0xFFFFC300) : Colors.black,
                      width: 1),
                  left: BorderSide(
                      color: !hasSelected ? const Color(0xFFFFC300) : Colors.black,
                      width: 1),
                  right: BorderSide(
                      color: !hasSelected ? const Color(0xFFFFC300) : Colors.black,
                      width: 3),
                  bottom: BorderSide(
                      color: !hasSelected ? const Color(0xFFFFC300) : Colors.black,
                      width: 3),
                ),
                borderRadius: BorderRadius.circular(8),
                color: !hasSelected
                    ? Colors.black
                    : showFeedback
                        ? (isCorrect ? const Color(0xFFFFC300) : const Color(0xFFFF3B30))
                        : Colors.black,
              ),
              child: ElevatedButton(
                onPressed: hasSelected
                    ? () {
                        if (!showFeedback) {
                          // First click - check answer
                          final correct = provider.checkAnswer();
                          if (correct && provider.isLastQuestion) {
                            provider.nextQuestion();
                          }
                        } else {
                          // Subsequent clicks - continue or try again
                          if (isCorrect) {
                            provider.nextQuestion();
                          } else {
                            provider.resetQuestion();
                          }
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  !hasSelected
                      ? "Check"
                      : showFeedback
                          ? (isCorrect ? "Continue" : "Try Again")
                          : "Check",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isSmallScreen ? 14 : 16,
                    color: !hasSelected
                        ? Colors.white
                        : showFeedback
                            ? Colors.black
                            : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}