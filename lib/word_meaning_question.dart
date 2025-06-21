import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_provider.dart';

class WordMeaningQuestion extends StatelessWidget {
  const WordMeaningQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context);
    final question = provider.currentQuestion;
    final wordPairs = question.wordPairs!;
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final isSmallScreen = screenHeight < 700;

    // Shuffle words and meanings independently
    final List<Map<String, String>> shuffledWords = List.from(wordPairs)..shuffle();
    final List<Map<String, String>> shuffledMeanings = List.from(wordPairs)..shuffle();

    return Scaffold(
      extendBodyBehindAppBar: true,
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
              bottom: screenHeight * 0.03,
              left: screenWidth * 0.04,
              right: screenWidth * 0.04,
            ),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back, size: screenWidth * 0.07),
                      ),
                    ),
                    Text(
                      "Question ${provider.currentQuestionNumber}/${provider.totalQuestions}",
                      style: GoogleFonts.manrope(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                _buildProgressHeader(context),
                SizedBox(height: screenHeight * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: Text(
                    question.question,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Words column
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          shuffledWords.length,
                          (index) => _buildWordContainer(
                            context,
                            word: shuffledWords[index]['word']!,
                            wordIndex: wordPairs.indexWhere((pair) => pair['word'] == shuffledWords[index]['word']),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.04),
                      // Meanings column
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          shuffledMeanings.length,
                          (index) => _buildMeaningContainer(
                            context,
                            meaning: shuffledMeanings[index]['meaning']!,
                            meaningIndex: wordPairs.indexWhere((pair) => pair['meaning'] == shuffledMeanings[index]['meaning']),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                _buildActionButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressHeader(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context, listen: false);
    final progress = provider.progress;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(top: screenWidth * 0.05),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: screenWidth * 0.02,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(screenWidth * 0.01),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: (progress * 100).round(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow[700],
                        borderRadius: BorderRadius.circular(screenWidth * 0.01),
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

  Widget _buildWordContainer(
    BuildContext context, {
    required String word,
    required int wordIndex,
  }) {
    final provider = Provider.of<QuizProvider>(context);
    final isSelected = provider.selectedWordIndex == wordIndex;
    final isMatched = provider.matchedPairs.containsKey(wordIndex);
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
      child: GestureDetector(
        onTap: () {
          if (!isMatched) {
            provider.selectWord(wordIndex);
          }
        },
        child: Container(
          height: screenHeight * 0.14,
          width: screenWidth * 0.30,
          decoration: BoxDecoration(
            color: isMatched
                ? const Color(0xFF37BA2B)
                : isSelected
                    ? const Color(0xFFFFC300)
                    : const Color(0xFFF5F5F5),
            border: Border.all(
              color: isMatched
                  ? Colors.black
                  : isSelected
                      ? Colors.black
                      : const Color(0xFFAEAEB2),
              width: isMatched || isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
          ),
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: Center(
            child: Text(
              word,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMeaningContainer(
    BuildContext context, {
    required String meaning,
    required int meaningIndex,
  }) {
    final provider = Provider.of<QuizProvider>(context);
    final isSelected = provider.selectedMeaningIndex == meaningIndex;
    final isMatched = provider.matchedPairs.containsValue(meaningIndex);
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
      child: GestureDetector(
        onTap: () {
          if (!isMatched && provider.selectedWordIndex != null) {
            provider.selectMeaning(meaningIndex);
          }
        },
        child: Container(
          height: screenHeight * 0.14,
          width: screenWidth * 0.50,
          decoration: BoxDecoration(
            color: isMatched
                ? const Color(0xFF37BA2B)
                : isSelected
                    ? const Color(0xFFFFC300)
                    : const Color(0xFFF5F5F5),
            border: Border.all(
              color: isMatched
                  ? Colors.black
                  : isSelected
                      ? Colors.black
                      : const Color(0xFFAEAEB2),
              width: isMatched || isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
          ),
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: Center(
            child: Text(
              meaning,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context, listen: true);
    final hasPairSelected = provider.selectedWordIndex != null &&
        provider.selectedMeaningIndex != null;
    final allMatched = provider.allPairsMatched;
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: hasPairSelected || allMatched
            ? () {
                if (allMatched) {
                  provider.nextQuestion();
                } else {
                  final isCorrect = provider.checkCurrentPair();
                  if (!isCorrect) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Incorrect match. Try again!"),
                        backgroundColor: Color(0xFFFF3B30),
                      ),
                    );
                  }
                }
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: allMatched
              ? const Color(0xFFFFC300)
              : hasPairSelected
                  ? const Color(0xFF000000)
                  : Color(0xFFF5F5F5),
          foregroundColor: allMatched
              ? Colors.black
              : hasPairSelected
                  ? Color(0xFFFFC300)
                  : Color(0xFFAEAEB2),
        
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
          ),
        ),
        child: Text(
          allMatched
              ? "Continue"
              : hasPairSelected
                  ? "Check"
                  : "Select a word and meaning",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.04,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}