import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

enum QuestionType { multipleChoice, wordMeaning, ordering }

class QuizQuestion {
  final QuestionType type;
  final String question;
  final List<String> options;
  final int? correctAnswerIndex;
  final String? explanation;
  final List<Map<String, String>>? wordPairs; // For word-meaning questions
  final List<String>? orderingItems; // For ordering questions
  final List<int>? correctOrder; // Indexes representing correct order

  QuizQuestion.multipleChoice({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    this.explanation,
  })  : type = QuestionType.multipleChoice,
        wordPairs = null,
        orderingItems = null,
        correctOrder = null;

  QuizQuestion.wordMeaning({
    required this.question,
    required this.wordPairs,
    this.explanation,
  })  : type = QuestionType.wordMeaning,
        options = const [],
        correctAnswerIndex = null,
        orderingItems = null,
        correctOrder = null;

  QuizQuestion.ordering({
    required this.question,
    required this.orderingItems,
    required this.correctOrder,
    this.explanation,
  })  : type = QuestionType.ordering,
        options = const [],
        correctAnswerIndex = null,
        wordPairs = null;
}

// Example quiz bank: category -> level -> stage -> List<QuizQuestion>
final Map<String, List<List<List<QuizQuestion>>>> quizBank = {
  'Budgeting': [
    // Level 0
    [
      // Stage 0
      [
        QuizQuestion.multipleChoice(
          question: "Why is tracking your money important?",
          options: [
            "It helps you spend money faster",
            "It ensures you never receive money.",
            "It helps you avoid overspending and reach savings goals",
            "It makes money disappear from your account."
          ],
          correctAnswerIndex: 2,
          explanation: "A budget is a plan for your money.",
        ),
        QuizQuestion.multipleChoice(
            question:
                "One way to track your money is by keeping and reviewing your ______.",
            options: ["Reciepts", "Paper", "Invoice", "Budget"],
            correctAnswerIndex: 0),
        QuizQuestion.wordMeaning(
          question: "Match each tracking method with its correct description.",
          wordPairs: [
            {
              "word": "Notebook",
              "meaning": "Writing down income and expenses manually."
            },
            {
              "word": "App",
              "meaning": "Using technology to track money easily."
            },
            {
              "Receipts ": "Keeping records of purchases for review.",
              "Spreadsheet ": "Organizing finances in a structured format."
            },
          ],
        ),
        QuizQuestion.multipleChoice(
          question:
              "Tracking both income and expenses helps you know exactly where your money comes from and where it goes.",
          options: ["True", "False"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the steps in the correct order for tracking your money:",
          orderingItems: [
            "Check your spending weekly",
            "Record income and expenses",
            "Identify areas to save",
            "Use a tracking method (notebook, app, receipts, or spreadsheet)"
          ],
          correctOrder: [1, 3, 0, 2],
        )
      ],
      // Stage 1
      [
        QuizQuestion.multipleChoice(
          question:
              "Why is it important to record every transaction as it happens?",
          options: [
            "To make your budget look better than it is",
            "To ensure you don't forget any details about your spending",
            "To impress your friends with your record-keeping skills",
            "To delay updating your budget later"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "Recording transactions right away helps you avoid ______ in your budget.",
          options: ["Errors", "Surprises", "Savings", "Income"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.wordMeaning(
          question: "Match each tracking method with its correct description.",
          wordPairs: [
            {
              "word": "Spreadsheet",
              "meaning": "Organizing finances in a structured format."
            },
            {
              "word": "Notebook",
              "meaning": "Writing down income and expenses manually."
            },
            {
              "word": "App",
              "meaning": "Using technology to track money easily."
            },
            {
              "word": "Receipts",
              "meaning": "Keeping records of purchases for review."
            }
          ],
        ),
        QuizQuestion.multipleChoice(
          question:
              "It is acceptable to record transactions at the end of the month as long as you remember everything.",
          options: ["True", "False"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.ordering(
          question: "Arrange these steps for proper transaction recording:",
          orderingItems: [
            "File or save receipts",
            "Make a purchase or receive income",
            "Review your entries for accuracy",
            "Immediately record the transaction"
          ],
          correctOrder: [1, 3, 0, 2],
        )
      ],
      // Stage 2
      [
        QuizQuestion.multipleChoice(
          question:
              "Why is it important to record every transaction as it happens?",
          options: [
            "To make your budget look better than it is",
            "To ensure you don't forget any details about your spending",
            "To impress your friends with your record-keeping skills",
            "To delay updating your budget later"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "Recording transactions right away helps you avoid ______ in your budget.",
          options: ["Errors", "Surprises", "Savings", "Income"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.wordMeaning(
          question: "Match each tracking method with its correct description.",
          wordPairs: [
            {
              "word": "Spreadsheet",
              "meaning": "Organizing finances in a structured format."
            },
            {
              "word": "Notebook",
              "meaning": "Writing down income and expenses manually."
            },
            {
              "word": "App",
              "meaning": "Using technology to track money easily."
            },
            {
              "word": "Receipts",
              "meaning": "Keeping records of purchases for review."
            }
          ],
        ),
        QuizQuestion.multipleChoice(
          question:
              "It is acceptable to record transactions at the end of the month as long as you remember everything.",
          options: ["True", "False"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.ordering(
          question: "Arrange these steps for proper transaction recording:",
          orderingItems: [
            "File or save receipts",
            "Make a purchase or receive income",
            "Review your entries for accuracy",
            "Immediately record the transaction"
          ],
          correctOrder: [1, 3, 0, 2],
        )
      ],
      // Stage 3
      [
        QuizQuestion.multipleChoice(
          question:
              "Why is it important to record every transaction as it happens?",
          options: [
            "To make your budget look better than it is",
            "To ensure you don't forget any details about your spending",
            "To impress your friends with your record-keeping skills",
            "To delay updating your budget later"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "Recording transactions right away helps you avoid ______ in your budget.",
          options: ["Errors", "Surprises", "Savings", "Income"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.wordMeaning(
          question: "Match each tracking method with its correct description.",
          wordPairs: [
            {
              "word": "Spreadsheet",
              "meaning": "Organizing finances in a structured format."
            },
            {
              "word": "Notebook",
              "meaning": "Writing down income and expenses manually."
            },
            {
              "word": "App",
              "meaning": "Using technology to track money easily."
            },
            {
              "word": "Receipts",
              "meaning": "Keeping records of purchases for review."
            }
          ],
        ),
        QuizQuestion.multipleChoice(
          question:
              "It is acceptable to record transactions at the end of the month as long as you remember everything.",
          options: ["True", "False"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.ordering(
          question: "Arrange these steps for proper transaction recording:",
          orderingItems: [
            "File or save receipts",
            "Make a purchase or receive income",
            "Review your entries for accuracy",
            "Immediately record the transaction"
          ],
          correctOrder: [1, 3, 0, 2],
        )
      ],
      // Stage 4
      [
        QuizQuestion.multipleChoice(
          question:
              "Why is it important to record every transaction as it happens?",
          options: [
            "To make your budget look better than it is",
            "To ensure you don't forget any details about your spending",
            "To impress your friends with your record-keeping skills",
            "To delay updating your budget later"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "Recording transactions right away helps you avoid ______ in your budget.",
          options: ["Errors", "Surprises", "Savings", "Income"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.wordMeaning(
          question: "Match each tracking method with its correct description.",
          wordPairs: [
            {
              "word": "Spreadsheet",
              "meaning": "Organizing finances in a structured format."
            },
            {
              "word": "Notebook",
              "meaning": "Writing down income and expenses manually."
            },
            {
              "word": "App",
              "meaning": "Using technology to track money easily."
            },
            {
              "word": "Receipts",
              "meaning": "Keeping records of purchases for review."
            }
          ],
        ),
        QuizQuestion.multipleChoice(
          question:
              "It is acceptable to record transactions at the end of the month as long as you remember everything.",
          options: ["True", "False"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.ordering(
          question: "Arrange these steps for proper transaction recording:",
          orderingItems: [
            "File or save receipts",
            "Make a purchase or receive income",
            "Review your entries for accuracy",
            "Immediately record the transaction"
          ],
          correctOrder: [1, 3, 0, 2],
        )
      ],
    ],
    // Level 1
    [
      // Stage 0
      [
        QuizQuestion.multipleChoice(
          question:
              "What should you do if your expenses are more than your income?",
          options: [
            "Reduce expenses",
            "Ignore it",
            "Spend more",
            "Borrow more"
          ],
          correctAnswerIndex: 0,
          explanation: "Reducing expenses is the best option.",
        ),
      ],
      // Stage 1
      [
        QuizQuestion.wordMeaning(
          question: "Match the financial terms",
          wordPairs: [
            {"word": "Savings", "meaning": "Money set aside"},
            {"word": "Debt", "meaning": "Money you owe"},
            {"word": "Investment", "meaning": "Money put to grow"},
          ],
        ),
      ],
      // Stage 2
      [
        QuizQuestion.multipleChoice(
          question: "Which is a variable expense?",
          options: ["Electricity bill", "Rent", "Subscription", "Loan EMI"],
          correctAnswerIndex: 0,
          explanation: "Electricity bill can change every month.",
        ),
      ],
      // Stage 3
      [
        QuizQuestion.ordering(
          question: "Arrange these in order for making a budget",
          orderingItems: [
            "List income",
            "List expenses",
            "Subtract expenses from income",
            "Adjust as needed"
          ],
          correctOrder: [0, 1, 2, 3],
          explanation: "Income, expenses, subtract, adjust.",
        ),
      ],
      // Stage 4
      [
        QuizQuestion.multipleChoice(
          question: "What is the benefit of budgeting?",
          options: [
            "Helps control spending",
            "Makes you spend more",
            "No benefit",
            "Confuses you"
          ],
          correctAnswerIndex: 0,
          explanation: "Budgeting helps you control your spending.",
        ),
      ],
    ],
  ],
  'Saving': [
    // Level 0
    [
      // Stage 0
      [
        QuizQuestion.multipleChoice(
          question: "Why should you save money?",
          options: [
            "For emergencies",
            "For fun",
            "For shopping",
            "For nothing"
          ],
          correctAnswerIndex: 0,
          explanation: "Saving helps you prepare for emergencies.",
        ),
      ],
      // Stage 1
      [
        QuizQuestion.wordMeaning(
          question: "Match the saving terms",
          wordPairs: [
            {"word": "Goal", "meaning": "Something you want to achieve"},
            {"word": "Interest", "meaning": "Money earned on savings"},
            {"word": "Deposit", "meaning": "Money put into an account"},
          ],
        ),
      ],
      // Stage 2
      [
        QuizQuestion.multipleChoice(
          question: "What is an emergency fund?",
          options: [
            "Money for emergencies",
            "Money for shopping",
            "Money for travel",
            "Money for gifts"
          ],
          correctAnswerIndex: 0,
          explanation: "An emergency fund is money set aside for emergencies.",
        ),
      ],
      // Stage 3
      [
        QuizQuestion.ordering(
          question: "Arrange these saving steps in order",
          orderingItems: [
            "Set a savings goal",
            "Open a savings account",
            "Deposit money",
            "Track progress"
          ],
          correctOrder: [0, 1, 2, 3],
          explanation: "Goal, account, deposit, track.",
        ),
      ],
    ],
    // Level 1
    [
      // Stage 0
      [
        QuizQuestion.multipleChoice(
          question: "Which is a good saving habit?",
          options: [
            "Save regularly",
            "Spend all you earn",
            "Ignore savings",
            "Borrow for fun"
          ],
          correctAnswerIndex: 0,
          explanation: "Saving regularly is a good habit.",
        ),
      ],
      // Stage 1
      [
        QuizQuestion.wordMeaning(
          question: "Match the terms",
          wordPairs: [
            {"word": "Principal", "meaning": "Original amount saved"},
            {"word": "Compound interest", "meaning": "Interest on interest"},
            {"word": "Withdrawal", "meaning": "Taking money out"},
          ],
        ),
      ],
      // Stage 2
      [
        QuizQuestion.multipleChoice(
          question: "What is the benefit of compound interest?",
          options: [
            "Money grows faster",
            "No benefit",
            "Lose money",
            "Spend more"
          ],
          correctAnswerIndex: 0,
          explanation: "Compound interest helps your money grow faster.",
        ),
      ],
      // Stage 3
      [
        QuizQuestion.ordering(
          question: "Arrange these in order for saving for a goal",
          orderingItems: [
            "Decide what you want",
            "Calculate how much you need",
            "Save regularly",
            "Reach your goal"
          ],
          correctOrder: [0, 1, 2, 3],
          explanation: "Decide, calculate, save, reach.",
        ),
      ],
    ],
  ],
  'Numeracy': [
    // Level 0
    [
      // Stage 0
      [
        QuizQuestion.multipleChoice(
          question: "What is 10% of 200?",
          options: ["20", "2", "10", "200"],
          correctAnswerIndex: 0,
          explanation: "10% of 200 is 20.",
        ),
      ],
      // Stage 1
      [
        QuizQuestion.wordMeaning(
          question: "Match the numeracy terms",
          wordPairs: [
            {"word": "Addition", "meaning": "Finding the total"},
            {"word": "Subtraction", "meaning": "Taking away"},
            {"word": "Multiplication", "meaning": "Repeated addition"},
          ],
        ),
      ],
      // Stage 2
      [
        QuizQuestion.multipleChoice(
          question: "If you buy 3 items at \$5 each, how much do you spend?",
          options: ["\$15", "\$8", "\$5", "\$10"],
          correctAnswerIndex: 0,
          explanation: "3 x 5 = 15.",
        ),
      ],
      // Stage 3
      [
        QuizQuestion.ordering(
          question: "Arrange these numbers from smallest to largest",
          orderingItems: ["8", "3", "15", "10"],
          correctOrder: [1, 0, 3, 2],
          explanation: "3, 8, 10, 15.",
        ),
      ],
    ],
    // Level 1
    [
      // Stage 0
      [
        QuizQuestion.multipleChoice(
          question: "What is 25% of 80?",
          options: ["20", "25", "8", "40"],
          correctAnswerIndex: 0,
          explanation: "25% of 80 is 20.",
        ),
      ],
      // Stage 1
      [
        QuizQuestion.wordMeaning(
          question: "Match the math terms",
          wordPairs: [
            {"word": "Fraction", "meaning": "Part of a whole"},
            {"word": "Decimal", "meaning": "A number with a point"},
            {"word": "Percentage", "meaning": "Out of 100"},
          ],
        ),
      ],
      // Stage 2
      [
        QuizQuestion.multipleChoice(
          question:
              "If you save \$10 every week for 4 weeks, how much do you have?",
          options: ["\$40", "\$14", "\$4", "\$10"],
          correctAnswerIndex: 0,
          explanation: "10 x 4 = 40.",
        ),
      ],
      // Stage 3
      [
        QuizQuestion.ordering(
          question: "Arrange these steps for finding a percentage",
          orderingItems: [
            "Divide by 100",
            "Multiply by the number",
            "Write as a decimal",
            "Get the answer"
          ],
          correctOrder: [2, 0, 1, 3],
          explanation: "Decimal, divide, multiply, answer.",
        ),
      ],
    ],
  ],
};

class QuizProvider extends ChangeNotifier {
  final String category;
  final int level;
  final int stage;

  late List<QuizQuestion> questions;
  int currentQuestionIndex = 0;
  int? selectedIndex;
  bool showFeedback = false;

  // For word-meaning questions
  Map<int, int?> wordMeaningMatches = {};
  int? selectedWordIndex;
  int? selectedMeaningIndex;
  Map<int, int> matchedPairs = {};

  // For ordering questions
  List<int> currentOrder = [];
  bool isOrderChecked = false;
  bool isOrderCorrect = false;

  QuizProvider({
    required this.category,
    required this.level,
    required this.stage,
  }) {
    questions = quizBank[category]?[level]?[stage] ?? [];
    if (questions.isNotEmpty && questions.first.type == QuestionType.ordering) {
      initializeOrderingQuestion();
    }
  }

  QuizQuestion get currentQuestion => questions[currentQuestionIndex];
  double get progress =>
      questions.isEmpty ? 0 : (currentQuestionIndex + 1) / questions.length;
  int get currentQuestionNumber => currentQuestionIndex + 1;
  int get totalQuestions => questions.length;
  bool get isLastQuestion => currentQuestionIndex == questions.length - 1;
  bool get isQuizComplete => currentQuestionIndex >= questions.length;

  // --- Multiple Choice ---
  void selectAnswer(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  bool checkAnswer() {
    showFeedback = true;
    notifyListeners();
    return selectedIndex == currentQuestion.correctAnswerIndex;
  }

  // --- Word-Meaning ---
  void selectWordMeaningPair(int wordIndex, int meaningIndex) {
    wordMeaningMatches[wordIndex] = meaningIndex;
    notifyListeners();
  }

  void selectWord(int index) {
    if (!matchedPairs.containsKey(index)) {
      selectedWordIndex = index;
      selectedMeaningIndex = null;
      notifyListeners();
    }
  }

  void selectMeaning(int index) {
    if (!matchedPairs.containsValue(index) && selectedWordIndex != null) {
      selectedMeaningIndex = index;
      notifyListeners();
    }
  }

  bool checkCurrentPair() {
    if (selectedWordIndex != null && selectedMeaningIndex != null) {
      final isCorrect = currentQuestion.wordPairs![selectedWordIndex!]
              ['meaning'] ==
          currentQuestion.wordPairs![selectedMeaningIndex!]['meaning'];
      if (isCorrect) {
        matchedPairs[selectedWordIndex!] = selectedMeaningIndex!;
      }
      selectedWordIndex = null;
      selectedMeaningIndex = null;
      notifyListeners();
      return isCorrect;
    }
    return false;
  }

  bool get allPairsMatched {
    return matchedPairs.length == (currentQuestion.wordPairs?.length ?? 0);
  }

  // --- Ordering ---
  void initializeOrderingQuestion() {
    currentOrder = List.generate(
      currentQuestion.orderingItems?.length ?? 0,
      (index) => index,
    );
    isOrderChecked = false;
    isOrderCorrect = false;
    notifyListeners();
  }

  void swapOrderItems(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = currentOrder.removeAt(oldIndex);
    currentOrder.insert(newIndex, item);
    notifyListeners();
  }

  bool checkOrder() {
    isOrderChecked = true;
    isOrderCorrect = const ListEquality<int>().equals(
      currentOrder,
      currentQuestion.correctOrder ?? [],
    );
    notifyListeners();
    return isOrderCorrect;
  }

  void resetOrderingQuestion() {
    initializeOrderingQuestion();
  }

  // --- Navigation ---
  void resetQuestion() {
    selectedIndex = null;
    showFeedback = false;
    wordMeaningMatches.clear();
    selectedWordIndex = null;
    selectedMeaningIndex = null;
    matchedPairs.clear();
    isOrderChecked = false;
    isOrderCorrect = false;
    if (currentQuestion.type == QuestionType.ordering) {
      initializeOrderingQuestion();
    }
    notifyListeners();
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
      resetQuestion();
    } else {
      currentQuestionIndex++;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      currentQuestionIndex--;
      resetQuestion();
    }
  }

  bool get answeredCorrectly {
    if (currentQuestion.type == QuestionType.multipleChoice) {
      return showFeedback &&
          selectedIndex == currentQuestion.correctAnswerIndex;
    }
    if (currentQuestion.type == QuestionType.wordMeaning) {
      return allPairsMatched;
    }
    if (currentQuestion.type == QuestionType.ordering) {
      return isOrderChecked && isOrderCorrect;
    }
    return false;
  }

  bool get hasNextQuestion => currentQuestionIndex < questions.length - 1;
}
