import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_provider.dart';

class WordMeaningQuestion extends StatefulWidget {
  const WordMeaningQuestion({super.key});

  @override
  State<WordMeaningQuestion> createState() => _WordMeaningQuestionState();
}

class _WordMeaningQuestionState extends State<WordMeaningQuestion> {
  late List<Map<String, String>> shuffledWords;
  late List<Map<String, String>> shuffledMeanings;
  int currentWordIndex = 0;

  // Step-by-step state
  int stepCurrentWord = 0;
  int? stepSelectedMeaning;
  bool stepShowFeedback = false;
  bool stepIsCorrect = false;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<QuizProvider>(context, listen: false);
    final wordPairs = provider.currentQuestion.wordPairs!;
    shuffledWords = List.from(wordPairs)..shuffle();
    shuffledMeanings = List.from(wordPairs)..shuffle();
  }

  void _handleStepCheck(List<Map<String, String>> wordPairs, List<String?> uniqueMeanings) {
    setState(() {
      stepShowFeedback = true;
      stepIsCorrect = wordPairs[stepCurrentWord]['meaning'] == uniqueMeanings[stepSelectedMeaning!];
    });
  }

  void _handleStepNext(List<Map<String, String>> wordPairs) {
    setState(() {
      if (stepCurrentWord < wordPairs.length - 1) {
        stepCurrentWord++;
        stepSelectedMeaning = null;
        stepShowFeedback = false;
        stepIsCorrect = false;
      } else {
        Provider.of<QuizProvider>(context, listen: false).nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context);
    final question = provider.currentQuestion;
    final wordPairs = question.wordPairs!;
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final isSmallScreen = screenHeight < 700;

    final uniqueMeanings = wordPairs.map((e) => e['meaning']).toSet().toList();
    final isStepByStep = uniqueMeanings.length == 2 && wordPairs.length > 2;

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

                // --- STEP-BY-STEP MODE ---
                if (isStepByStep)
                  Expanded(
                    child: _StepByStepWordMeaning(
                      word: wordPairs[stepCurrentWord]['word']!,
                      uniqueMeanings: uniqueMeanings,
                      selectedMeaningIndex: stepSelectedMeaning,
                      showFeedback: stepShowFeedback,
                      isCorrect: stepIsCorrect,
                      onSelectMeaning: (i) {
                        if (!stepShowFeedback) {
                          setState(() {
                            stepSelectedMeaning = i;
                          });
                        }
                      },
                      buildWordContainer: (context, {required word, required isMatched, required isSelected}) =>
                          _buildWordContainerStep(context, word: word, isMatched: isMatched, isSelected: isSelected),
                      buildMeaningContainer: (context, {required meaning, required isMatched, required isSelected}) =>
                          _buildMeaningContainerStep(context, meaning: meaning, isMatched: isMatched, isSelected: isSelected),
                    ),
                  )
                // --- NORMAL MODE ---
                else
                  Expanded(
                    child: SingleChildScrollView(
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
                  ),
                SizedBox(height: screenHeight * 0.02),
                _buildActionButton(context, isStepByStep: isStepByStep, wordPairs: wordPairs, uniqueMeanings: uniqueMeanings),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // For step-by-step mode: use same style as normal containers
  Widget _buildWordContainerStep(BuildContext context, {required String word, required bool isMatched, required bool isSelected}) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
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
            width: 2,
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
    );
  }

  Widget _buildMeaningContainerStep(BuildContext context, {required String meaning, required bool isMatched, required bool isSelected}) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
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
            width: 2,
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
              width: 2, // Always 2 to prevent movement
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
              width: 2, // Always 2 to prevent movement
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

  Widget _buildActionButton(BuildContext context, {required bool isStepByStep, required List<Map<String, String>> wordPairs, required List<String?> uniqueMeanings}) {
    final provider = Provider.of<QuizProvider>(context, listen: true);
    final hasPairSelected = provider.selectedWordIndex != null && provider.selectedMeaningIndex != null;
    final allMatched = provider.allPairsMatched;
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    // For step-by-step mode, use local state
    bool stepHasSelected = stepSelectedMeaning != null;
    bool stepShowFb = stepShowFeedback;
    bool stepIsCorr = stepIsCorrect;
    bool isLastStep = stepCurrentWord == wordPairs.length - 1;

    // Determine button color and text color
    final bool isButtonEnabled = isStepByStep
        ? (stepHasSelected || stepShowFb)
        : (hasPairSelected || allMatched);
    final Color buttonColor = isStepByStep
        ? (stepShowFb
            ? (stepIsCorr ? const Color(0xFF37BA2B) : const Color(0xFFFF3B30))
            : (stepHasSelected ? Colors.black : const Color(0xFFF5F5F5)))
        : (allMatched
            ? const Color(0xFFFFC300)
            : hasPairSelected
                ? Colors.black
                : const Color(0xFFF5F5F5));
    final Color textColor = isStepByStep
        ? (stepShowFb
            ? Colors.black
            : (stepHasSelected ? const Color(0xFFFFC300) : const Color(0xFFAEAEB2)))
        : (allMatched
            ? Colors.black
            : hasPairSelected
                ? const Color(0xFFFFC300)
                : const Color(0xFFAEAEB2));

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isStepByStep && stepShowFb)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              border: Border(
                top: BorderSide(
                  color: stepIsCorr ? const Color(0xFF37BA2B) : const Color(0xFFFF3B30),
                  width: 4,
                ),
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  stepIsCorr ? Icons.check_circle : Icons.cancel,
                  color: stepIsCorr ? const Color(0xFF37BA2B) : const Color(0xFFFF3B30),
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  stepIsCorr ? "Great work!" : "Oops! Try again",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        if (!isStepByStep && provider.showFeedback && !allMatched)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              border: const Border(
                top: BorderSide(
                  color: Color(0xFFFF3B30),
                  width: 4,
                ),
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: const [
                Image(
                  image: AssetImage("lib/assets/images/material-symbols_cancel-rounded.png"),
                  width: 24,
                  height: 24,
                ),
                Text(
                  "Oops! Try again",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
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
                    color: isButtonEnabled ? Colors.black : const Color(0xFFAEAEB2), width: 1),
                left: BorderSide(
                    color: isButtonEnabled ? Colors.black : const Color(0xFFAEAEB2), width: 1),
                right: BorderSide(
                    color: isButtonEnabled ? Colors.black : const Color(0xFFAEAEB2), width: 3),
                bottom: BorderSide(
                    color: isButtonEnabled ? Colors.black : const Color(0xFFAEAEB2), width: 3),
              ),
              borderRadius: BorderRadius.circular(12),
              color: buttonColor,
            ),
            child: ElevatedButton(
              onPressed: isButtonEnabled
                  ? () {
                      if (isStepByStep) {
                        if (!stepShowFb) {
                          _handleStepCheck(wordPairs, uniqueMeanings);
                        } else if (stepIsCorr) {
                          _handleStepNext(wordPairs); // This advances to next word or next question
                        } else {
                          setState(() {
                            stepShowFeedback = false;
                            stepSelectedMeaning = null;
                          });
                        }
                      } else {
                        if (allMatched) {
                          provider.nextQuestion();
                        } else {
                          provider.checkCurrentPair();
                        }
                      }
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
                disabledBackgroundColor: buttonColor,
                disabledForegroundColor: textColor,
              ),
              child: Text(
                isStepByStep
                    ? (stepShowFb
                        ? (stepIsCorr
                            ? (isLastStep ? "Finish" : "Next")
                            : "Try Again")
                        : "Check")
                    : (allMatched
                        ? "Continue"
                        : hasPairSelected
                            ? "Check"
                            : "Select a word and meaning"),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.04,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Step-by-step widget (presentation only, no button)
class _StepByStepWordMeaning extends StatelessWidget {
  final String word;
  final List<String?> uniqueMeanings;
  final int? selectedMeaningIndex;
  final bool showFeedback;
  final bool isCorrect;
  final void Function(int) onSelectMeaning;
  final Widget Function(BuildContext, {required String word, required bool isMatched, required bool isSelected}) buildWordContainer;
  final Widget Function(BuildContext, {required String meaning, required bool isMatched, required bool isSelected}) buildMeaningContainer;

  const _StepByStepWordMeaning({
    required this.word,
    required this.uniqueMeanings,
    required this.selectedMeaningIndex,
    required this.showFeedback,
    required this.isCorrect,
    required this.onSelectMeaning,
    required this.buildWordContainer,
    required this.buildMeaningContainer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildWordContainer(
          context,
          word: word,
          isMatched: showFeedback && isCorrect,
          isSelected: true,
        ),
        const SizedBox(height: 24),
        ...List.generate(2, (i) {
          final meaning = uniqueMeanings[i]!;
          final isSelected = selectedMeaningIndex == i;
          final isMatched = showFeedback && isCorrect && isSelected;
          return GestureDetector(
            onTap: showFeedback ? null : () => onSelectMeaning(i),
            child: buildMeaningContainer(
              context,
              meaning: meaning,
              isMatched: isMatched,
              isSelected: isSelected,
            ),
          );
        }),
      ],
    );
  }
}