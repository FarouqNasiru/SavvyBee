import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/home_page.dart';
import 'question_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'onboarding_data_provider.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return ChangeNotifierProvider(
      create: (context) => QuestionProvider(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: screenHeight * 0.03,
              left: screenWidth * 0.04,
              right: screenWidth * 0.04,
            ),
            child: Consumer<QuestionProvider>(
              builder: (context, provider, child) {
                final progress = (provider.currentQuestionIndex + 1) /
                    provider.questions.length;
                return Column(
                  children: [
                    // Row with close icon and progress bar
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Image.asset(
                              'lib/assets/images/solar_close-square-linear.png',
                              height: screenHeight * 0.03,
                              width: screenWidth * 0.06,
                            ),
                            onPressed: () async {
                              await saveOnboardingDataToFirestore(context);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            },
                          ),
                          Expanded(
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.02),
                              child: LinearProgressIndicator(
                                value: progress,
                                minHeight: screenHeight * 0.01,
                                backgroundColor: Colors.grey[300],
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.yellow[700]!),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Question and options (in Expanded to handle small screens)
                    Expanded(
                      child: SingleChildScrollView(
                        child: _buildQuestionSection(context),
                      ),
                    ),
                    // Continue button
                    _buildContinueButton(context),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionSection(BuildContext context) {
    final provider = Provider.of<QuestionProvider>(context);
    final question = provider.currentQuestion;
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Column(
      children: [
        // Question text
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
              child: Text(
                question.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Manrope',
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
              child: Text(
                question.subtext,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Manrope',
                  color: Color(0xFF000000),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.03),
        // Options
        Column(
          children: List.generate(
            question.options.length,
            (index) => _buildOption(context,
                text: question.options[index],
                isSelected: question.selectedIndex == index, onTap: () {
              provider.selectOption(index);
              final onboardingProvider =
                  Provider.of<OnboardingDataProvider>(context, listen: false);
              onboardingProvider.addQuestionAnswer(
                question.text,
                question.options[index],
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildOption(
    BuildContext context, {
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: screenHeight * 0.015),
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02,
          horizontal: screenWidth * 0.01,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow[700] : Colors.white,
          border: const Border(
            top: BorderSide(color: Colors.black, width: 1),
            left: BorderSide(color: Colors.black, width: 1),
            right: BorderSide(color: Colors.black, width: 3),
            bottom: BorderSide(color: Colors.black, width: 3),
          ),
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    final provider = Provider.of<QuestionProvider>(context);
    final isAnswered = provider.isCurrentQuestionAnswered;
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return SizedBox(
      width: double.infinity,
      height: screenHeight * 0.06,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                color: isAnswered ? Colors.black : Colors.grey, width: 1),
            left: BorderSide(
                color: isAnswered ? Colors.black : Colors.grey, width: 1),
            right: BorderSide(
                color: isAnswered ? Colors.black : Colors.grey, width: 3),
            bottom: BorderSide(
                color: isAnswered ? Colors.black : Colors.grey, width: 3),
          ),
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
        ),
        child: ElevatedButton(
          onPressed: isAnswered
              ? () async {
                  if (provider.currentQuestionIndex <
                      provider.questions.length - 1) {
                    provider.nextQuestion();
                  } else {
                    // Submit all answers
                    print("All questions answered!");
                    await saveOnboardingDataToFirestore(context);
                    // Mark profile as completed in Firestore
                    final user = FirebaseAuth.instance.currentUser;
                    if (user != null) {
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(user.uid)
                          .set({'profileCompleted': true},
                              SetOptions(merge: true));
                    }
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: isAnswered ? Colors.yellow[700] : Colors.grey,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenWidth * 0.015),
            ),
            elevation: 2,
          ),
          child: Text(
            provider.currentQuestionIndex < provider.questions.length - 1
                ? "Continue"
                : "Submit",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.04,
            ),
          ),
        ),
      ),
    );
  }
}

// Call this function when onboarding is done
Future<void> saveOnboardingDataToFirestore(BuildContext context) async {
  final onboardingData =
      Provider.of<OnboardingDataProvider>(context, listen: false);
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set(
          onboardingData.toMap(),
          SetOptions(merge: true),
        );
  }
}
