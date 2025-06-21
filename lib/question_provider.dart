import 'package:flutter/material.dart';

class Question {
  final String text;
  final String subtext; // Add this line
  final List<String> options;
  int? selectedIndex;

  Question({
    required this.text,
    required this.options, 
    this.selectedIndex,
    this.subtext = "Select all that apply", // Default value
  });
}

class QuestionProvider extends ChangeNotifier {
  List<Question> questions = [
    Question(
      text: "What personal finance archetype(s) best align with you?",
      subtext: "Purpose: Tailor content and features (e.g., saving tips for savers, investing modules for investors).",
      options: [
        "The Saver",
        "The Spender",
        "The Investor",
        "The Indifferent"
      ],
    ),

      Question(
      text: "What are your top financial priorities?",
      subtext: "Purpose: Helps in suggesting modules, challenges, and expert advice.",
      options: [
        "Build an emergency fund",
        "Saving for a major purchase",
        "Paying off debt",
        "Investing for the future",
        "Retirement Planning",
        "Other"
      ],
    ),
    // Add 5 more questions here following the same pattern
    Question(
      text: "What are your top financial priorities?",
      subtext: "Purpose: Helps in suggesting modules, challenges, and expert advice.",
      options: [
        "Build an emergency fund",
        "Saving for a major purchase",
        "Paying off debt",
        "Investing for the future",
        "Retirement Planning",
        "Other"
      ],
    ),

    Question(
      text: "How do you currently manage your finances?",
      subtext: "Purpose: Provides insight into current behaviours to recommend habit-forming strategies",
      options: [
        "I budget and track expenses consistently.",
        "I save when I can but don’t have a system.",
        "I live paycheck to paycheck.",
        "I use tools to automate savings and investments.",
        "Other"
      ],
    ),

    Question(
      text: "Which topics do you find confusing or need more help with?",
      subtext: "Purpose: Allows personalized content curation and priority suggestions.",
      options: [
        "Budgeting and Savings",
        "Debt Management",
        "Investing",
        "Early-Stage Investments",
        "Homeownership",
        "Other"
      ],
    ),

    Question(
      text: "Which habits or challenges resonate most with you? (Select all that apply)",
      subtext: "Purpose: Identifies psychological barriers to improve engagement with habit-building features.",
      options: [
        "Impulse spending",
        "Procrastination in saving",
        "Fear or anxiety around money decisions",
        "Overwhelmed by too much financial information",
        "Difficulty staying consistent with financial goals",
        "None of these"
      ],
    ),

    Question(
      text: "What motivates you to learn about and improve your finances?",
      subtext: "Purpose: Helps in crafting motivational nudges and gamification incentives.",
      options: [
        "Achieving financial independence",
        "Building wealth for family/future generations",
        "Gaining confidence in financial decisions",
        "Reducing financial stress and anxiety",
        "None of these",
        "Other"
      ],
    ),
  ];

  int currentQuestionIndex = 0;
  double get progress => (currentQuestionIndex + 1) / questions.length;

  Question get currentQuestion => questions[currentQuestionIndex];

  void selectOption(int index) {
    currentQuestion.selectedIndex = index;
    notifyListeners();
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      currentQuestionIndex--;
      notifyListeners();
    }
  }

  bool get isCurrentQuestionAnswered => currentQuestion.selectedIndex != null;
}