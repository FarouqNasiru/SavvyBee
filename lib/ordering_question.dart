import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_provider.dart';

class OrderingQuestion extends StatefulWidget {
  const OrderingQuestion({super.key});

  @override
  State<OrderingQuestion> createState() => _OrderingQuestionState();
}

class _OrderingQuestionState extends State<OrderingQuestion> {
  bool _showResultModal = false;
  bool _isCorrect = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<QuizProvider>(context, listen: false)
          .initializeOrderingQuestion();
    });
  }

  void _checkAnswer() {
    final provider = Provider.of<QuizProvider>(context, listen: false);
    final correct = provider.checkOrder();

    setState(() {
      _isCorrect = correct;
      _showResultModal = true;
    });

   
  }

  void _continueToNext() {
    setState(() {
      _showResultModal = false;
    });
    Provider.of<QuizProvider>(context, listen: false).nextQuestion();
  }

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
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: isSmallScreen ? 20.0 : 40.0,
                  left: 16.0,
                  right: 16.0,
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
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                    Text(
                      "Question ${provider.currentQuestionNumber}/${provider.totalQuestions}",
                      style: GoogleFonts.manrope(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                    // Progress bar and close button
                    _buildProgressHeader(context),
                    SizedBox(height: isSmallScreen ? 20 : 30),

                    // Question text
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                    SizedBox(height: isSmallScreen ? 20 : 30),

                    // Orderable items
                    Expanded(
                      child: ReorderableListView(
                        padding: EdgeInsets.zero,
                        onReorder: (oldIndex, newIndex) {
                          provider.swapOrderItems(oldIndex, newIndex);
                        },
                        children: [
                          for (int i = 0; i < provider.currentOrder.length; i++)
                            _buildOrderItem(
                              context,
                              text: question
                                  .orderingItems![provider.currentOrder[i]],
                              index: i,
                              isSmallScreen: isSmallScreen,
                            ),
                        ],
                      ),
                    ),

                    // Check Answer/Continue button
                    _buildActionButton(context, isSmallScreen),
                  ],
                ),
              ),

              // Result modal
              if (_showResultModal)
                Positioned(
                  bottom: 135, // Move modal just above the button
                  left: 16,
                  right: 16,
                  child: _buildResultModal(context),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultModal(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: _isCorrect ? Color(0xFF37BA2B) : Color(0xFFFF3B30),
            width: 4,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Row(
       mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
                    _isCorrect 
                        ? "lib/assets/images/lets-icons_check-fill.png"
                        : "lib/assets/images/material-symbols_cancel-rounded.png",
                    width: 24,
                    height: 24,
                  ),
          Text(
            _isCorrect ? 'Great work! 🎉' : 'Oops! Try again',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
         
            const Spacer(),
                  if (_isCorrect)
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
          if (!_isCorrect)
            TextButton(
              onPressed: () {
                setState(() {
                  _showResultModal = false;
                });
                Provider.of<QuizProvider>(context, listen: false)
                    .resetOrderingQuestion();
              },
              child: Text(
                'Try Again',
                style: TextStyle(
                  color: Color(0xFFFF3B30),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildProgressHeader(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context, listen: false);
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

  Widget _buildOrderItem(
    BuildContext context, {
    required String text,
    required int index,
    required bool isSmallScreen,
  }) {
    final provider = Provider.of<QuizProvider>(context, listen: true);
    final isChecked = provider.isOrderChecked;
    final isCorrect = provider.isOrderCorrect;

    return Container(
      key: Key('order_item_$index'),
      height: 60,
      margin: EdgeInsets.only(bottom: isSmallScreen ? 12 : 16),
      decoration: BoxDecoration(
        color: isChecked
            ? (isCorrect ? Color(0xFF37BA2B) : Color(0xFFFF3B30))
            : Color(0xFFF5F5F5),
        border: Border(
          top: BorderSide(
              color: isCorrect ? Colors.black : Color(0xFFAEAEB2), width: 1),
          left: BorderSide(
              color: isCorrect ? Colors.black : Color(0xFFAEAEB2), width: 1),
          right: BorderSide(
              color: isCorrect ? Colors.black : Color(0xFFAEAEB2), width: 3),
          bottom: BorderSide(
              color: isCorrect ? Colors.black : Color(0xFFAEAEB2), width: 3),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Image.asset(
              "lib/assets/images/hamburger.png",
              width: 18,
              height: 12,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: isSmallScreen ? 12 : 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // Update your _buildActionButton to ensure it stays above the modal
  Widget _buildActionButton(BuildContext context, bool isSmallScreen) {
    final provider = Provider.of<QuizProvider>(context, listen: true);
    final isChecked = provider.isOrderChecked;
    final isCorrect = provider.isOrderCorrect;

    return Container(
      margin: EdgeInsets.only(bottom: isSmallScreen ? 20 : 40),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white, // Background to ensure it's opaque
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                color: isCorrect ? Colors.black : Color(0xFFAEAEB2), width: 1),
            left: BorderSide(
                color: isCorrect ? Colors.black : Color(0xFFAEAEB2), width: 1),
            right: BorderSide(
                color: isCorrect ? Colors.black : Color(0xFFAEAEB2), width: 3),
            bottom: BorderSide(
                color: isCorrect ? Colors.black : Color(0xFFAEAEB2), width: 3),
          ),
          borderRadius: BorderRadius.circular(8),
          color: isChecked
              ? (isCorrect ? Color(0xFF37BA2B) : Color(0xFFFF3B30))
              : Color(0xFFAEAEB2),
        ),
        child: ElevatedButton(
          onPressed: () {
            if (!isChecked) {
              _checkAnswer();
            } else if (isCorrect) {
              provider.nextQuestion();
            } else {
              provider.resetOrderingQuestion();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: isChecked
                ? (isCorrect ? Color(0xFFFFC300) : Color(0xFFFF3B30))
                : Colors.black,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            !isChecked
                ? "Check"
                : isCorrect
                    ? "Continue"
                    : "Try Again",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isSmallScreen ? 14 : 16,
            ),
          ),
        ),
      ),
    );
  }
}
