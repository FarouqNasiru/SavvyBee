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
    //The real level Zero, Mad a mistake so level 0 is actually level 1
    [
      [
        QuizQuestion.multipleChoice(
          question: "What is the main purpose of a budget?",
          options: [
            "To help you spend money faster",
            "To keep track of your money and plan how to use it",
            "To get free items from the store",
            "To avoid writing things down"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question: "A budget helps you manage your __________ and __________.",
          options: [
            "goals and dreams",
            "income and expenses",
            "needs and wants",
            "fun and entertainment"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question: "You only need a budget if you have a lot of money.",
          options: ["True", "False"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.wordMeaning(
          question: "Match the terms to their correct meanings:",
          wordPairs: [
            {"word": "Income", "meaning": "Money coming in"},
            {"word": "Expenses", "meaning": "Money going out (spent)"},
            {"word": "Budget", "meaning": "A plan for managing money"},
          ],
        ),
        QuizQuestion.multipleChoice(
          question: "Why is budgeting important?",
          options: [
            "It helps you spend without limits",
            "It helps you forget your financial goals",
            "It helps you save money and avoid overspending",
            "It makes sure you never enjoy your money"
          ],
          correctAnswerIndex: 2,
        ),
      ],
      [
        QuizQuestion.multipleChoice(
          question: "What is the first step in creating your first budget?",
          options: [
            "Spend your money before planning",
            "List all the things you want",
            "Write down your income and expenses",
            "Guess how much you need to save"
          ],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question:
              "Your budget should make sure that your __________ is not more than your __________.",
          options: [
            "income; savings",
            "expenses; wants",
            "expenses; income",
            "income; expenses"
          ],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question:
              "You should only include big expenses like rent in your budget, not small ones like snacks.",
          options: ["True", "False"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.wordMeaning(
          question: "Match each item with the correct category:",
          wordPairs: [
            {"word": "Data bundle", "meaning": "Expense"},
            {"word": "Allowance", "meaning": "Income"},
            {"word": "New shoes", "meaning": "Expense"},
            {"word": "Freelance job pay", "meaning": "Income"},
          ],
        ),
        QuizQuestion.multipleChoice(
          question: "Why should you review your budget regularly?",
          options: [
            "To spend more money on wants",
            "To check if you can stop budgeting completely",
            "To make sure you are staying on track and can adjust if things change",
            "To add more random expenses"
          ],
          correctAnswerIndex: 2,
        ),
      ],
      [
        QuizQuestion.multipleChoice(
          question: "Which of these is a need?",
          options: [
            "Ice cream",
            "Internet subscription for work",
            "Video game",
            "Designer clothes"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question: "Expenses are things you __________ money on.",
          options: ["spend", "save", "receive", "borrow"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.multipleChoice(
          question: "Buying snacks every day is an example of a need.",
          options: ["True", "False"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.wordMeaning(
          question: "Match each item to the correct type of expense:",
          wordPairs: [
            {"word": "School fees", "meaning": "Need"},
            {"word": "Soft drink", "meaning": "Want"},
            {"word": "Medicine", "meaning": "Need"},
            {"word": "New headphones", "meaning": "Want"},
          ],
        ),
        QuizQuestion.multipleChoice(
          question:
              "Why is it important to understand the difference between needs and wants?",
          options: [
            "So you can spend more on fun items",
            "To make random purchases without guilt",
            "So you can focus your money on important things and save wisely",
            "Because wants are always more important than needs"
          ],
          correctAnswerIndex: 2,
        ),
      ],
      [
        QuizQuestion.multipleChoice(
          question:
              "According to the 50/30/20 rule, how much of your income should go to savings and debt repayment?",
          options: ["10%", "20%", "30%", "50%"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "The 50/30/20 rule helps people create a __________ for spending and saving their money.",
          options: ["goal", "budget", "shopping list", "wish list"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "In the 50/30/20 rule, buying clothes you don't urgently need falls under 'needs.'",
          options: ["True", "False"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.wordMeaning(
          question:
              "Match each item to the correct category in the 50/30/20 rule:",
          wordPairs: [
            {"word": "Groceries", "meaning": "Needs"},
            {"word": "Watching movies online", "meaning": "Wants"},
            {"word": "Monthly loan payment", "meaning": "Savings/Debt"},
            {"word": "Eating at a restaurant", "meaning": "Wants"},
          ],
        ),
        QuizQuestion.multipleChoice(
          question: "Why is the 50/30/20 rule helpful when making a budget?",
          options: [
            "It helps you spend more on fun things",
            "It guarantees you wont have to save",
            "It balances spending, saving, and needs",
            "It makes sure you use credit cards often"
          ],
          correctAnswerIndex: 2,
        ),
      ],
      [
        QuizQuestion.multipleChoice(
          question: "What is the main purpose of a budget?",
          options: [
            "To spend money freely",
            "To plan and manage money wisely",
            "To avoid earning more money",
            "To only track savings"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question: "A budget helps you manage your __________ and __________.",
          options: [
            "wants and needs",
            "loans and credit",
            "income and expenses",
            "goals and choices"
          ],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question: "Spending less than you earn is a good budgeting habit.",
          options: ["True", "False"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.multipleChoice(
          question: "Which of the following is an example of a 'need'?",
          options: [
            "Ice cream",
            "New headphones",
            "School fees",
            "Designer clothes"
          ],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question:
              "The 50/30/20 rule recommends spending 30% of your income on __________.",
          options: ["needs", "savings", "wants", "housing"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.wordMeaning(
          question: "Match each category with the correct example:",
          wordPairs: [
            {"word": "Needs", "meaning": "Groceries"},
            {"word": "Wants", "meaning": "Online gaming subscription"},
            {"word": "Savings", "meaning": "Emergency fund deposit"},
          ],
        ),
        QuizQuestion.multipleChoice(
          question: "Wants are things you can live without but enjoy having.",
          options: ["True", "False"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.multipleChoice(
          question: "What should you do before creating a budget?",
          options: [
            "Spend all your money first",
            "Write down your income and expenses",
            "Guess how much things cost",
            "Save everything and spend nothing"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.wordMeaning(
          question: "Match each term to its meaning:",
          wordPairs: [
            {"word": "Budget", "meaning": "A plan for managing your money"},
            {
              "word": "Income",
              "meaning": "Money you earn or receive regularly"
            },
            {"word": "Wants", "meaning": "Money used for fun or extra items"},
          ],
        ),
        QuizQuestion.multipleChoice(
          question:
              "According to the 50/30/20 rule, __________ percent of your income should go to savings or debt repayment.",
          options: ["10", "20", "30", "50"],
          correctAnswerIndex: 1,
        ),
      ],
    ],
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
              "word": "Receipts ",
              "meaning": "Keeping records of purchases for review."
            },
            {
              "word": "Spreadsheet ",
              "meaning": "Organizing finances in a structured format."
            }
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
                "Which of the following is the most efficient tool for tracking daily transactions?",
            options: [
              "A budgeting app or online tracker",
              "A basic calculator only",
              "A handwritten list with no categories",
              "A random notebook with no structure"
            ],
            correctAnswerIndex: 0,
            explanation:
                "Budgeting apps and online trackers automate and simplify expense tracking."),
        QuizQuestion.multipleChoice(
            question:
                "What do digital tools do to help with tracking your finances?",
            options: [
              "They make it harder to organize data",
              "They automatically calculate totals and generate reports",
              "They delete old expenses automatically",
              "They only track income, not expenses"
            ],
            correctAnswerIndex: 1,
            explanation:
                "Digital tools help organize financial records by automating calculations and generating reports."),
        QuizQuestion.wordMeaning(
            question: "Match each item to the correct tracking category.",
            wordPairs: [
              {"word": "Budgeting app", "meaning": "Digital Tool"},
              {"word": "Online expense tracker", "meaning": "Digital Tools"},
              {"word": "Handwritten ledger", "meaning": "Traditional Methods"},
              {"word": "Envelope system", "meaning": "Traditional Method"}
            ]),
        QuizQuestion.multipleChoice(
            question:
                "What is one key benefit of using a digital tracking tool?",
            options: [
              "It automatically categorizes and sums up your transactions",
              "It makes your phone run slower",
              "It hides your spending details",
              "It is only useful for saving receipts"
            ],
            correctAnswerIndex: 0,
            explanation:
                "Digital tools simplify and speed up financial tracking through automation."),
        QuizQuestion.ordering(
          question: "Arrange these steps to set up a digital tracking system:",
          orderingItems: [
            "Choose a budgeting app or software",
            "Enter your income and expense categories",
            "Record your transactions as they occur",
            "Review the summary reports regularly"
          ],
          correctOrder: [0, 1, 2, 3],
        ),
      ],
      // Stage 4
      [
        QuizQuestion.multipleChoice(
            question: "Why should you review your spending records regularly?",
            options: [
              "To celebrate spending as much as possible",
              "To understand your spending patterns and make improvements",
              "To confuse your friends",
              "To justify spending without limits"
            ],
            correctAnswerIndex: 1,
            explanation:
                "Reviewing your spending helps you identify patterns and make better financial decisions."),
        QuizQuestion.multipleChoice(
            question:
                "By analyzing your transactions, you can identify areas where you need to ______ your spending.",
            options: ["increase", "cut", "ignore", "double"],
            correctAnswerIndex: 1,
            explanation:
                "Cutting or reducing spending is often the goal when analyzing transactions."),
        QuizQuestion.wordMeaning(
            question: "Match each review activity with its benefit.",
            wordPairs: [
              {
                "word": "Comparing monthly spending to your budget",
                "meaning":
                    "Highlights where spending is above or below expectations"
              },
              {
                "word": "Categorizing expenses",
                "meaning": "Helps understand which areas cost the most"
              },
              {
                "word": "Checking receipts against records",
                "meaning": "Ensures accuracy of your records"
              },
              {
                "word": "Noting unusual expenses",
                "meaning": "Identifies errors or unexpected charges"
              }
            ]),
        QuizQuestion.wordMeaning(
            question:
                "Classify each action as either a Review Action or Recording Action.",
            wordPairs: [
              {
                "word": "Recording each transaction immediately",
                "meaning": "Recording Action"
              },
              {
                "word": "Filing receipts for future reference",
                "meaning": "Recording Action"
              },
              {
                "word": "Comparing your monthly totals with your budget",
                "meaning": "Review Action"
              },
              {
                "word": "Checking for discrepancies in your records",
                "meaning": "Review Action"
              }
            ]),
        QuizQuestion.ordering(
          question: "Arrange these steps for a monthly spending analysis:",
          orderingItems: [
            "Gather all your transaction records and receipts",
            "Compare recorded spending to your planned budget",
            "Identify any areas where spending exceeded expectations",
            "Plan changes to reduce unnecessary expenses"
          ],
          correctOrder: [0, 1, 2, 3],
        ),
      ],

      // Stage 5
      [
        QuizQuestion.multipleChoice(
            question: "What is the first step in tracking your money?",
            options: [
              "Recording your income",
              "Ignoring small expenses",
              "Estimating your spending at the end of the month",
              "Setting a savings goal"
            ],
            correctAnswerIndex: 0,
            explanation:
                "Tracking starts with knowing how much money is coming in."),
        QuizQuestion.multipleChoice(
            question:
                "Net income is found by subtracting total ______ from total income.",
            options: ["savings", "loans", "expenses", "allowance"],
            correctAnswerIndex: 2,
            explanation:
                "Net income is your income after subtracting expenses."),
        QuizQuestion.wordMeaning(
            question: "Match each term with its correct meaning.",
            wordPairs: [
              {"word": "Income", "meaning": "Money received or earned"},
              {
                "word": "Expense",
                "meaning": "Money spent on goods or services"
              },
              {"word": "Savings", "meaning": "Money set aside for future use"},
              {"word": "Net Income", "meaning": "Money left after all expenses"}
            ]),
        QuizQuestion.multipleChoice(
            question:
                "Why is it important to record transactions as they occur?",
            options: [
              "To reduce errors and keep an accurate record",
              "To make your budget look more complicated",
              "To avoid having to review your spending later",
              "To keep your income hidden"
            ],
            correctAnswerIndex: 0,
            explanation:
                "Recording transactions immediately helps prevent forgetting or miscalculating expenses."),
        QuizQuestion.multipleChoice(
            question:
                "Using a digital budgeting tool can help ______ your transactions automatically.",
            options: ["delay", "lose", "hide", "track"],
            correctAnswerIndex: 3,
            explanation:
                "Digital tools can track transactions automatically and reduce manual work."),
        QuizQuestion.wordMeaning(
            question: "Match the tracking tool with its key benefit.",
            wordPairs: [
              {
                "word": "Budgeting App",
                "meaning":
                    "Automatically calculates totals and categorizes spending"
              },
              {
                "word": "Envelope System",
                "meaning": "Physically limits spending with cash"
              },
              {
                "word": "Spreadsheet",
                "meaning": "Organizes data in a structured format"
              },
              {
                "word": "Handwritten Ledger",
                "meaning": "Allows for creative, personal record keeping"
              }
            ]),
        QuizQuestion.multipleChoice(
            question:
                "Which of the following best describes why reviewing your spending is important?",
            options: [
              "It helps you understand where you might be overspending",
              "It makes you feel bad about your purchases",
              "It allows you to change your income",
              "It is only necessary if you want to quit spending"
            ],
            correctAnswerIndex: 0,
            explanation:
                "Reviewing helps you understand habits and make better financial decisions."),
        QuizQuestion.ordering(
          question: "Arrange these steps for recording a transaction:",
          orderingItems: [
            "Make a purchase or receive money",
            "Record the transaction immediately",
            "File or save the receipt",
            "Review your records for accuracy later"
          ],
          correctOrder: [0, 1, 2, 3],
        ),
        QuizQuestion.wordMeaning(
            question: "Match each activity to the correct category.",
            wordPairs: [
              {
                "word": "Recording each expense immediately",
                "meaning": "Recording Action"
              },
              {"word": "Filing receipts", "meaning": "Recording Actions"},
              {
                "word": "Comparing your monthly spending to your budget",
                "meaning": "Review Actions"
              },
              {
                "word": "Checking receipts for discrepancies",
                "meaning": "Review Action"
              }
            ]),
        QuizQuestion.ordering(
          question: "Arrange these steps for a monthly spending review:",
          orderingItems: [
            "Gather receipts and transaction records",
            "Compare actual spending to your planned budget",
            "Identify areas where spending was higher than expected",
            "Decide on changes to reduce unnecessary expenses",
            "Update your budget for the month"
          ],
          correctOrder: [0, 1, 2, 3, 4],
        ),
      ],

      // Stage 6
      [
        QuizQuestion.multipleChoice(
            question: "Why should you review your spending records regularly?",
            options: [
              "To celebrate spending as much as possible",
              "To understand your spending patterns and make improvements",
              "To confuse your friends",
              "To justify spending without limits"
            ],
            correctAnswerIndex: 1,
            explanation:
                "Reviewing your spending helps you identify patterns and make better financial decisions."),
        QuizQuestion.multipleChoice(
            question:
                "By analyzing your transactions, you can identify areas where you need to ______ your spending.",
            options: ["increase", "cut", "ignore", "double"],
            correctAnswerIndex: 1,
            explanation:
                "Cutting or reducing spending is often the goal when analyzing transactions."),
        QuizQuestion.wordMeaning(
            question: "Match each review activity with its benefit.",
            wordPairs: [
              {
                "word": "Comparing monthly spending to your budget",
                "meaning":
                    "Highlights where spending is above or below expectations"
              },
              {
                "word": "Categorizing expenses",
                "meaning": "Helps understand which areas cost the most"
              },
              {
                "word": "Checking receipts against records",
                "meaning": "Ensures accuracy of your records"
              },
              {
                "word": "Noting unusual expenses",
                "meaning": "Identifies errors or unexpected charges"
              }
            ]),
        QuizQuestion.wordMeaning(
            question:
                "Classify each action as either a Review Action or Recording Action.",
            wordPairs: [
              {"Recording each transaction immediately": "Recording Action"},
              {"Filing receipts for future reference": "Recording Action"},
              {
                "Comparing your monthly totals with your budget":
                    "Review Action"
              },
              {"Checking for discrepancies in your records": "Review Action"}
            ]),
        QuizQuestion.ordering(
          question: "Arrange these steps for a monthly spending analysis:",
          orderingItems: [
            "Gather all your transaction records and receipts",
            "Compare recorded spending to your planned budget",
            "Identify any areas where spending exceeded expectations",
            "Plan changes to reduce unnecessary expenses"
          ],
          correctOrder: [0, 1, 2, 3],
        ),
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
        QuizQuestion.multipleChoice(
            question: "What is the first step in tracking your money?",
            options: [
              "Recording your income",
              "Ignoring small expenses",
              "Estimating your spending at the end of the month",
              "Setting a savings goal"
            ],
            correctAnswerIndex: 0,
            explanation:
                "Tracking starts with knowing how much money is coming in."),
        QuizQuestion.multipleChoice(
            question:
                "Net income is found by subtracting total ______ from total income.",
            options: ["savings", "loans", "expenses", "allowance"],
            correctAnswerIndex: 2,
            explanation:
                "Net income is your income after subtracting expenses."),
        QuizQuestion.wordMeaning(
            question: "Match each term with its correct meaning.",
            wordPairs: [
              {"word": "Income", "meaning": "Money received or earned"},
              {
                "word": "Expense",
                "meaning": "Money spent on goods or services"
              },
              {"word": "Savings", "meaning": "Money set aside for future use"},
              {"word": "Net Income", "meaning": "Money left after all expenses"}
            ]),
        QuizQuestion.multipleChoice(
            question:
                "Why is it important to record transactions as they occur?",
            options: [
              "To reduce errors and keep an accurate record",
              "To make your budget look more complicated",
              "To avoid having to review your spending later",
              "To keep your income hidden"
            ],
            correctAnswerIndex: 0,
            explanation:
                "Recording transactions immediately helps prevent forgetting or miscalculating expenses."),
        QuizQuestion.multipleChoice(
            question:
                "Using a digital budgeting tool can help ______ your transactions automatically.",
            options: ["delay", "lose", "hide", "track"],
            correctAnswerIndex: 3,
            explanation:
                "Digital tools can track transactions automatically and reduce manual work."),
        QuizQuestion.wordMeaning(
            question: "Match the tracking tool with its key benefit.",
            wordPairs: [
              {
                "word": "Budgeting App",
                "meaning":
                    "Automatically calculates totals and categorizes spending"
              },
              {
                "word": "Envelope System",
                "meaning": "Physically limits spending with cash"
              },
              {
                "word": "Spreadsheet",
                "meaning": "Organizes data in a structured format"
              },
              {
                "word": "Handwritten Ledger",
                "meaning": "Allows for creative, personal record keeping"
              }
            ]),
        QuizQuestion.wordMeaning(
            question: "Match each activity to the correct category.",
            wordPairs: [
              {
                "word": "Recording each expense immediately",
                "meaning": "Recording Action"
              },
              {"word": "Filing receipts", "meaning": "Recording Action"},
              {
                "word": "Comparing your monthly spending to your budget",
                "meaning": "Review Action"
              },
              {
                "word": "Checking receipts for discrepancies",
                "meaning": "Review Action"
              }
            ]),
        QuizQuestion.multipleChoice(
            question:
                "Which of the following best describes why reviewing your spending is important?",
            options: [
              "It helps you understand where you might be overspending",
              "It makes you feel bad about your purchases",
              "It allows you to change your income",
              "It is only necessary if you want to quit spending"
            ],
            correctAnswerIndex: 0,
            explanation:
                "Reviewing helps you understand habits and make better financial decisions."),
        QuizQuestion.ordering(
          question: "Arrange these steps for recording a transaction:",
          orderingItems: [
            "Make a purchase or receive money",
            "Record the transaction immediately",
            "File or save the receipt",
            "Review your records for accuracy later"
          ],
          correctOrder: [0, 1, 2, 3],
        ),
        QuizQuestion.ordering(
          question: "Arrange these steps for a monthly spending review:",
          orderingItems: [
            "Gather receipts and transaction records",
            "Compare actual spending to your planned budget",
            "Identify areas where spending was higher than expected",
            "Decide on changes to reduce unnecessary expenses",
            "Update your budget for the month"
          ],
          correctOrder: [0, 1, 2, 3, 4],
        ),
      ],
      // Stage 2
      [
        QuizQuestion.multipleChoice(
            question:
                "Which tool is most useful for tracking your spending accurately?",
            options: [
              "A basic budgeting app or spreadsheet",
              "A simple calculator only",
              "A notebook without categorising expenses",
              "A photo album for receipts"
            ],
            correctAnswerIndex: 0,
            explanation:
                "Budgeting apps or spreadsheets provide structure and accuracy in expense tracking."),
        QuizQuestion.multipleChoice(
            question:
                "Setting up automatic bill payments can help ______ your budget by avoiding late fees.",
            options: ["ignore", "overcomplicate", "improve", "limit"],
            correctAnswerIndex: 2,
            explanation:
                "Automation helps keep your budget on track and avoid penalties."),
        QuizQuestion.wordMeaning(
            question: "Match each item with the correct tracking method type.",
            wordPairs: [
              {"word": "Budgeting app", "meaning": "Digital Tool"},
              {"word": "Online expense tracker", "meaning": "Digital Tool"},
              {
                "word": "Handwritten expense journal",
                "meaning": "Traditional Method"
              },
              {
                "word": "Envelope system (using cash divided into envelopes)",
                "meaning": "Traditional Method"
              }
            ]),
        QuizQuestion.multipleChoice(
            question:
                "Which technique is a practical budget hack to help control spending?",
            options: [
              "Using the envelope system to limit cash for each category",
              "Relying on credit cards so you dont notice spending",
              "Buying items immediately when on sale, without comparison",
              "Ignoring small daily expenses"
            ],
            correctAnswerIndex: 0,
            explanation:
                "The envelope system helps you allocate cash and control spending."),
        QuizQuestion.ordering(
          question: "Arrange these steps to set up your budgeting tool:",
          orderingItems: [
            "List all your regular expenses",
            "Write down your total income",
            "Record your daily transactions",
            "Set a realistic savings target",
            "Review and update your records regularly"
          ],
          correctOrder: [0, 1, 2, 3, 4],
        ),
      ],
      // Stage 3
      [
        QuizQuestion.multipleChoice(
            question: "What does 'smart spending' mean?",
            options: [
              "Buying only the cheapest items even if quality is low",
              "Carefully planning purchases by comparing prices and needs",
              "Not spending any money at all",
              "Spending money on every new gadget"
            ],
            correctAnswerIndex: 1,
            explanation:
                "Smart spending involves planning and comparing to get the best value."),
        QuizQuestion.multipleChoice(
            question:
                "By checking prices and using discounts, you can ______ your overall spending.",
            options: ["increase", "ignore", "track", "reduce"],
            correctAnswerIndex: 3,
            explanation:
                "Smart spending helps reduce total expenses through strategic decisions."),
        QuizQuestion.wordMeaning(
            question: "Match each smart spending tip with its benefit.",
            wordPairs: [
              {
                "word": "Using discount coupons",
                "meaning": "Saves money on each purchase"
              },
              {
                "word": "Buying in bulk (when appropriate)",
                "meaning": "Lowers the cost per unit for regular items"
              },
              {
                "word": "Comparing prices",
                "meaning": "Helps you find the best deal"
              },
              {
                "word": "Waiting before making unplanned purchases",
                "meaning": "Prevents impulse buying"
              }
            ]),
        QuizQuestion.wordMeaning(
            question: "Match each spending action to its category.",
            wordPairs: [
              {
                "word": "Planning your shopping with a list",
                "meaning": "Smart Spending"
              },
              {
                "word":
                    "Checking for deals and reading product reviews before buying",
                "meaning": "Smart Spending"
              },
              {
                "word":
                    "Making an impulse purchase during a flash sale without comparing prices",
                "meaning": "Risky Spending"
              },
              {
                "word":
                    "Buying something immediately just because it's marked down",
                "meaning": "Risky Spending"
              }
            ]),
        QuizQuestion.ordering(
          question:
              "Arrange these steps for planning a cost-effective shopping trip:",
          orderingItems: [
            "Create a detailed shopping list",
            "Set a strict spending limit",
            "Check for current deals and discounts",
            "Compare prices at a different store",
            "Review your spending after the trip"
          ],
          correctOrder: [0, 1, 2, 3, 4],
        ),
      ],
      // Stage 4
      [
        QuizQuestion.multipleChoice(
            question: "What is an effective way to lower your regular costs?",
            options: [
              "Ignoring your monthly bills",
              "Negotiating with service providers for a better rate or plan",
              "Upgrading to a more expensive plan for extra features",
              "Delaying bill payments until a discount appears"
            ],
            correctAnswerIndex: 1,
            explanation:
                "Negotiating rates can help you save money on recurring expenses."),
        QuizQuestion.multipleChoice(
            question:
                "Creating a monthly ______ is important to know how much you can safely spend and save.",
            options: ["goal", "calendar", "budget", "bill"],
            correctAnswerIndex: 2,
            explanation:
                "A monthly budget is essential for planning spending and savings."),
        QuizQuestion.wordMeaning(
            question: "Match each cost-cutting idea with its benefit.",
            wordPairs: [
              {
                "word": "Cancel unused subscriptions",
                "meaning": "Saves money on recurring costs"
              },
              {
                "word": "Planning meals at home",
                "meaning": "Lowers food costs and reduces waste"
              },
              {
                "word": "Using public transport or carpooling",
                "meaning": "Cuts transport expenses"
              },
              {
                "word": "Reducing energy use at home",
                "meaning": "Decreases utility bills"
              }
            ]),
        QuizQuestion.wordMeaning(
            question:
                "Classify each saving idea as either Quick Savings or Long-Term Savings.",
            wordPairs: [
              {
                "word": "Using discount coupons at checkout",
                "meaning": "Quick Savings"
              },
              {
                "word": "Cutting out a daily snack or coffee run",
                "meaning": "Quick Savings"
              },
              {
                "word": "Upgrading to energy-efficient appliances",
                "meaning": "Long-Term Savings"
              },
              {
                "word": "Opening a high-yield savings account",
                "meaning": "Long-Term Savings"
              }
            ]),
        QuizQuestion.ordering(
          question: "Arrange these steps for a cost-cutting plan in order:",
          orderingItems: [
            "Review your monthly spending to spot high-cost areas",
            "Identify expenses you can reduce or eliminate",
            "Research cheaper alternatives or discounts",
            "Change your spending habits accordingly",
            "Monitor your savings over time"
          ],
          correctOrder: [0, 1, 2, 3, 4],
        ),
      ],
      // Stage 5
      [
        QuizQuestion.multipleChoice(
            question: "What is a 'budget hack' and why is it useful?",
            options: [
              "A clever tip that helps you save money by reducing unnecessary spending",
              "A secret plan to double your income overnight",
              "A method used only by professional investors",
              "A way to hide your spending from others"
            ],
            correctAnswerIndex: 0,
            explanation:
                "Budget hacks are simple tricks to help reduce daily costs and improve savings."),
        QuizQuestion.multipleChoice(
            question:
                "Budget optimisation means getting the most value out of every ______ you spend.",
            options: ["step", "goal", "naira", "expense report"],
            correctAnswerIndex: 2,
            explanation:
                "Optimisation is about stretching each naira (or dollar) to achieve more."),
        QuizQuestion.wordMeaning(
            question: "Match each term with its meaning.",
            wordPairs: [
              {
                "word": "Expense",
                "meaning": "Money you spend on goods or services"
              },
              {
                "word": "Savings Goal",
                "meaning": "A target you plan to reach by saving money"
              },
              {
                "word": "Budget Hack",
                "meaning": "A trick to reduce everyday spending"
              },
              {
                "word": "Optimisation",
                "meaning": "The process of making your money work harder"
              }
            ]),
        QuizQuestion.multipleChoice(
            question:
                "Which tool is most useful for keeping track of your spending?",
            options: [
              "A basic budgeting app or spreadsheet",
              "A simple calculator without records",
              "A diary that only writes down dates",
              "A photo album for receipts"
            ],
            correctAnswerIndex: 0,
            explanation:
                "Apps and spreadsheets help you organize and review your financial activity easily."),
        QuizQuestion.multipleChoice(
            question:
                "Setting up automatic bill payments can help ______ your budget by preventing late fees.",
            options: ["improve", "complicate", "damage", "ignore"],
            correctAnswerIndex: 0,
            explanation:
                "Automating bills prevents delays and helps maintain budget discipline."),
        QuizQuestion.wordMeaning(
            question: "Match each smart spending tip with its benefit.",
            wordPairs: [
              {
                "word": "Buying in bulk (when it makes sense)",
                "meaning": "Lowers the cost per unit for items bought regularly"
              },
              {
                "word": "Comparing prices",
                "meaning": "Helps you find the best deal available"
              },
              {
                "word": "Using discount coupons",
                "meaning": "Saves money on individual purchases"
              },
              {
                "word": "Waiting before making unplanned purchases",
                "meaning": "Prevents impulse buying"
              }
            ]),
        QuizQuestion.wordMeaning(
            question:
                "Classify each action as Smart Spending or Cost-Cutting/Saving Strategy.",
            wordPairs: [
              {
                "word": "Checking for deals before a purchase",
                "meaning": "Smart Spending"
              },
              {
                "word": "Keeping a detailed record of monthly expenses",
                "meaning": "Smart Spending"
              },
              {
                "word": "Using discount coupons at checkout",
                "meaning": "Cost-Cutting/Saving Strategy"
              },
              {
                "word": "Planning meals at home instead of dining out",
                "meaning": "Cost-Cutting/Saving Strategy"
              },
              {
                "word": "Using the envelope system for cash",
                "meaning": "Cost-Cutting/Saving Strategy"
              }
            ]),
        QuizQuestion.ordering(
          question:
              "Arrange these steps in the correct order for setting up a budgeting tool:",
          orderingItems: [
            "Write down your total income",
            "List all your regular expenses",
            "Set a realistic savings target",
            "Record your daily transactions",
            "Review and update your records regularly"
          ],
          correctOrder: [0, 1, 2, 3, 4],
        ),
        QuizQuestion.multipleChoice(
            question:
                "Which of the following is an effective way to lower your regular costs?",
            options: [
              "Ignoring your monthly bills",
              "Negotiating with service providers for a better rate or switching plans",
              "Upgrading to a more expensive plan for extra features",
              "Delaying bill payments to wait for discounts"
            ],
            correctAnswerIndex: 1,
            explanation:
                "Negotiating helps you reduce ongoing expenses and save more over time."),
        QuizQuestion.ordering(
          question:
              "Arrange these steps for a complete monthly budget review and adjustment:",
          orderingItems: [
            "Collect all receipts and transaction records",
            "Compare your actual spending to your planned budget",
            "Identify areas where spending was higher than expected",
            "Decide on changes such as cutting back or reallocating funds",
            "Update your budget for the next month"
          ],
          correctOrder: [0, 1, 2, 3, 4],
        ),
      ],
    ],
      //level 2
    [
      //stage 1
      [
        QuizQuestion.multipleChoice(
            question:
                "Why is it important to separate needs from wants when budgeting?",
            options: [
              "So you can buy everything you see",
              "To avoid spending money at all",
              "To prioritise essential expenses over non-essential ones",
              "Because wants are more important than needs"
            ],
            correctAnswerIndex: 2,
            explanation:
                "Separating needs from wants helps you prioritise necessary expenses and manage your money wisely."),
        QuizQuestion.multipleChoice(
            question:
                "A 'need' is something you ______ for survival or basic functioning.",
            options: ["desire", "require", "wish", "avoid"],
            correctAnswerIndex: 1,
            explanation:
                "Needs are essential items such as food, shelter, and healthcare."),
        QuizQuestion.wordMeaning(
            question: "Match each item to its category.",
            wordPairs: [
              {"word": "Groceries", "meaning": "Need"},
              {"word": "Streaming subscription", "meaning": "Want"},
              {"word": "Electricity bill", "meaning": "Need"},
              {"word": "Designer shoes", "meaning": "Want"}
            ]),
        QuizQuestion.wordMeaning(
            question: "Match each budget category with its description.",
            wordPairs: [
              {
                "word": "Needs",
                "meaning": "Expenses that are necessary to live and function"
              },
              {
                "word": "Wants",
                "meaning": "Things that are nice to have but not essential"
              },
              {"word": "Savings", "meaning": "Money set aside for future use"},
              {
                "word": "Emergency Fund",
                "meaning": "Money reserved for unexpected expenses"
              }
            ]),
        QuizQuestion.ordering(
          question:
              "Arrange the following steps in order when evaluating your expenses:",
          orderingItems: [
            "List all of your monthly expenses",
            "Label each one as a need or a want",
            "Decide which wants you can reduce or eliminate",
            "Allocate money to cover all your needs first",
            "Review your savings and make adjustments"
          ],
          correctOrder: [0, 1, 2, 3, 4],
        ),
      ],
        //stage 2
      [
        QuizQuestion.multipleChoice(
            question:
                "What is the main benefit of setting clear financial goals?",
            options: [
              "It allows you to ignore your spending",
              "It helps you spend more freely",
              "It gives you direction and motivation for saving and budgeting",
              "It makes budgeting more difficult"
            ],
            correctAnswerIndex: 2,
            explanation:
                "Clear goals help guide your spending and saving decisions with purpose."),
        QuizQuestion.multipleChoice(
            question:
                "Short-term financial goals are usually achieved within ______.",
            options: ["1 year or less", "5–10 years", "a lifetime", "never"],
            correctAnswerIndex: 0,
            explanation:
                "Short-term goals typically have a timeline of less than a year."),
        QuizQuestion.wordMeaning(
            question: "Match each type of financial goal with its example.",
            wordPairs: [
              {
                "word": "Short-term goal",
                "meaning": "Saving for a new phone within 3 months"
              },
              {
                "word": "Medium-term goal",
                "meaning": "Saving to buy a laptop in 1–2 years"
              },
              {
                "word": "Long-term goal",
                "meaning": "Saving for a house over 5+ years"
              },
              {
                "word": "Emergency fund",
                "meaning": "Money saved for unexpected situations"
              }
            ]),
        QuizQuestion.wordMeaning(
            question: "Match each goal-setting concept with its definition.",
            wordPairs: [
              {
                "word": "Specific Goal",
                "meaning": "Clearly states what you are trying to achieve"
              },
              {
                "word": "Measurable Goal",
                "meaning": "Can be tracked with numbers or progress"
              },
              {
                "word": "Achievable Goal",
                "meaning": "Realistic based on your current resources"
              },
              {
                "word": "Time-bound Goal",
                "meaning": "Has a set deadline or timeframe"
              }
            ]),
        QuizQuestion.ordering(
          question: "Arrange these steps to set a financial goal:",
          orderingItems: [
            "Decide what you want to achieve financially",
            "Make the goal specific and realistic",
            "Set a target amount and deadline",
            "Create a savings or spending plan",
            "Track your progress and make adjustments"
          ],
          correctOrder: [0, 1, 2, 3, 4],
        ),
      ],
      //stage 3
      [
        QuizQuestion.multipleChoice(
            question:
                "What is the benefit of reviewing your financial goals regularly?",
            options: [
              "To make spending more random",
              "To remind yourself of your direction and adjust if needed",
              "To ignore your savings plan",
              "To cancel your budget altogether"
            ],
            correctAnswerIndex: 1,
            explanation:
                "Reviewing helps you stay on track and adapt your goals to life changes."),
        QuizQuestion.multipleChoice(
            question:
                "Tracking your progress toward a financial goal helps you stay ______.",
            options: ["confused", "unaware", "motivated", "disorganised"],
            correctAnswerIndex: 2,
            explanation:
                "Monitoring progress boosts motivation and encourages better habits."),
        QuizQuestion.wordMeaning(
            question:
                "Match each action with its purpose in achieving a financial goal.",
            wordPairs: [
              {
                "word": "Setting a specific savings target",
                "meaning": "Gives you a clear goal to work toward"
              },
              {
                "word": "Tracking your spending",
                "meaning": "Helps you identify where to cut back"
              },
              {
                "word": "Reviewing your goals regularly",
                "meaning": "Ensures your plan still matches your priorities"
              },
              {
                "word": "Celebrating small wins",
                "meaning": "Keeps you encouraged throughout the journey"
              }
            ]),
        QuizQuestion.wordMeaning(
            question:
                "Match each type of challenge with its effect on your financial goals.",
            wordPairs: [
              {
                "word": "Unexpected expense",
                "meaning": "Can slow or pause your savings progress"
              },
              {
                "word": "Lack of motivation",
                "meaning": "Might cause you to stop saving"
              },
              {
                "word": "Irregular income",
                "meaning": "Makes consistent saving harder"
              },
              {
                "word": "Setting unrealistic goals",
                "meaning": "Leads to frustration and quitting"
              }
            ]),
        QuizQuestion.ordering(
          question:
              "Arrange these steps to stay on track with your financial goal:",
          orderingItems: [
            "Set a clear, realistic goal",
            "Break the goal into smaller milestones",
            "Track your progress regularly",
            "Adjust your plan if things change",
            "Celebrate progress to stay motivated"
          ],
          correctOrder: [0, 1, 2, 3, 4],
        ),
      ],
      //stage 4
      [
        QuizQuestion.multipleChoice(
            question:
                "Why is it important to adjust your budget when your income or expenses change?",
            options: [
              "So you can spend more on wants",
              "To make budgeting harder",
              "To stay in control and avoid overspending",
              "So you can ignore your savings"
            ],
            correctAnswerIndex: 2,
            explanation:
                "Adjusting your budget ensures it reflects your current financial situation."),
        QuizQuestion.multipleChoice(
            question:
                "If you spend more than you earn, you are living ______ your means.",
            options: ["below", "within", "outside", "over"],
            correctAnswerIndex: 2,
            explanation:
                "Spending more than your income means you're living outside your means, which can lead to debt."),
        QuizQuestion.wordMeaning(
            question:
                "Match each budget adjustment situation with its explanation.",
            wordPairs: [
              {
                "word": "Getting a raise at work",
                "meaning": "Increase your income and adjust savings or goals"
              },
              {
                "word": "Losing a part-time job",
                "meaning": "Reduce your income and re-prioritize your expenses"
              },
              {
                "word": "Moving to a cheaper apartment",
                "meaning": "Lower your housing costs and update your budget"
              },
              {
                "word": "Starting school and gaining new fees",
                "meaning": "Add new expense categories to your plan"
              }
            ]),
        QuizQuestion.wordMeaning(
            question: "Match each financial behaviour with its category.",
            wordPairs: [
              {
                "word": "Tracking your spending weekly",
                "meaning": "Responsible Budgeting"
              },
              {
                "word": "Updating your budget when your bills change",
                "meaning": "Responsible Budgeting"
              },
              {
                "word": "Ignoring extra income and not adjusting your plan",
                "meaning": "Unhealthy Budgeting"
              },
              {
                "word": "Overspending without checking your budget",
                "meaning": "Unhealthy Budgeting"
              }
            ]),
        QuizQuestion.ordering(
          question:
              "Arrange these steps to adjust your budget after a major financial change:",
          orderingItems: [
            "Review your new income or expense details",
            "Compare them to your current budget",
            "Identify categories to increase, decrease, or add",
            "Adjust your spending and savings goals",
            "Monitor your progress with the updated plan"
          ],
          correctOrder: [0, 1, 2, 3, 4],
        ),
      ],
      //stage 5
      [
        QuizQuestion.multipleChoice(
            question: "What is the benefit of tracking your money over time?",
            options: [
              "It helps you forget your spending habits",
              "It allows you to stop budgeting altogether",
              "It helps you see progress and adjust your plan as needed",
              "It encourages more impulse spending"
            ],
            correctAnswerIndex: 2,
            explanation:
                "Tracking over time helps you stay aware of your habits, measure growth, and make smarter decisions."),
        QuizQuestion.multipleChoice(
            question: "A budget is most useful when it is ______.",
            options: [
              "rigid and never changes",
              "flexible and updated regularly",
              "complicated",
              "kept secret"
            ],
            correctAnswerIndex: 1,
            explanation:
                "Budgets should be flexible so they can adapt to life changes and remain effective."),
        QuizQuestion.wordMeaning(
            question: "Match each long-term financial habit with its benefit.",
            wordPairs: [
              {
                "word": "Reviewing your budget monthly",
                "meaning": "Keeps your plan up to date and relevant"
              },
              {
                "word": "Tracking spending over time",
                "meaning": "Helps identify patterns and improve decisions"
              },
              {
                "word": "Adjusting savings goals based on progress",
                "meaning": "Keeps goals achievable and motivating"
              },
              {
                "word": "Sticking to a consistent routine",
                "meaning": "Builds strong money habits"
              }
            ]),
        QuizQuestion.wordMeaning(
            question:
                "Match each budgeting behaviour with the correct category.",
            wordPairs: [
              {
                "word": "Checking your budget every few days",
                "meaning": "Healthy Habit"
              },
              {
                "word": "Only budgeting at the end of the year",
                "meaning": "Unhealthy Habit"
              },
              {
                "word": "Adjusting your plan when your income changes",
                "meaning": "Healthy Habit"
              },
              {
                "word": "Avoiding review of your expenses",
                "meaning": "Unhealthy Habit"
              }
            ]),
        QuizQuestion.ordering(
          question:
              "Arrange these steps for creating a long-term budget habit:",
          orderingItems: [
            "Create a realistic budget based on your income and expenses",
            "Set reminders to review your budget regularly",
            "Track spending and savings progress",
            "Make adjustments when your needs or goals change",
            "Celebrate milestones and stay motivated"
          ],
          correctOrder: [0, 1, 2, 3, 4],
        ),
      ],
    ],
    //level 5
    [
      //stage 5
      [
        QuizQuestion.multipleChoice(
            question:
                "What is the purpose of reviewing your budget at the end of each month?",
            options: [
              "To make room for more unnecessary expenses",
              "To ignore what went wrong",
              "To identify what worked, what didn't, and make improvements",
              "To close your budget forever"
            ],
            correctAnswerIndex: 2,
            explanation:
                "Monthly reviews help you learn from past spending and adjust your budget for the future."),
        QuizQuestion.multipleChoice(
            question:
                "Reviewing your budget helps you make better ______ decisions.",
            options: ["fashion", "financial", "friendship", "career"],
            correctAnswerIndex: 1,
            explanation:
                "Budget reviews are a financial habit that supports smarter money management."),
        QuizQuestion.wordMeaning(
            question: "Match each budget review action with its purpose.",
            wordPairs: [
              {
                "word": "Comparing your budgeted vs. actual spending",
                "meaning": "Reveals where you overspent or underspent"
              },
              {
                "word": "Checking if you met your savings goal",
                "meaning": "Shows whether you're staying on track"
              },
              {
                "word": "Making notes of what caused overspending",
                "meaning": "Helps you plan better for the next month"
              },
              {
                "word": "Adjusting your plan for the next month",
                "meaning": "Improves your budget based on experience"
              }
            ]),
        QuizQuestion.wordMeaning(
            question: "Match each review mistake with its result.",
            wordPairs: [
              {
                "word": "Ignoring your budget review",
                "meaning": "You miss out on improvement opportunities"
              },
              {
                "word": "Not tracking spending throughout the month",
                "meaning": "You have no data to review"
              },
              {
                "word": "Forgetting to update income changes",
                "meaning": "Your plan may no longer reflect reality"
              },
              {
                "word": "Avoiding uncomfortable truths about spending",
                "meaning": "You may repeat the same mistakes"
              }
            ]),
        QuizQuestion.ordering(
          question: "Arrange these steps for a proper monthly budget review:",
          orderingItems: [
            "Look at your budget and actual expenses side by side",
            "Compare your income to your planned income",
            "Check savings and debt payments",
            "Note what went well and what needs to improve",
            "Adjust your budget for the new month"
          ],
          correctOrder: [0, 1, 2, 3, 4],
        ),
      ],
      //stage 2
      [
        QuizQuestion.multipleChoice(
            question:
                "What should you do if you realize you constantly overspend in a specific category?",
            options: [
              "Ignore it and hope it improves",
              "Remove that category from your budget",
              "Adjust your budget to reflect your actual needs or reduce spending",
              "Blame the budgeting app"
            ],
            correctAnswerIndex: 2,
            explanation:
                "Budgets should be flexible — adjusting them helps you stay realistic and in control."),
        QuizQuestion.multipleChoice(
            question:
                "Making small changes based on budget reviews helps you improve your money habits ______.",
            options: ["immediately", "overnight", "gradually", "accidentally"],
            correctAnswerIndex: 2,
            explanation:
                "Small improvements over time lead to long-term financial success."),
        QuizQuestion.wordMeaning(
            question: "Match each budgeting improvement with its effect.",
            wordPairs: [
              {
                "word": "Reducing spending on non-essentials",
                "meaning": "Frees up money for savings or debt repayment"
              },
              {
                "word": "Reallocating money to a frequently overspent category",
                "meaning": "Makes your budget more realistic"
              },
              {
                "word": "Tracking your expenses more consistently",
                "meaning": "Helps you stay accountable to your plan"
              },
              {
                "word": "Setting reminders to check your budget",
                "meaning": "Keeps your spending aligned with your goals"
              }
            ]),
        QuizQuestion.wordMeaning(
            question:
                "Match each budgeting habit with the type of progress it supports.",
            wordPairs: [
              {
                "word": "Reviewing your budget weekly",
                "meaning": "Short-term improvement"
              },
              {
                "word": "Adjusting your spending each month",
                "meaning": "Medium-term progress"
              },
              {
                "word": "Building an emergency fund over the year",
                "meaning": "Long-term success"
              },
              {
                "word": "Setting savings goals each quarter",
                "meaning": "Medium-term progress"
              }
            ]),
        QuizQuestion.ordering(
          question:
              "Arrange these steps to improve your budget based on your review:",
          orderingItems: [
            "Identify categories that are consistently off-track",
            "Adjust budget amounts for those categories",
            "Reallocate funds from less important areas",
            "Update your goals to reflect current priorities",
            "Test the changes during the next budgeting cycle"
          ],
          correctOrder: [0, 1, 2, 3, 4],
        ),
      ],
      //stage 3
      [
        QuizQuestion.multipleChoice(
            question: "What does it mean to 'stay consistent' with budgeting?",
            options: [
              "Budget once and forget about it",
              "Make budgeting more complicated over time",
              "Stick to your budgeting routine and regularly track your spending",
              "Only budget when you're low on money"
            ],
            correctAnswerIndex: 2,
            explanation:
                "Consistency helps you form lasting financial habits and stay in control."),
        QuizQuestion.multipleChoice(
            question: "Regular budgeting helps you build ______ over time.",
            options: [
              "confusion",
              "debt",
              "strong money habits",
              "bad spending patterns"
            ],
            correctAnswerIndex: 2,
            explanation:
                "Frequent budgeting creates discipline and improves your financial stability."),
        QuizQuestion.wordMeaning(
            question: "Match each consistent budgeting habit with its benefit.",
            wordPairs: [
              {
                "word": "Tracking spending every week",
                "meaning": "Keeps you aware of where your money is going"
              },
              {
                "word": "Setting financial goals each month",
                "meaning": "Gives purpose to your saving and spending"
              },
              {
                "word": "Reviewing your budget at the end of each month",
                "meaning": "Helps you adjust and improve continuously"
              },
              {
                "word": "Updating your plan when circumstances change",
                "meaning": "Keeps your budget relevant and useful"
              }
            ]),
        QuizQuestion.wordMeaning(
            question:
                "Match each budgeting tool with how it supports consistency.",
            wordPairs: [
              {
                "word": "Budgeting app",
                "meaning": "Automatically tracks and categorizes your expenses"
              },
              {
                "word": "Reminder alerts",
                "meaning": "Helps you stick to review and planning routines"
              },
              {
                "word": "Spending journal",
                "meaning": "Gives a detailed log for reflection and control"
              },
              {
                "word": "Weekly check-ins",
                "meaning": "Keeps you updated and helps avoid surprises"
              }
            ]),
        QuizQuestion.ordering(
          question:
              "Arrange these habits to build consistent budgeting success:",
          orderingItems: [
            "Set a day each week to review your budget",
            "Track your expenses daily or weekly",
            "Adjust your plan based on your findings",
            "Celebrate your budgeting wins",
            "Repeat the process regularly"
          ],
          correctOrder: [0, 1, 2, 3, 4],
        ),
      ],
      //stage 4
      [
        QuizQuestion.multipleChoice(
            question: "Why is flexibility important in budgeting?",
            options: [
              "So you can ignore your spending entirely",
              "To change your goals whenever you want",
              "Because life changes, and your budget should adapt too",
              "To remove savings from your budget"
            ],
            correctAnswerIndex: 2,
            explanation:
                "Budgets should evolve with your needs — flexibility helps you stay on track during life changes."),
        QuizQuestion.multipleChoice(
            question:
                "What's a healthy way to respond when your income decreases?",
            options: [
              "Pretend it didn't happen",
              "Continue spending the same",
              "Adjust your budget to reflect your new income",
              "Borrow money without a plan"
            ],
            correctAnswerIndex: 2,
            explanation:
                "When income changes, it's important to adapt your spending to avoid debt."),
        QuizQuestion.wordMeaning(
            question: "Match each budgeting response with its correct purpose.",
            wordPairs: [
              {
                "word": "Reducing spending when income drops",
                "meaning": "Keeps your budget realistic and manageable"
              },
              {
                "word": "Increasing savings when income rises",
                "meaning": "Takes advantage of extra income to boost progress"
              },
              {
                "word": "Temporarily pausing non-essential goals",
                "meaning": "Makes room for emergency needs"
              },
              {
                "word": "Reassessing your financial goals regularly",
                "meaning": "Ensures your plan still fits your current life"
              }
            ]),
        QuizQuestion.wordMeaning(
            question:
                "Match each scenario with the budgeting habit it demonstrates.",
            wordPairs: [
              {
                "word": "Updating your budget after losing a freelance gig",
                "meaning": "Flexibility"
              },
              {
                "word": "Keeping your spending steady during emergencies",
                "meaning": "Discipline"
              },
              {
                "word": "Revising your savings goal after a promotion",
                "meaning": "Adaptability"
              },
              {
                "word": "Ignoring budget changes after a life event",
                "meaning": "Poor Planning"
              }
            ]),
        QuizQuestion.ordering(
          question:
              "Arrange these steps for adjusting your budget after a life change:",
          orderingItems: [
            "Identify how your income or expenses have changed",
            "Update your budget categories and amounts",
            "Re-evaluate your financial goals",
            "Create a new savings or spending plan",
            "Track your progress and adjust as needed"
          ],
          correctOrder: [0, 1, 2, 3, 4],
        ),
      ],
      //stage 5
      [
        QuizQuestion.multipleChoice(
            question: "What does it mean to reflect on your budgeting journey?",
            options: [
              "To criticize every mistake you've made",
              "To give up budgeting completely",
              "To look back at what you've learned, celebrate progress, and improve",
              "To ignore the past and start from scratch every month"
            ],
            correctAnswerIndex: 2,
            explanation:
                "Reflection helps you recognize growth, spot lessons, and strengthen your financial habits."),
        QuizQuestion.multipleChoice(
            question:
                "Looking back on how you managed your budget helps you become more ______ with your finances.",
            options: ["confused", "intentional", "impulsive", "careless"],
            correctAnswerIndex: 1,
            explanation:
                "Intentionality comes from understanding what worked and what didn't."),
        QuizQuestion.wordMeaning(
            question: "Match each reflection activity with its benefit.",
            wordPairs: [
              {
                "word": "Noting down lessons from budgeting mistakes",
                "meaning": "Helps you avoid repeating them"
              },
              {
                "word": "Celebrating small financial wins",
                "meaning": "Boosts motivation and consistency"
              },
              {
                "word": "Reviewing how you handled unexpected expenses",
                "meaning": "Prepares you better for future surprises"
              },
              {
                "word": "Tracking your progress toward goals",
                "meaning": "Shows you how far you've come"
              }
            ]),
        QuizQuestion.wordMeaning(
            question:
                "Match each reflection habit with the skill it strengthens.",
            wordPairs: [
              {
                "word": "Setting aside time to evaluate your money habits",
                "meaning": "Self-awareness"
              },
              {
                "word": "Noticing patterns in your spending",
                "meaning": "Financial mindfulness"
              },
              {
                "word": "Being honest about your budgeting struggles",
                "meaning": "Accountability"
              },
              {
                "word": "Writing down your budgeting journey in a journal",
                "meaning": "Intentional growth"
              }
            ]),
        QuizQuestion.ordering(
          question: "Arrange these steps to reflect on your budgeting journey:",
          orderingItems: [
            "Review your budgeting wins and challenges",
            "Write down lessons you've learned",
            "Celebrate the progress you've made",
            "Adjust your financial goals if needed",
            "Commit to applying your insights going forward"
          ],
          correctOrder: [0, 1, 2, 3, 4],
        ),
      ]
    ]
  ],
  'Savings': [
   
    // Level 0
    [
      //stage 0
      [
        QuizQuestion.multipleChoice(
          question: "Which of these is most likely a need rather than a want?",
          options: [
            "A new video game when your old one still works",
            "A pair of shoes because your only pair is torn",
            "A new backpack because it's your favorite color",
            "A toy on sale that you've wanted for months"
          ],
          correctAnswerIndex: 1,
          explanation:
              "Needs are essential for living or learning, like proper shoes.",
        ),
        QuizQuestion.wordMeaning(
          question: "Sort these into Mostly Needs and Mostly Wants",
          wordPairs: [
            {
              "word": "Warm school sweater during harmattan",
              "meaning": "Mostly Need"
            },
            {"word": "Clean drinking water", "meaning": "Mostly Need"},
            {"word": "Notebook for homework", "meaning": "Mostly Need"},
            {"word": "New headphones for music", "meaning": "Mostly Want"},
            {"word": "Birthday balloons", "meaning": "Mostly Want"},
          ],
        ),
        QuizQuestion.multipleChoice(
          question:
              "When deciding what to buy, it's smart to ask: Do I truly _____ this, or do I just want it?",
          options: ["like", "want", "need", "own"],
          correctAnswerIndex: 2,
          explanation: "It's wise to prioritize needs over wants.",
        ),
        QuizQuestion.wordMeaning(
          question: "Match each item with the reason it is needed or wanted",
          wordPairs: [
            {
              "word": "Lunch at school",
              "meaning": "Needed for health and energy"
            },
            {
              "word": "New action figure",
              "meaning": "Something fun but not essential"
            },
            {"word": "Pencil and ruler", "meaning": "Needed for learning"},
            {
              "word": "A phone upgrade just for looks",
              "meaning": "Mostly for appearance (want)"
            },
          ],
        ),
        QuizQuestion.multipleChoice(
          question: "Why is it risky to spend all your money on wants first?",
          options: [
            "You might lose your money",
            "You could miss out on fun",
            "You may not have enough left for important things",
            "You'll get bored later"
          ],
          correctAnswerIndex: 2,
          explanation:
              "Spending on wants first may leave you unable to cover needs.",
        ),
      ],
      // Stage 1
      [
        QuizQuestion.multipleChoice(
          question: "Which of these is most likely a need rather than a want?",
          options: [
            "A new video game when your old one still works",
            "A pair of shoes because your only pair is torn",
            "A new backpack because it's your favorite color",
            "A toy on sale that you've wanted for months"
          ],
          correctAnswerIndex: 1,
          explanation:
              "Needs are essential for living or learning, like proper shoes.",
        ),
        QuizQuestion.wordMeaning(
          question: "Sort these into Mostly Needs and Mostly Wants",
          wordPairs: [
            {
              "word": "Warm school sweater during harmattan",
              "meaning": "Mostly Need"
            },
            {"word": "Clean drinking water", "meaning": "Mostly Need"},
            {"word": "Notebook for homework", "meaning": "Mostly Need"},
            {"word": "New headphones for music", "meaning": "Mostly Want"},
            {"word": "Birthday balloons", "meaning": "Mostly Want"},
          ],
        ),
        QuizQuestion.multipleChoice(
          question:
              "When deciding what to buy, it's smart to ask: Do I truly _____ this, or do I just want it?",
          options: ["like", "want", "need", "own"],
          correctAnswerIndex: 2,
          explanation: "It's wise to prioritize needs over wants.",
        ),
        QuizQuestion.wordMeaning(
          question: "Match each item with the reason it is needed or wanted",
          wordPairs: [
            {
              "word": "Lunch at school",
              "meaning": "Needed for health and energy"
            },
            {
              "word": "New action figure",
              "meaning": "Something fun but not essential"
            },
            {"word": "Pencil and ruler", "meaning": "Needed for learning"},
            {
              "word": "A phone upgrade just for looks",
              "meaning": "Mostly for appearance (want)"
            },
          ],
        ),
        QuizQuestion.multipleChoice(
          question: "Why is it risky to spend all your money on wants first?",
          options: [
            "You might lose your money",
            "You could miss out on fun",
            "You may not have enough left for important things",
            "You'll get bored later"
          ],
          correctAnswerIndex: 2,
          explanation:
              "Spending on wants first may leave you unable to cover needs.",
        ),
      ],
      // Stage 2
      [
        QuizQuestion.multipleChoice(
          question:
              "Which of these is the strongest reason to save part of your money?",
          options: [
            "So you don't have to carry all your money around",
            "So you can buy anything you want later",
            "So you can prepare for something important or unexpected",
            "So others think you are careful"
          ],
          correctAnswerIndex: 2,
          explanation:
              "Saving prepares you for emergencies and important needs.",
        ),
        QuizQuestion.wordMeaning(
          question:
              "Sort these into Good Reasons to Save and Not the Best Reasons",
          wordPairs: [
            {"word": "Preparing for school fees", "meaning": "Good Reason"},
            {"word": "Saving for a trip in 3 months", "meaning": "Good Reason"},
            {
              "word": "Planning to buy a book for a project",
              "meaning": "Good Reason"
            },
            {
              "word": "Buying snacks every time you feel hungry",
              "meaning": "Not the Best Reason"
            },
            {
              "word": "Keeping money just because your friend is doing it",
              "meaning": "Not the Best Reason"
            },
          ],
        ),
        QuizQuestion.multipleChoice(
          question:
              "People who save regularly are more likely to reach their _____",
          options: ["promises", "goals", "dreams", "rewards"],
          correctAnswerIndex: 1,
          explanation:
              "Consistent saving builds discipline toward achieving goals.",
        ),
        QuizQuestion.wordMeaning(
          question: "Match each savings reason to its example",
          wordPairs: [
            {
              "word": "Short-term goal",
              "meaning": "Saving for a school trip next term"
            },
            {
              "word": "Emergency need",
              "meaning": "Fixing a broken school shoe"
            },
            {
              "word": "Long-term goal",
              "meaning": "Saving for university in a few years"
            },
            {
              "word": "Saving for learning",
              "meaning": "Buying a school textbook"
            },
          ],
        ),
        QuizQuestion.multipleChoice(
          question: "What could happen if you never try to save?",
          options: [
            "You'll never get money again",
            "You'll need to buy more wants",
            "You might have to borrow when something important comes up",
            "You'll automatically become rich someday"
          ],
          correctAnswerIndex: 2,
          explanation: "Without saving, unexpected needs may force borrowing.",
        ),
      ],
      // Stage 3
      [
        QuizQuestion.multipleChoice(
          question: "Which is a smart way to keep your savings safe?",
          options: [
            "Hiding cash under your bed",
            "Depositing it in a savings account",
            "Giving it to a friend to hold",
            "Carrying it with you at all times"
          ],
          correctAnswerIndex: 1,
          explanation:
              "Bank savings accounts keep your money safe and may earn interest.",
        ),
        QuizQuestion.wordMeaning(
          question:
              "Sort these into Good Saving Methods and Not-So-Good Saving Methods",
          wordPairs: [
            {
              "word": "Saving in a bank account",
              "meaning": "Good Saving Method"
            },
            {
              "word": "Keeping money in a piggy bank",
              "meaning": "Good Saving Method"
            },
            {"word": "Using a savings app", "meaning": "Good Saving Method"},
            {
              "word": "Spending first, saving later",
              "meaning": "Not-So-Good Saving Method"
            },
            {
              "word": "Leaving money in your wallet",
              "meaning": "Not-So-Good Saving Method"
            },
          ],
        ),
        QuizQuestion.multipleChoice(
          question:
              "A __________ account is designed to help you save money over time and may earn interest.",
          options: ["spending", "checking", "savings", "wallet"],
          correctAnswerIndex: 2,
          explanation:
              "A savings account is built for storing money safely and earning interest.",
        ),
        QuizQuestion.wordMeaning(
            question: "Match the type of saving with the reason for saving.",
            wordPairs: [
              {"word": "Emergency fund", "meaning": "For unexpected expenses"},
              {
                "word": "Short-term savings",
                "meaning": "For small purchases like books or a school trip"
              },
              {
                "word": "Long-term savings",
                "meaning": "For big goals like university or a car"
              },
              {
                "word": "Retirement savings",
                "meaning": "For when you stop working"
              },
            ]),
        QuizQuestion.multipleChoice(
          question:
              "Which of these is the best reason to use a bank instead of keeping money at home?",
          options: [
            "You can withdraw money anytime without a plan",
            "Your money is safer and can grow with interest",
            "The bank will spend your money for you",
            "It's harder to track how much you have"
          ],
          correctAnswerIndex: 1,
          explanation: "Banks offer security and interest on your savings.",
        ),
      ],
      //stage 4
      [
        QuizQuestion.multipleChoice(
          question: "Why is it important to set a savings goal?",
          options: [
            "It helps you stay focused on what you're saving for",
            "It makes spending money more fun",
            "It stops you from using money for anything else",
            "It allows you to spend whenever you feel like it"
          ],
          correctAnswerIndex: 0,
          explanation: "A clear savings goal keeps you focused and motivated.",
        ),
        QuizQuestion.ordering(
          question:
              "Arrange these steps in the correct order to set a savings goal:",
          orderingItems: [
            "Choose a deadline to reach your goal",
            "Start setting aside money regularly",
            "Deciding what you want to save for",
            "Figure out how much you need"
          ],
          correctOrder: [2, 3, 0, 1],
        ),
        QuizQuestion.multipleChoice(
          question:
              "If you don't have a clear __________, it's easy to spend your savings on unnecessary things.",
          options: ["Goal", "Friend", "Receipt", "Game plan"],
          correctAnswerIndex: 0,
          explanation:
              "Without a goal, savings can easily be spent impulsively.",
        ),
        QuizQuestion.wordMeaning(
            question:
                "Match each action with whether it helps or hurts your savings:",
            wordPairs: [
              {"word": "Creating a savings plan", "meaning": "Helps"},
              {"word": "Spending on things you don't need", "meaning": "Hurts"},
              {"word": "Tracking your progress", "meaning": "Helps"},
              {"word": "Borrowing money to save more", "meaning": "Hurts"}
            ]),
        QuizQuestion.multipleChoice(
          question: "Which habit will help you reach your savings goal?",
          options: [
            "Buying things on impulse",
            "Checking your savings progress regularly",
            "Waiting until the last minute to save",
            "Spending your savings on random things"
          ],
          correctAnswerIndex: 1,
          explanation: "Regularly checking progress helps you stay on track.",
        ),
      ],
      //stage 5
      [
        QuizQuestion.multipleChoice(
          question: "Which of the following is a good saving habit?",
          options: [
            "Spending first, then saving what's left",
            "Saving a portion of your money before spending",
            "Only saving when you receive a large amount of money",
            "Keeping all your money in your wallet"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.wordMeaning(
            question:
                "Sort these into Good Saving Habits and Bad Saving Habits",
            wordPairs: [
              {
                "word": "Setting a savings goal",
                "meaning": "Good Saving Habit"
              },
              {"word": "Using a bank account", "meaning": "Good Saving Habit"},
              {
                "word": "Tracking your savings progress",
                "meaning": "Good Saving Habit"
              },
              {
                "word": "Spending money without a budget",
                "meaning": "Bad Saving Habit"
              },
              {
                "word": "Buying unnecessary things often",
                "meaning": "Bad Saving Habit"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "A good way to avoid spending your savings is to keep it in a __________ where you can't easily access it.",
          options: ["Wallet", "Locked box", "Bank account", "Toy box"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.wordMeaning(
            question: "Match each term with its meaning:",
            wordPairs: [
              {"word": "Savings goal", "meaning": "What you are saving for"},
              {
                "word": "Interest",
                "meaning": "Extra money you earn on your savings"
              },
              {"word": "Budget", "meaning": "A plan for your money"},
              {
                "word": "Impulse spending",
                "meaning": "Buying something without planning"
              }
            ]),
        QuizQuestion.multipleChoice(
          question: "Which is the safest way to keep your savings secure?",
          options: [
            "Hiding money under your pillow",
            "Keeping it in a locked box with no plan",
            "Depositing it in a savings account",
            "Carrying all your money with you"
          ],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question:
              "What should you do if you want to save up for something expensive?",
          options: [
            "Give up on saving since it's too expensive",
            "Save small amounts over time",
            "Spend first and save only if possible",
            "Borrow money from friends and family"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.ordering(
          question: "Arrange these in order:",
          orderingItems: [
            "Track progress",
            "Set a goal",
            "Save regularly",
            "Decide how much to save"
          ],
          correctOrder: [1, 3, 2, 0],
        ),
        QuizQuestion.multipleChoice(
          question:
              "Saving money helps you prepare for the __________ instead of worrying later.",
          options: ["Present", "Past", "Future", "Shopping spree"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question: "Which of these will help you stay motivated to save?",
          options: [
            "Having a clear goal",
            "Spending impulsively",
            "Not tracking your progress",
            "Avoiding all spending"
          ],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.multipleChoice(
          question: "Which statement is true?",
          options: [
            "Saving is only for adults",
            "The earlier you start saving, the better",
            "You don't need a reason to save",
            "Saving makes life harder"
          ],
          correctAnswerIndex: 1,
        ),
      ],
    ],
    // Level 1
    [
      // Stage 0
      [
        QuizQuestion.multipleChoice(
          question: "Why is it important to track your money?",
          options: [
            "So you can see where your money is going",
            "So you can spend all of it at once",
            "Because saving is not necessary",
            "To make sure you never buy anything"
          ],
          correctAnswerIndex: 0,
          explanation:
              "Tracking your money helps you understand your spending and saving habits.",
        ),
        QuizQuestion.wordMeaning(
            question:
                "Sort these into Good Money Habits and Not-So-Good Money Habits",
            wordPairs: [
              {
                "word": "Writing down what you spend",
                "meaning": "Good Money Habit"
              },
              {
                "word": "Keeping track of how much you save",
                "meaning": "Good Money Habit"
              },
              {
                "word": "Setting a budget for yourself",
                "meaning": "Good Money Habit"
              },
              {
                "word": "Spending without checking your balance",
                "meaning": "Not-So-Good Money Habit"
              },
              {
                "word": "Ignoring your savings progress",
                "meaning": "Not-So-Good Money Habit"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "One way to track your money is by keeping a __________ of what you earn and spend.",
          options: ["Journal", "Calendar", "Mirror", "Snack list"],
          correctAnswerIndex: 0,
          explanation:
              "A journal helps you record your income and expenses regularly.",
        ),
        QuizQuestion.wordMeaning(
            question: "Match each tracking method with how it helps:",
            wordPairs: [
              {
                "word": "Budget",
                "meaning": "Helps you plan your spending and saving"
              },
              {
                "word": "Expense tracker",
                "meaning": "Helps you record what you spend money on"
              },
              {
                "word": "Savings log",
                "meaning": "Helps you track your progress toward a goal"
              },
              {
                "word": "Receipt",
                "meaning": "A record of what you have purchased"
              }
            ]),
        QuizQuestion.multipleChoice(
          question: "What happens when you don't track your money?",
          options: [
            "You might spend more than you planned",
            "Your savings will grow faster",
            "You will always have extra money",
            "You won't need to budget"
          ],
          correctAnswerIndex: 0,
          explanation:
              "Not tracking your money can lead to overspending and lack of savings.",
        ),
      ],
      // Stage 1
      [
        QuizQuestion.multipleChoice(
          question: "Why is it important to track your money?",
          options: [
            "So you can see where your money is going",
            "So you can spend all of it at once",
            "Because saving is not necessary",
            "To make sure you never buy anything"
          ],
          correctAnswerIndex: 0,
          explanation:
              "Tracking your money helps you understand your spending and saving habits.",
        ),
        QuizQuestion.wordMeaning(
            question:
                "Sort these into Good Money Habits and Not-So-Good Money Habits",
            wordPairs: [
              {
                "word": "Writing down what you spend",
                "meaning": "Good Money Habit"
              },
              {
                "word": "Keeping track of how much you save",
                "meaning": "Good Money Habit"
              },
              {
                "word": "Setting a budget for yourself",
                "meaning": "Good Money Habit"
              },
              {
                "word": "Spending without checking your balance",
                "meaning": "Not-So-Good Money Habit"
              },
              {
                "word": "Ignoring your savings progress",
                "meaning": "Not-So-Good Money Habit"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "One way to track your money is by keeping a __________ of what you earn and spend.",
          options: ["Journal", "Calendar", "Mirror", "Snack list"],
          correctAnswerIndex: 0,
          explanation:
              "A journal helps you record your income and expenses regularly.",
        ),
        QuizQuestion.wordMeaning(
            question: "Match each tracking method with how it helps:",
            wordPairs: [
              {
                "word": "Budget",
                "meaning": "Helps you plan your spending and saving"
              },
              {
                "word": "Expense tracker",
                "meaning": "Helps you record what you spend money on"
              },
              {
                "word": "Savings log",
                "meaning": "Helps you track your progress toward a goal"
              },
              {
                "word": "Receipt",
                "meaning": "A record of what you have purchased"
              }
            ]),
        QuizQuestion.multipleChoice(
          question: "What happens when you don't track your money?",
          options: [
            "You might spend more than you planned",
            "Your savings will grow faster",
            "You will always have extra money",
            "You won't need to budget"
          ],
          correctAnswerIndex: 0,
          explanation:
              "Not tracking your money can lead to overspending and lack of savings.",
        ),
      ],
      // Stage 2
      [
        QuizQuestion.multipleChoice(
          question: "What is the best way to start tracking your money?",
          options: [
            "Keep a record of what you spend and save",
            "Spend first, then try to remember later",
            "Only track large amounts of money",
            "Ignore your spending and saving"
          ],
          correctAnswerIndex: 0,
          explanation:
              "Recording your spending and saving regularly is key to tracking money well.",
        ),
        QuizQuestion.ordering(
          question:
              "Arrange these steps in the correct order to track your money:",
          orderingItems: [
            "Compare your savings and spending",
            "Adjust your budget if needed",
            "Write down what you earn",
            "Record what you spend"
          ],
          correctOrder: [2, 3, 0, 1],
        ),
        QuizQuestion.multipleChoice(
          question:
              "A __________ helps you organize and track your income and expenses.",
          options: ["Budget", "Toy", "Calculator", "Backpack"],
          correctAnswerIndex: 0,
          explanation:
              "A budget is a money plan that helps track income and expenses.",
        ),
        QuizQuestion.wordMeaning(
            question: "Match each tracking tool with its benefit:",
            wordPairs: [
              {
                "word": "Notebook",
                "meaning": "Simple way to write down spending"
              },
              {
                "word": "Budget app",
                "meaning": "Helps track money automatically"
              },
              {
                "word": "Piggy bank",
                "meaning": "Keeps small savings in one place"
              },
              {
                "word": "Bank statement",
                "meaning": "Shows all transactions in a bank account"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "Why should you compare your income and expenses regularly?",
          options: [
            "To make sure you are saving enough",
            "To make spending money more fun",
            "So you don't have to plan your savings",
            "Because tracking money doesn't matter"
          ],
          correctAnswerIndex: 0,
          explanation:
              "Reviewing your income and expenses helps ensure you're on track with saving goals.",
        ),
      ],
      // Stage 3
      [
        QuizQuestion.multipleChoice(
          question: "How does tracking your spending help you save money?",
          options: [
            "It helps you see where you can cut unnecessary expenses",
            "It encourages you to spend more money",
            "It makes budgeting impossible",
            "It means you can never spend money again"
          ],
          correctAnswerIndex: 0,
          explanation:
              "Tracking your spending reveals habits and areas where you can cut back.",
        ),
        QuizQuestion.wordMeaning(
            question:
                "Sort these into Helpful Budgeting Habits and Unhelpful Budgeting Habits",
            wordPairs: [
              {
                "word": "Checking your spending weekly",
                "meaning": "Helpful Budgeting Habit"
              },
              {
                "word": "Adjusting your budget when needed",
                "meaning": "Helpful Budgeting Habit"
              },
              {
                "word": "Setting spending limits",
                "meaning": "Helpful Budgeting Habit"
              },
              {
                "word": "Ignoring your budget",
                "meaning": "Unhelpful Budgeting Habit"
              },
              {
                "word": "Spending without thinking",
                "meaning": "Unhelpful Budgeting Habit"
              },
            ]),
        QuizQuestion.multipleChoice(
          question:
              "If you spend more money than you earn, you will end up in __________.",
          options: ["Debt", "Savings", "Profit", "Bonus"],
          correctAnswerIndex: 0,
          explanation: "Spending more than you earn creates debt over time.",
        ),
        QuizQuestion.wordMeaning(
            question: "Match each budget category with an example expense:",
            wordPairs: [
              {"word": "Needs", "meaning": "Food, rent, school fees"},
              {"word": "Wants", "meaning": "Toys, entertainment, snacks"},
              {
                "word": "Savings",
                "meaning": "Money set aside for future goals"
              },
              {"word": "Giving", "meaning": "Donating or helping others"}
            ]),
        QuizQuestion.multipleChoice(
          question:
              "Which of these is a sign that you need to adjust your budget?",
          options: [
            "You are spending more than you earn",
            "You always have extra money with no plan",
            "You never buy anything",
            "You ignore your spending"
          ],
          correctAnswerIndex: 0,
          explanation:
              "Overspending signals the need to review and adjust your budget.",
        ),
      ],
      //stage 4
      [
        QuizQuestion.multipleChoice(
          question: "What should you do before making a big purchase?",
          options: [
            "Check if you have enough money",
            "Spend first, then figure it out later",
            "Borrow money without a plan",
            "Buy it because you want it"
          ],
          correctAnswerIndex: 0,
          explanation:
              "It's smart to confirm affordability before any major purchase.",
        ),
        QuizQuestion.ordering(
          question:
              "Arrange these steps in the correct order to track a purchase:",
          orderingItems: [
            "Make the purchase",
            "Decide if you need it",
            "Record expense",
            "Check your budget"
          ],
          correctOrder: [1, 3, 0, 2],
        ),
        QuizQuestion.multipleChoice(
          question:
              "Spending money on things you don't need is called __________ spending.",
          options: ["Smart", "Impulse", "Budgeted", "Automatic"],
          correctAnswerIndex: 1,
          explanation: "Impulse spending is unplanned and often unnecessary.",
        ),
        QuizQuestion.wordMeaning(
            question:
                "Match each action with whether it helps or hurts your spending habits:",
            wordPairs: [
              {"word": "Planning your purchases", "meaning": "Helps"},
              {"word": "Buying without thinking", "meaning": "Hurts"},
              {"word": "Checking your budget", "meaning": "Helps"},
              {"word": "Spending all your money at once", "meaning": "Hurts"},
            ]),
        QuizQuestion.multipleChoice(
          question: "What is one way to avoid impulse spending?",
          options: [
            "Always buy things immediately",
            "Wait and think before spending",
            "Borrow money to buy what you want",
            "Never save money"
          ],
          correctAnswerIndex: 1,
          explanation:
              "Pausing before a purchase helps you decide if it's necessary.",
        ),
      ],
      //stage 5
      [
        QuizQuestion.multipleChoice(
          question: "Which of these is a good money habit?",
          options: [
            "Writing down your expenses",
            "Spending without thinking",
            "Ignoring your savings",
            "Never checking your balance"
          ],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.wordMeaning(
            question: "Sort these into Good Money Habits and Bad Money Habits",
            wordPairs: [
              {"word": "Tracking your savings", "meaning": "Good Money Habit"},
              {"word": "Using a budget", "meaning": "Good Money Habit"},
              {
                "word": "Spending more than you earn",
                "meaning": "Bad Money Habit"
              },
              {
                "word": "Buying things without checking your balance",
                "meaning": "Bad Money Habit"
              }
            ]),
        QuizQuestion.multipleChoice(
          question: "A __________ helps you plan and track your money.",
          options: ["Budget", "Storybook", "Music", "Game"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.wordMeaning(
            question: "Match each term with its meaning:",
            wordPairs: [
              {"word": "Expense", "meaning": "Money spent on things"},
              {"word": "Income", "meaning": "Money you earn or receive"},
              {"word": "Savings", "meaning": "Money set aside for the future"},
              {"word": "Budget", "meaning": "A plan for using your money"}
            ]),
        QuizQuestion.multipleChoice(
          question:
              "What should you do if you realize you're spending too much?",
          options: [
            "Adjust your budget",
            "Keep spending anyway",
            "Ignore it and hope it gets better",
            "Stop tracking your money"
          ],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange these steps in the correct order to track your money:",
          orderingItems: [
            "Record what you spend",
            "Adjust your budget if needed",
            "Write down what you earn",
            "Compare your savings and spending"
          ],
          correctOrder: [2, 0, 3, 1],
        ),
        QuizQuestion.multipleChoice(
          question:
              "Spending money on things you don't need without planning is called __________ spending.",
          options: ["Smart", "Impulse", "Budgeted", "Automatic"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.wordMeaning(
            question: "Match each tracking method with how it helps:",
            wordPairs: [
              {
                "word": "Budget",
                "meaning": "Helps you plan your spending and saving"
              },
              {
                "word": "Expense tracker",
                "meaning": "Helps you record what you spend money on"
              },
              {
                "word": "Savings log",
                "meaning": "Helps you track your progress toward a goal"
              },
              {
                "word": "Receipt",
                "meaning": "A record of what you have purchased"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "Why should you compare your income and expenses regularly?",
          options: [
            "To make sure you are saving enough",
            "To make spending money more fun",
            "So you don't have to plan your savings",
            "Because tracking money doesn't matter"
          ],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.multipleChoice(
          question:
              "Which of these is a sign that you need to adjust your budget?",
          options: [
            "You are spending more than you earn",
            "You always have extra money with no plan",
            "You never buy anything",
            "You ignore your spending"
          ],
          correctAnswerIndex: 0,
        ),
      ],
    ],
    //level 3
    [
      //stage 1
      [
        QuizQuestion.multipleChoice(
          question: "Which of the following is a smart way to spend money?",
          options: [
            "Buying the first thing you see without checking the price",
            "Comparing prices and thinking before you buy",
            "Spending all your money as soon as you get it",
            "Buying something just because your friends have it"
          ],
          correctAnswerIndex: 1,
          explanation:
              "Smart spending involves comparing options and making thoughtful decisions.",
        ),
        QuizQuestion.ordering(
          question:
              "Arrange these steps in the right order for smart spending:",
          orderingItems: [
            "Decide if it's worth the cost",
            "Compare prices before buying",
            "Think about whether you really need it",
            "Check if you have enough money"
          ],
          correctOrder: [2, 3, 1, 0],
        ),
        QuizQuestion.multipleChoice(
          question:
              "Before buying something, it's smart to __________ to see if you can get a better deal.",
          options: [
            "Compare prices",
            "Ignore the price",
            "Spend quickly",
            "Borrow money"
          ],
          correctAnswerIndex: 0,
          explanation:
              "Price comparison helps you save and avoid overspending.",
        ),
        QuizQuestion.wordMeaning(
            question:
                "Match each spending habit with whether it is smart or not:",
            wordPairs: [
              {"word": "Planning your purchases", "meaning": "Smart spending"},
              {
                "word": "Buying things on impulse",
                "meaning": "Not smart spending"
              },
              {
                "word": "Checking prices before buying",
                "meaning": "Smart spending"
              },
              {
                "word": "Spending all your money at once",
                "meaning": "Not smart spending"
              }
            ]),
        QuizQuestion.multipleChoice(
          question: "Why is it important to think before you spend?",
          options: [
            "It helps you make better choices and avoid wasting money",
            "It makes shopping more complicated",
            "It's unnecessary because you can always get more money",
            "It doesn't matter because all purchases are good"
          ],
          correctAnswerIndex: 0,
          explanation:
              "Thinking first helps you prioritize needs and avoid waste.",
        ),
      ],
      //stage 2
      [
        QuizQuestion.multipleChoice(
          question: "What is impulse buying?",
          options: [
            "Carefully planning what to buy before spending money",
            "Buying something suddenly without thinking about it",
            "Comparing prices before making a purchase",
            "Only buying things you absolutely need"
          ],
          correctAnswerIndex: 1,
          explanation:
              "Impulse buying means spending money on something without planning.",
        ),
        QuizQuestion.wordMeaning(
            question: "Sort these into Impulse Buying and Smart Buying:",
            wordPairs: [
              {
                "word":
                    "Buying a snack you didn't plan for just because you saw it",
                "meaning": "Impulse Buying"
              },
              {
                "word": "Purchasing a toy because your friend has it",
                "meaning": "Impulse Buying"
              },
              {
                "word": "Checking reviews before purchasing a new item",
                "meaning": "Smart Buying"
              },
              {
                "word": "Saving up before buying something expensive",
                "meaning": "Smart Buying"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "A good way to avoid impulse buying is to make a __________ before you go shopping.",
          options: ["Shopping list", "Wish list", "Guess", "Quick stop"],
          correctAnswerIndex: 0,
          explanation:
              "Having a shopping list helps you stay focused and avoid unplanned purchases.",
        ),
        QuizQuestion.wordMeaning(
            question:
                "Match the action with whether it helps or hurts your spending habits:",
            wordPairs: [
              {"word": "Making a shopping list", "meaning": "Helps"},
              {
                "word": "Buying something because of peer pressure",
                "meaning": "Hurts"
              },
              {"word": "Thinking before spending", "meaning": "Helps"},
              {
                "word": "Spending money on things you don't need",
                "meaning": "Hurts"
              }
            ]),
        QuizQuestion.multipleChoice(
          question: "What is one way to control impulse buying?",
          options: [
            "Always buy things when you feel like it",
            "Set a spending limit and stick to it",
            "Never buy anything at all",
            "Wait until your friends buy something before you decide"
          ],
          correctAnswerIndex: 1,
          explanation:
              "Setting limits helps you control spending and stick to your plan.",
        ),
      ],
      //stage 3
      [
        QuizQuestion.multipleChoice(
          question: "Which is the best way to get value for your money?",
          options: [
            "Buying the cheapest item no matter what",
            "Looking at price and quality before deciding",
            "Only buying expensive things",
            "Spending all your money to buy as many things as possible"
          ],
          correctAnswerIndex: 1,
          explanation:
              "Smart shoppers consider both price and quality before spending.",
        ),
        QuizQuestion.wordMeaning(
            question:
                "Sort these into Good Value for Money and Poor Value for Money:",
            wordPairs: [
              {
                "word": "Buying a high-quality item that lasts a long time",
                "meaning": "Good Value for Money"
              },
              {
                "word": "Choosing the best option based on price and quality",
                "meaning": "Good Value for Money"
              },
              {
                "word": "Buying something expensive but low-quality",
                "meaning": "Poor Value for Money"
              },
              {
                "word": "Buying something just because it's on sale",
                "meaning": "Poor Value for Money"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "A product that is cheap but breaks easily is __________ value for money.",
          options: ["Good", "Poor", "Perfect", "Excellent"],
          correctAnswerIndex: 1,
          explanation:
              "Durability and usefulness matter more than price alone.",
        ),
        QuizQuestion.wordMeaning(
            question: "Match each situation with the best spending choice:",
            wordPairs: [
              {
                "word": "Buying a good backpack that lasts for years",
                "meaning": "Smart spending"
              },
              {
                "word": "Buying a cheap one that breaks quickly",
                "meaning": "Not smart spending"
              },
              {
                "word": "Checking product reviews before buying",
                "meaning": "Smart spending"
              },
              {
                "word": "Buying something without knowing if it works well",
                "meaning": "Not smart spending"
              }
            ]),
        QuizQuestion.multipleChoice(
          question: "What does 'value for money' mean?",
          options: [
            "Paying the highest price for everything",
            "Getting the best quality for the best price",
            "Buying only cheap things",
            "Spending as much as possible"
          ],
          correctAnswerIndex: 1,
          explanation:
              "Value for money means spending wisely to get the most benefit.",
        ),
      ],
      //stage 4
      [
        QuizQuestion.multipleChoice(
          question: "Why is having a spending plan important?",
          options: [
            "It helps you manage your money wisely",
            "It stops you from buying anything",
            "It makes spending more difficult",
            "It's not useful at all"
          ],
          correctAnswerIndex: 0,
          explanation:
              "A spending plan helps you stay in control of your money.",
        ),
        QuizQuestion.ordering(
          question:
              "Arrange these steps in the correct order to make a spending plan:",
          orderingItems: [
            "Decide how much money you have",
            "Plan for important expenses first",
            "Use what's left for extra spending",
            "Set a little aside for savings"
          ],
          correctOrder: [0, 1, 3, 2],
        ),
        QuizQuestion.multipleChoice(
          question:
              "A __________ helps you decide how to spend your money wisely.",
          options: ["Spending plan", "Impulse", "Borrowing", "Random list"],
          correctAnswerIndex: 0,
          explanation:
              "A spending plan helps you organize and prioritize your money use.",
        ),
        QuizQuestion.wordMeaning(
            question:
                "Match the spending choice with whether it follows a good plan:",
            wordPairs: [
              {"word": "Saving before spending", "meaning": "Good planning"},
              {
                "word": "Buying something without checking your budget",
                "meaning": "Not good planning"
              },
              {
                "word": "Planning for expenses in advance",
                "meaning": "Good planning"
              },
              {"word": "Spending randomly", "meaning": "Not good planning"}
            ]),
        QuizQuestion.multipleChoice(
          question: "What should you do first when planning your spending?",
          options: [
            "Spend money on fun things first",
            "Ignore your savings",
            "Plan for important expenses first",
            "Spend as much as possible"
          ],
          correctAnswerIndex: 2,
          explanation:
              "Important expenses should be handled before anything else.",
        ),
      ],
      //stage 5
      [
        QuizQuestion.multipleChoice(
          question: "What is a good habit when spending money?",
          options: [
            "Buying things without checking the price",
            "Planning your purchases and comparing prices",
            "Spending all your money at once",
            "Buying whatever your friends buy"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.wordMeaning(
            question: "Sort these into Smart Spending and Not Smart Spending:",
            wordPairs: [
              {
                "word": "Making a shopping list before going to the store",
                "meaning": "Smart Spending"
              },
              {
                "word": "Comparing prices before buying",
                "meaning": "Smart Spending"
              },
              {
                "word": "Buying things on impulse",
                "meaning": "Not Smart Spending"
              },
              {
                "word": "Spending all your money on unnecessary things",
                "meaning": "Not Smart Spending"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "Buying something without thinking about it first is called __________.",
          options: ["Impulse buying", "Budgeting", "Smart spending", "Saving"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.wordMeaning(
            question:
                "Match each spending habit with Smart Spending or Not Smart Spending:",
            wordPairs: [
              {"word": "Setting a spending limit", "meaning": "Smart Spending"},
              {
                "word": "Buying something just because it's on sale",
                "meaning": "Not Smart Spending"
              },
              {
                "word": "Checking product reviews before purchasing",
                "meaning": "Smart Spending"
              },
              {
                "word": "Spending all your money as soon as you get it",
                "meaning": "Not Smart Spending"
              }
            ]),
        QuizQuestion.multipleChoice(
          question: "What is the best way to get value for your money?",
          options: [
            "Buying the cheapest item, no matter the quality",
            "Looking at both price and quality before deciding",
            "Always buying the most expensive option",
            "Spending all your money on things that look nice"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question: "Which of these helps you avoid impulse buying?",
          options: [
            "Making a shopping list and sticking to it",
            "Buying things as soon as you see them",
            "Letting your friends decide what you should buy",
            "Not thinking about your purchases"
          ],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange these steps in the correct order for making a spending plan:",
          orderingItems: [
            "Plan for important expenses first",
            "Use what's left for extra spending",
            "Set aside money for savings",
            "Decide how much money you have"
          ],
          correctOrder: [3, 0, 2, 1],
        ),
        QuizQuestion.multipleChoice(
          question:
              "A __________ helps you decide how to spend your money wisely.",
          options: [
            "Spending plan",
            "Wish list",
            "Quick decision",
            "Borrowing"
          ],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.multipleChoice(
          question: "What should you do before making a big purchase?",
          options: [
            "Think about whether you really need it",
            "Buy it immediately so you don't miss out",
            "Let your friends decide for you",
            "Spend all your money on it, even if you don't have enough for other things"
          ],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.multipleChoice(
          question: "Which of the following is NOT a good spending habit?",
          options: [
            "Planning your purchases",
            "Spending all your money as soon as you get it",
            "Comparing prices before buying",
            "Saving money before spending"
          ],
          correctAnswerIndex: 1,
        ),
      ],
    ],
    //level 3
    [
      //stage 1
      [
        QuizQuestion.multipleChoice(
          question: "Why is it important to save money before spending?",
          options: [
            "So you don't run out of money for important things",
            "Because saving is more fun than spending",
            "So you can buy anything you want immediately",
            "Because spending is not allowed"
          ],
          correctAnswerIndex: 0,
          explanation:
              "Saving first ensures that you cover important needs and future goals.",
        ),
        QuizQuestion.ordering(
          question:
              "Arrange these steps in the correct order to save before spending:",
          orderingItems: [
            "Track your savings progress",
            "Decide how much to save",
            "Spend what's left on needs and wants",
            "Set aside your savings"
          ],
          correctOrder: [1, 3, 2, 0],
        ),
        QuizQuestion.multipleChoice(
          question:
              "If you always save a part of your money before spending, you are practicing __________.",
          options: [
            "Smart saving",
            "Impulse buying",
            "Borrowing",
            "Overspending"
          ],
          correctAnswerIndex: 0,
          explanation:
              "Smart saving means setting money aside before you spend.",
        ),
        QuizQuestion.wordMeaning(
            question:
                "Match the action to whether it helps or hurts your ability to save before spending:",
            wordPairs: [
              {"word": "Creating a savings plan", "meaning": "Helps"},
              {
                "word": "Spending first, then saving what's left",
                "meaning": "Hurts"
              },
              {"word": "Setting a savings goal", "meaning": "Helps"},
              {"word": "Buying things on impulse", "meaning": "Hurts"}
            ]),
        QuizQuestion.multipleChoice(
          question:
              "Which of these is a smart way to make sure you save before spending?",
          options: [
            "Keeping your savings separate from your spending money",
            "Buying everything you want first, then saving later",
            "Waiting until the end of the month to see what's left",
            "Spending all your money at once to avoid thinking about it"
          ],
          correctAnswerIndex: 0,
          explanation:
              "Keeping savings separate helps you avoid spending it by mistake.",
        ),
      ],
      //stage 2
      [
        QuizQuestion.multipleChoice(
          question:
              "Which of the following is a good way for kids and teens to earn money?",
          options: [
            "Asking friends to give them money for free",
            "Offering to help with chores or tasks for a small payment",
            "Taking money from others without asking",
            "Spending all their allowance immediately"
          ],
          correctAnswerIndex: 1,
          explanation:
              "Helping with tasks or chores is a respectful and responsible way to earn money.",
        ),
        QuizQuestion.wordMeaning(
            question:
                "Sort these into Ways to Earn Money and Not Ways to Earn Money:",
            wordPairs: [
              {
                "word": "Helping neighbors with small tasks",
                "meaning": "Ways to Earn Money"
              },
              {
                "word": "Selling handmade crafts",
                "meaning": "Ways to Earn Money"
              },
              {
                "word": "Doing extra chores at home",
                "meaning": "Ways to Earn Money"
              },
              {
                "word": "Waiting for someone to give you money",
                "meaning": "Not Ways to Earn Money"
              },
              {
                "word": "Winning a lottery",
                "meaning": "Not Ways to Earn Money"
              },
            ]),
        QuizQuestion.multipleChoice(
          question:
              "If you start a small business selling snacks or handmade crafts, you are called an __________.",
          options: ["Employee", "Entrepreneur", "Banker", "Investor"],
          correctAnswerIndex: 1,
          explanation:
              "An entrepreneur starts and runs a business, even a small one.",
        ),
        QuizQuestion.wordMeaning(
            question: "Match the way of earning money to the example:",
            wordPairs: [
              {
                "word": "Doing chores",
                "meaning": "Getting an allowance for helping at home"
              },
              {
                "word": "Providing a service",
                "meaning": "Washing cars for neighbors"
              },
              {
                "word": "Selling products",
                "meaning": "Making and selling bracelets"
              },
              {
                "word": "Passive income",
                "meaning": "Earning money from an online store while sleeping"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "What is the difference between earning and receiving money as a gift?",
          options: [
            "Earning money means you worked for it, while receiving money as a gift means someone gave it to you for free",
            "They are the same thing",
            "Earning money is only for adults",
            "Receiving money as a gift means you can't spend it"
          ],
          correctAnswerIndex: 0,
          explanation:
              "Earning involves effort or service, while gifts are freely given.",
        ),
      ],
      //stage 3
      [
        QuizQuestion.multipleChoice(
          question:
              "Why is it important to set a savings goal before spending?",
          options: [
            "It helps you stay focused and avoid unnecessary spending",
            "It allows you to spend money freely without a plan",
            "It means you can never spend money on fun things",
            "It doesn't make a difference in how you save"
          ],
          correctAnswerIndex: 0,
          explanation:
              "Setting a goal gives you direction and helps control spending.",
        ),
        QuizQuestion.ordering(
          question:
              "Arrange these steps in the correct order to set a savings goal before spending:",
          orderingItems: [
            "Create a plan for how to save amount",
            "Set a specific amount to save",
            "Decide what you want to save for",
            "Track your progress and adjust if needed"
          ],
          correctOrder: [2, 1, 0, 3],
        ),
        QuizQuestion.multipleChoice(
          question:
              "A good savings goal should be __________, meaning it is clear and achievable.",
          options: ["Specific", "Random", "Unlimited", "Unimportant"],
          correctAnswerIndex: 0,
          explanation: "Specific goals are easier to plan for and reach.",
        ),
        QuizQuestion.wordMeaning(
            question: "Match the savings goal with the reason for saving:",
            wordPairs: [
              {"word": "Saving for a bicycle", "meaning": "A short-term goal"},
              {"word": "Saving for university", "meaning": "A long-term goal"},
              {
                "word": "Saving for a friend's birthday gift",
                "meaning": "A short-term goal"
              },
              {"word": "Saving for retirement", "meaning": "A long-term goal"}
            ]),
        QuizQuestion.multipleChoice(
          question:
              "Which of these is an example of setting a savings goal before spending?",
          options: [
            "Spending all your money, then deciding to save later",
            "Deciding to save ₦5000 every month to buy a new backpack in six months",
            "Waiting until you have extra money before thinking about saving",
            "Borrowing money to buy something now and saving later"
          ],
          correctAnswerIndex: 1,
          explanation:
              "A specific amount, timeline, and purpose are signs of a proper savings goal.",
        ),
      ],
      //stage 4
      [
        QuizQuestion.multipleChoice(
          question:
              "What is the main difference between active and passive income?",
          options: [
            "Active income requires work, while passive income is earned with little to no effort",
            "Passive income is only for rich people",
            "Active income is always higher than passive income",
            "Active income is money you save, while passive income is money you spend"
          ],
          correctAnswerIndex: 0,
          explanation:
              "Active income comes from work; passive income continues with little or no daily effort.",
        ),
        QuizQuestion.wordMeaning(
            question:
                "Sort these income sources into Active Income and Passive Income:",
            wordPairs: [
              {"word": "Doing chores for money", "meaning": "Active Income"},
              {"word": "Selling handmade crafts", "meaning": "Active Income"},
              {
                "word": "Working at a part-time job",
                "meaning": "Active Income"
              },
              {
                "word": "Earning interest from a savings account",
                "meaning": "Passive Income"
              },
              {
                "word": "Getting paid from a rental property",
                "meaning": "Passive Income"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "When you receive money from a job or service you actively perform, it is called __________ income.",
          options: ["Active", "Passive", "Bonus", "Extra"],
          correctAnswerIndex: 0,
          explanation:
              "Active income requires your time, effort, or presence to earn.",
        ),
        QuizQuestion.wordMeaning(
            question: "Match the income type with its example:",
            wordPairs: [
              {
                "word": "Active income",
                "meaning": "Getting paid for tutoring someone"
              },
              {
                "word": "Passive income",
                "meaning": "Earning money from a YouTube video you uploaded"
              },
              {
                "word": "Active income",
                "meaning": "Working as a cashier at a store"
              },
              {
                "word": "Passive income",
                "meaning": "Receiving dividends from company stocks"
              }
            ]),
        QuizQuestion.multipleChoice(
          question: "Passive income requires no initial effort to set up.",
          options: ["True", "False"],
          correctAnswerIndex: 1,
          explanation:
              "Most passive income streams require effort or investment to start.",
        ),
      ],
      //stage 5
      [
        QuizQuestion.multipleChoice(
          question:
              "Why is it important to have both active and passive income?",
          options: [
            "Because passive income replaces active income immediately",
            "So you can have more than one way to make money",
            "Because passive income is only for rich people",
            "So you never have to work again"
          ],
          correctAnswerIndex: 1,
          explanation:
              "Having both types of income gives you financial stability and flexibility.",
        ),
        QuizQuestion.wordMeaning(
            question:
                "Sort these into Ways to Increase Savings and Ways That Hurt Savings:",
            wordPairs: [
              {
                "word": "Setting a savings goal",
                "meaning": "Ways to Increase Savings"
              },
              {
                "word": "Tracking expenses",
                "meaning": "Ways to Increase Savings"
              },
              {
                "word": "Saving a portion of your earnings regularly",
                "meaning": "Ways to Increase Savings"
              },
              {
                "word": "Spending without a budget",
                "meaning": "Ways That Hurt Savings"
              },
              {
                "word": "Borrowing money to buy things you don't need",
                "meaning": "Ways That Hurt Savings"
              },
            ]),
        QuizQuestion.multipleChoice(
          question:
              "One way to grow your savings over time is by putting money into a __________, where it can earn interest.",
          options: [
            "Shopping account",
            "Piggy bank",
            "Savings account",
            "Cash wallet"
          ],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.wordMeaning(
            question: "Match each term with the correct description:",
            wordPairs: [
              {
                "word": "Impulse spending",
                "meaning": "Buying something without planning"
              },
              {
                "word": "Passive income",
                "meaning": "Money earned with little to no daily effort"
              },
              {
                "word": "Active income",
                "meaning": "Money earned by working for it"
              },
              {
                "word": "Budget",
                "meaning": "A plan for how to spend and save money"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "Which of these is the best way to avoid spending money you meant to save?",
          options: [
            "Keep all your money in your pocket so it's easy to access",
            "Put your savings in a separate account or piggy bank",
            "Spend your money first and save whatever is left",
            "Only save when you get extra money"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question: "What is the biggest benefit of passive income?",
          options: [
            "It allows you to earn money even when you're not actively working",
            "It always makes more money than active income",
            "It is guaranteed and risk-free",
            "It replaces the need for a budget"
          ],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange these steps in the correct order for setting a smart savings goal:",
          orderingItems: [
            "Decide how much to save",
            "Track your progress",
            "Choose a savings goal",
            "Pick a deadline to reach your goal"
          ],
          correctOrder: [2, 0, 3, 1],
        ),
        QuizQuestion.multipleChoice(
          question:
              "A good way to manage your savings is to separate your money into different __________, like one for short-term savings and another for long-term savings.",
          options: ["Wallets", "Budgets", "Accounts", "Envelopes"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question: "Which of these is an example of active income?",
          options: [
            "Making money from a YouTube channel over time",
            "Getting paid for tutoring someone",
            "Receiving money from a rented-out apartment",
            "Earning interest from a fixed deposit account"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question: "Which statement is true about saving money?",
          options: [
            "Saving is only for adults",
            "The earlier you start saving, the better",
            "You should only save if you have a high income",
            "Saving is not important for financial success"
          ],
          correctAnswerIndex: 1,
        ),
      ],
    ],
    //level 5
    [
      //stage 1
      [
        QuizQuestion.multipleChoice(
          question: "Why do banks pay interest on your savings?",
          options: [
            "Because they want to give away free money",
            "To encourage people to save money with them",
            "To help people spend more money",
            "Because they don't know what else to do with it"
          ],
          correctAnswerIndex: 1,
          explanation:
              "Banks offer interest as an incentive for people to save with them.",
        ),
        QuizQuestion.wordMeaning(
            question:
                "Sort these into Ways to Grow Savings and Ways That Don't Help Savings Grow:",
            wordPairs: [
              {
                "word": "Keeping money in a savings account",
                "meaning": "Ways to Grow Savings"
              },
              {
                "word": "Earning interest on savings",
                "meaning": "Ways to Grow Savings"
              },
              {"word": "Saving regularly", "meaning": "Ways to Grow Savings"},
              {
                "word": "Spending all your money",
                "meaning": "Ways That Don't Help Savings Grow"
              },
              {
                "word": "Borrowing money to save more",
                "meaning": "Ways That Don't Help Savings Grow"
              },
            ]),
        QuizQuestion.multipleChoice(
          question:
              "The extra money that a bank gives you for keeping your savings with them is called __________.",
          options: ["Interest", "Deposit", "Loan", "Bonus"],
          correctAnswerIndex: 0,
          explanation:
              "Interest is the money a bank pays you for saving with them.",
        ),
        QuizQuestion.wordMeaning(
            question: "Match each concept with its explanation:",
            wordPairs: [
              {
                "word": "Simple interest",
                "meaning": "Interest earned only on the money you deposit"
              },
              {
                "word": "Compound interest",
                "meaning":
                    "Interest earned on your savings and previous interest"
              },
              {
                "word": "Savings account",
                "meaning":
                    "A bank account that keeps your money safe and earns interest"
              },
              {
                "word": "Principal",
                "meaning": "The original amount of money you saved"
              },
            ]),
        QuizQuestion.multipleChoice(
          question: "Which of these statements about interest is TRUE?",
          options: [
            "You must pay interest to the bank for saving money",
            "Interest is a reward for keeping money in a savings account",
            "Only adults can earn interest",
            "Interest makes your savings smaller over time"
          ],
          correctAnswerIndex: 1,
          explanation: "Interest helps your money grow when you save.",
        ),
      ],
      // stage 2
      [
        QuizQuestion.multipleChoice(
          question:
              "Why is compound interest better than simple interest for growing your savings?",
          options: [
            "It adds interest to both your savings and the interest you've already earned",
            "It keeps your money locked away forever",
            "It only works if you save millions of naira",
            "It doesn't actually help your savings grow"
          ],
          correctAnswerIndex: 0,
          explanation:
              "Compound interest earns interest on your money and the interest already earned, helping savings grow faster.",
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the steps of how compound interest helps your savings grow:",
          orderingItems: [
            "Add the earned interest to your total savings",
            "Earn interest on both your savings and the previous interest",
            "Keep saving and watch your money grow",
            "Earn interest on your initial savings"
          ],
          correctOrder: [3, 0, 1, 2],
        ),
        QuizQuestion.multipleChoice(
          question:
              "If you leave your savings in a bank for a long time, your money grows faster because of __________ interest.",
          options: ["Simple", "Compound", "Manual", "Quick"],
          correctAnswerIndex: 1,
          explanation:
              "Compound interest increases savings by earning interest on both the principal and previously earned interest.",
        ),
        QuizQuestion.wordMeaning(
            question: "Match each term with how it helps your savings:",
            wordPairs: [
              {
                "word": "Saving early",
                "meaning": "Gives more time for compound interest to grow"
              },
              {
                "word": "Leaving savings untouched",
                "meaning": "Lets interest add up over time"
              },
              {
                "word": "Adding to savings regularly",
                "meaning": "Increases how much interest you earn"
              },
              {
                "word": "Withdrawing savings often",
                "meaning": "Stops compound interest from growing"
              },
            ]),
        QuizQuestion.multipleChoice(
          question:
              "Which is the BEST way to take advantage of compound interest?",
          options: [
            "Withdraw your money often",
            "Start saving early and leave it to grow",
            "Only save when you get extra money",
            "Keep your money in a box at home"
          ],
          correctAnswerIndex: 1,
          explanation:
              "Starting early and being consistent allows compound interest to work effectively over time.",
        ),
      ],
      // stage 3
      [
        QuizQuestion.multipleChoice(
          question: "Which habit will help your savings grow the most?",
          options: [
            "Spending all your money and saving later",
            "Keeping your savings in a safe place where it can grow",
            "Saving only when you get a big amount of money",
            "Borrowing money to save more"
          ],
          correctAnswerIndex: 1,
          explanation:
              "Keeping savings in a bank or secure place allows it to grow steadily, especially with interest.",
        ),
        QuizQuestion.wordMeaning(
            question:
                "Sort these into Good Saving Strategies and Not-So-Good Saving Strategies:",
            wordPairs: [
              {
                "word": "Saving a fixed amount regularly",
                "meaning": "Good Saving Strategy"
              },
              {
                "word": "Keeping savings in a piggy bank or bank account",
                "meaning": "Good Saving Strategy"
              },
              {
                "word": "Setting a savings goal",
                "meaning": "Good Saving Strategy"
              },
              {
                "word": "Spending first, saving later",
                "meaning": "Not-So-Good Saving Strategy"
              },
              {
                "word": "Taking money out of savings for unplanned spending",
                "meaning": "Not-So-Good Saving Strategy"
              },
            ]),
        QuizQuestion.multipleChoice(
          question:
              "One way to save successfully is to set a __________ and work towards it.",
          options: ["Budget", "Goal", "Debt", "Wish"],
          correctAnswerIndex: 1,
          explanation:
              "Having a goal gives your saving a purpose and direction.",
        ),
        QuizQuestion.wordMeaning(
            question:
                "Match the action with whether it helps or hurts your savings:",
            wordPairs: [
              {"word": "Sticking to a budget", "meaning": "Helps"},
              {"word": "Spending all your money at once", "meaning": "Hurts"},
              {"word": "Saving a little at a time", "meaning": "Helps"},
              {"word": "Not tracking your spending", "meaning": "Hurts"},
            ]),
        QuizQuestion.multipleChoice(
          question: "What should you do if you struggle to save money?",
          options: [
            "Find ways to reduce unnecessary spending",
            "Spend your savings if you really want something",
            "Stop saving completely",
            "Only save when you have extra money"
          ],
          correctAnswerIndex: 0,
          explanation:
              "Reducing unnecessary expenses can free up money to save regularly.",
        ),
      ],
      // stage 4
      [
        QuizQuestion.multipleChoice(
          question: "Why is financial discipline important for saving?",
          options: [
            "It helps you avoid unnecessary spending and reach your goals",
            "It makes saving harder",
            "It means you can't buy anything you want",
            "It is only important for rich people"
          ],
          correctAnswerIndex: 0,
          explanation:
              "Financial discipline helps you stick to your saving goals and control spending.",
        ),
        QuizQuestion.ordering(
          question: "Arrange these in order to develop financial discipline:",
          orderingItems: [
            "Create a budget",
            "Track your progress",
            "Avoid impulse spending",
            "Set a saving goal"
          ],
          correctOrder: [3, 0, 2, 1],
        ),
        QuizQuestion.multipleChoice(
          question:
              "A __________ helps you plan your spending and savings wisely.",
          options: ["Budget", "Loan", "Shopping list", "Expense"],
          correctAnswerIndex: 0,
          explanation:
              "A budget is a plan for how to use your money responsibly.",
        ),
        QuizQuestion.wordMeaning(
            question: "Match the habit with how it affects your savings:",
            wordPairs: [
              {
                "word": "Buying unnecessary items",
                "meaning": "Leads to poor money decisions"
              },
              {
                "word": "Ignoring your financial goal",
                "meaning": "Makes it harder to save"
              },
              {
                "word": "Sticking to a budget",
                "meaning": "Helps you manage money better"
              },
              {
                "word": "Tracking your savings",
                "meaning": "Keeps you motivated"
              },
            ]),
        QuizQuestion.multipleChoice(
          question: "What is one way to avoid impulse spending?",
          options: [
            "Buy whatever you like whenever you see it",
            "Think about whether you really need something before buying it",
            "Spend all your money first, then think about saving later",
            "Avoid saving too much money"
          ],
          correctAnswerIndex: 1,
          explanation:
              "Pausing to consider your needs prevents unnecessary spending.",
        ),
      ],
      // stage 5
      [
        QuizQuestion.multipleChoice(
          question:
              "What is the main benefit of saving money in a bank account?",
          options: [
            "The bank keeps your money forever",
            "You earn interest on your savings",
            "You can withdraw your money at any time without any rules",
            "It helps you spend money faster"
          ],
          correctAnswerIndex: 1,
          explanation:
              "Savings accounts earn interest and keep your money safe.",
        ),
        QuizQuestion.ordering(
          question:
              "Arrange these steps in the correct order to show how compound interest helps savings grow:",
          orderingItems: [
            "Continue saving and watch money grow",
            "Add the earned interest to total savings",
            "Earn interest on savings",
            "Earn interest on both savings and previous interest"
          ],
          correctOrder: [2, 1, 3, 0],
        ),
        QuizQuestion.multipleChoice(
          question:
              "One of the best ways to grow your savings is to save a __________ amount regularly, instead of only saving when you have extra money.",
          options: ["Fixed", "Small", "Random", "Borrowed"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.wordMeaning(
            question: "Match each habit with how it affects savings:",
            wordPairs: [
              {
                "word": "Setting a budget",
                "meaning": "Helps you plan your spending and savings"
              },
              {
                "word": "Buying unnecessary things often",
                "meaning": "Makes it harder to save money"
              },
              {
                "word": "Tracking your savings",
                "meaning": "Keeps you focused on your financial goals"
              },
              {
                "word": "Ignoring your savings goals",
                "meaning": "Can lead to poor money decisions"
              },
            ]),
        QuizQuestion.multipleChoice(
          question:
              "Which of the following statements about compound interest is TRUE?",
          options: [
            "Compound interest makes your savings grow faster over time",
            "Compound interest only works for rich people",
            "You must add more money to your account every day for compound interest to work",
            "Compound interest is the same as taking a loan from the bank"
          ],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.wordMeaning(
            question:
                "Sort the following into Good Saving Habits and Bad Saving Habits:",
            wordPairs: [
              {
                "word": "Saving a little money every time you receive money",
                "meaning": "Good Saving Habit"
              },
              {
                "word": "Keeping money in a savings account",
                "meaning": "Good Saving Habit"
              },
              {
                "word": "Setting a savings goal",
                "meaning": "Good Saving Habit"
              },
              {
                "word": "Spending first and saving later",
                "meaning": "Bad Saving Habit"
              },
              {
                "word": "Not tracking your spending",
                "meaning": "Bad Saving Habit"
              },
            ]),
        QuizQuestion.multipleChoice(
          question:
              "Avoiding __________ spending helps you stick to your savings plan.",
          options: ["Impulse", "Smart", "Budgeted", "Fixed"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.wordMeaning(
            question: "Match each term to its meaning:",
            wordPairs: [
              {
                "word": "Principal",
                "meaning": "The original amount of money saved"
              },
              {
                "word": "Simple interest",
                "meaning": "Interest earned only on the money you deposit"
              },
              {
                "word": "Compound interest",
                "meaning":
                    "Interest earned on both savings and previous interest"
              },
              {
                "word": "Savings account",
                "meaning":
                    "A place to keep your money safe while earning interest"
              },
            ]),
        QuizQuestion.multipleChoice(
          question:
              "What is the best way to stay committed to your savings goal?",
          options: [
            "Spend your savings if something fun comes up",
            "Track your progress and remind yourself why you're saving",
            "Wait until you have a lot of money before you start saving",
            "Save money only when you feel like it"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange these actions in the correct order to build strong savings habits:",
          orderingItems: [
            "Track your progress",
            "Save regularly",
            "Set a saving goal",
            "Avoid impulse spending",
            "Create a budget"
          ],
          correctOrder: [2, 4, 1, 3, 0],
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
        QuizQuestion.multipleChoice(
          question: "What is the sum of ₦120 and ₦230?",
          options: ["₦360", "₦350", "₦340", "₦370"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "If you buy items costing ₦45, ₦55, and ₦100, what is the total cost?",
          options: ["₦190", "₦200", "₦210", "₦205"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question:
              "You have ₦500 and you spend ₦150 on a snack. How much money do you have left?",
          options: ["₦400", "₦360", "₦340", "₦350"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question:
              "Add these amounts: ₦350, ₦200, and ₦150. What is the total?",
          options: ["₦700", "₦750", "₦800", "₦650"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question:
              "If you save ₦100 each day for 5 days and then receive a bonus of ₦250, what is your total savings?",
          options: ["₦650", "₦850", "₦750", "₦600"],
          correctAnswerIndex: 2,
        ),
      ],
      // Stage 2
      [
        QuizQuestion.multipleChoice(
          question: "What is the result of subtracting ₦275 from ₦500?",
          options: ["₦250", "₦235", "₦225", "₦245"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question: "If you have ₦1000 and spend ₦450, how much money remains?",
          options: ["₦580", "₦560", "₦540", "₦550"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question:
              "You purchase an item for ₦320 with a ₦500 note. What is your change?",
          options: ["₦180", "₦190", "₦170", "₦200"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question: "What is 750 minus 425?",
          options: ["₦325", "₦315", "₦335", "₦345"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "If you have ₦1200 and you buy three items costing ₦300 each, what is your change?",
          options: ["₦250", "₦200", "₦300", "₦400"],
          correctAnswerIndex: 2,
        ),
      ],
      // Stage 3
      [
        QuizQuestion.multipleChoice(
          question:
              "If a notebook costs ₦150 and a pen costs ₦80, which item is less expensive?",
          options: [
            "Notebook",
            "Pen",
            "They cost the same",
            "Not enough information"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the following items in order of price from lowest to highest.",
          orderingItems: ["Chocolate (₦20)", "Candy (₦15)", "Gum (₦10)"],
          correctOrder: [2, 1, 0],
        ),
        QuizQuestion.multipleChoice(
          question:
              "If you have ₦300 and you buy a magazine for ₦250, you will have ______ left.",
          options: ["₦70", "₦60", "₦50", "₦40"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.ordering(
          question: "Rearrange these steps for comparing prices when shopping:",
          orderingItems: [
            "A) Compare the prices to find the best deal",
            "B) Decide which items you need",
            "C) Check the prices of the items"
          ],
          correctOrder: [1, 2, 0],
        ),
        QuizQuestion.wordMeaning(
            question: "Match each item with its correct price.",
            wordPairs: [
              {"word": "Notebook", "meaning": "₦150"},
              {"word": "Pen", "meaning": "₦80"},
              {"word": "Candy", "meaning": "₦15"},
              {"word": "Chocolate", "meaning": "₦20"}
            ]),
      ],
      [
        QuizQuestion.multipleChoice(
          question:
              "You have ₦500. If you buy an item for ₦275, how much change do you get?",
          options: ["₦225", "₦235", "₦215", "₦245"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the steps in the correct order when making a purchase at a store:",
          orderingItems: [
            "A) Calculate total cost of items",
            "B) Pay with cash",
            "C) Receive change",
            "D) Subtract cost from cash provided"
          ],
          correctOrder: [0, 3, 1, 2],
        ),
        QuizQuestion.multipleChoice(
          question:
              "If you have ₦600 and you spend ₦150 on a snack and ₦200 on a drink, you will have ______ left.",
          options: ["₦300", "₦250", "₦200", "₦150"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.wordMeaning(
            question:
                "Match each scenario with the correct calculation method.",
            wordPairs: [
              {
                "word": "Scenario 1: Adding the prices of items",
                "meaning": "Addition"
              },
              {
                "word":
                    "Scenario 2: Subtracting the total cost from the money given",
                "meaning": "Subtraction"
              },
              {
                "word":
                    "Scenario 3: Determining change when you pay more than the total cost",
                "meaning": "Change Calculation"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "You have ₦800. You buy two books priced at ₦220 each and a pencil for ₦60. What is your remaining amount?",
          options: ["₦300", "₦280", "₦320", "₦260"],
          correctAnswerIndex: 1,
        ),
      ],
      [
        QuizQuestion.multipleChoice(
          question: "What is the sum of ₦250 and ₦375?",
          options: ["₦615", "₦625", "₦635", "₦645"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question: "If you subtract ₦100 from ₦450, you get ______.",
          options: ["₦350", "₦360", "₦370", "₦340"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the steps for calculating change when you pay with cash.",
          orderingItems: [
            "Step 1: Receive the remaining money as change.",
            "Step 2: Subtract the total cost from the amount paid.",
            "Step 3: Determine the total cost of the items."
          ],
          correctOrder: [2, 1, 0],
        ),
        QuizQuestion.multipleChoice(
          question: "Which method helps ensure you add money accurately?",
          options: [
            "Rushing through the calculation",
            "Lining up the digits by place value",
            "Ignoring the hundreds place",
            "Relying only on mental math"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.wordMeaning(
            question: "Match each transaction with the appropriate operation.",
            wordPairs: [
              {
                "word":
                    "Transaction A: Adding the cost of a notebook and a pen",
                "meaning": "Addition"
              },
              {
                "word":
                    "Transaction B: Finding out how much money is left after spending ₦200 from ₦500",
                "meaning": "Subtraction"
              },
              {
                "word":
                    "Transaction C: Calculating change when you pay ₦1000 for a ₦750 purchase",
                "meaning": "Subtraction"
              }
            ]),
        QuizQuestion.ordering(
          question:
              "Rearrange these steps for solving a multi-step addition problem.",
          orderingItems: [
            "A) Combine the totals to get the final sum",
            "B) Align the numbers by place value",
            "C) Add the units, tens, and hundreds separately",
            "D) Write down each amount"
          ],
          correctOrder: [1, 2, 3, 0],
        ),
        QuizQuestion.multipleChoice(
          question:
              "If you have ₦800 and spend ₦150 on a snack, the remaining amount is ______.",
          options: ["₦600", "₦650", "₦700", "₦750"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "You have ₦1,000. You purchase items costing ₦275, ₦125, and ₦200. What is the total cost of your purchases?",
          options: ["₦600", "₦625", "₦650", "₦675"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.ordering(
          question: "Order these items by price from lowest to highest.",
          orderingItems: ["Item A: ₦85", "Item B: ₦120", "Item C: ₦65"],
          correctOrder: [2, 0, 1],
        ),
        QuizQuestion.wordMeaning(
            question:
                "Match each operation with its function in money calculations.",
            wordPairs: [
              {
                "word": "Addition",
                "meaning": "Combines amounts to find a total"
              },
              {"word": "Subtraction", "meaning": "Finds the remaining money"},
              {"word": "Comparison", "meaning": "Evaluates price differences"}
            ]),
      ]
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
        QuizQuestion.multipleChoice(
          question: "What is the decimal equivalent of the fraction 1/4?",
          options: ["0.25", "0.5", "0.75", "1.0"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.multipleChoice(
          question: "If you divide 1 by 2, what decimal do you get?",
          options: ["0.25", "0.5", "0.75", "1.5"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.ordering(
          question: "Arrange the steps for converting a fraction to a decimal:",
          orderingItems: [
            "Write the fraction as a division problem",
            "Divide the numerator by the denominator",
            "Record the resulting decimal"
          ],
          correctOrder: [0, 1, 2],
        ),
        QuizQuestion.wordMeaning(
            question: "Match each fraction with its decimal equivalent.",
            wordPairs: [
              {"word": "1/2", "meaning": "0.5"},
              {"word": "1/4", "meaning": "0.25"},
              {"word": "1/5", "meaning": "0.2"},
              {"word": "3/4", "meaning": "0.75"}
            ]),
        QuizQuestion.multipleChoice(
          question: "Which of the following represents 50% as a decimal?",
          options: ["0.05", "0.5", "5.0", "1.5"],
          correctAnswerIndex: 1,
        ),
      ],
      // Stage 2
      [
        QuizQuestion.multipleChoice(
          question: "What is 25% expressed as a decimal?",
          options: ["0.25", "0.20", "0.75", "0.50"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.multipleChoice(
          question:
              "If an item is on sale for 30% off, you pay ______% of the original price.",
          options: ["60", "65", "70", "75"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the steps to calculate a percentage of a given amount in the correct order.",
          orderingItems: [
            "Convert the percentage to a decimal",
            "Multiply the decimal by the total amount",
            "Interpret the result as the part of the whole"
          ],
          correctOrder: [0, 1, 2],
        ),
        QuizQuestion.wordMeaning(
            question:
                "Match each discount scenario with the amount you pay relative to the original price.",
            wordPairs: [
              {"word": "10% off", "meaning": "Pay 90% of the price"},
              {"word": "20% off", "meaning": "Pay 80% of the price"},
              {"word": "30% off", "meaning": "Pay 70% of the price"},
              {"word": "50% off", "meaning": "Pay 50% of the price"}
            ]),
        QuizQuestion.multipleChoice(
          question: "What is 20% of ₦500?",
          options: ["₦100", "₦120", "₦80", "₦150"],
          correctAnswerIndex: 0,
        ),
      ],
      // Stage 3
      [
        QuizQuestion.multipleChoice(
          question:
              "An item costs ₦1,000 and is discounted by 25%. What is the sale price?",
          options: ["₦700", "₦750", "₦800", "₦850"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "If an item originally costs ₦800 and has a 10% discount, the discount amount is ______ and the sale price is ₦______.",
          options: ["₦80, ₦720", "₦70, ₦730", "₦100, ₦700", "₦60, ₦740"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the steps to calculate the sale price from a discount in the correct order.",
          orderingItems: [
            "Convert the discount percentage to a decimal",
            "Multiply the original price by the decimal to get the discount amount",
            "Subtract the discount amount from the original price"
          ],
          correctOrder: [0, 1, 2],
        ),
        QuizQuestion.wordMeaning(
            question:
                "Match each scenario with its correct sale price for an item originally priced at ₦1,000.",
            wordPairs: [
              {"word": "20% discount", "meaning": "₦800"},
              {"word": "30% discount", "meaning": "₦700"},
              {"word": "40% discount", "meaning": "₦600"}
            ]),
        QuizQuestion.multipleChoice(
          question:
              "What is the discount amount on an item that costs ₦600 with a 15% discount?",
          options: ["₦70", "₦80", "₦90", "₦100"],
          correctAnswerIndex: 2,
        ),
      ],
      [
        QuizQuestion.multipleChoice(
          question:
              "Two stores offer the same item originally priced at ₦1,000. Store A gives a 20% discount, and Store B gives a 25% discount. Which store offers the better deal?",
          options: [
            "Store A",
            "Store B",
            "They offer the same deal",
            "Cannot be determined"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "An item with an original price of ₦800 is discounted by 30%. The discount amount is ₦______ and the sale price is ₦_______.",
          options: [
            "₦200 and ₦600",
            "₦250 and ₦550",
            "₦240 and ₦560",
            "₦220 and ₦580"
          ],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the steps to evaluate a sales offer from start to finish.",
          orderingItems: [
            "Subtract the discount amount from the original price",
            "Convert the discount percentage to a decimal",
            "Multiply the original price by the decimal",
            "Compare the sale price with other offers to determine the best value"
          ],
          correctOrder: [1, 2, 0, 3],
        ),
        QuizQuestion.wordMeaning(
            question:
                "Match each sales offer with its corresponding sale price for an item originally priced at ₦1,200.",
            wordPairs: [
              {"word": "15% discount", "meaning": "₦1,020"},
              {"word": "25% discount", "meaning": "₦900"},
              {"word": "35% discount", "meaning": "₦780"}
            ]),
        QuizQuestion.multipleChoice(
          question:
              "You are comparing two deals for a shirt originally priced at ₦2,000. Deal 1 offers a 10% discount, and Deal 2 offers a flat discount of ₦300. Which deal is better?",
          options: [
            "Deal 1 (10% discount)",
            "Deal 2 (₦300 discount)",
            "Both are equal",
            "Not enough information"
          ],
          correctAnswerIndex: 1,
        ),
      ],
      //stage 5
      [
        QuizQuestion.multipleChoice(
          question: "What is the decimal equivalent of the fraction 3/4?",
          options: ["0.25", "0.50", "0.75", "1.00"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question: "The fraction 1/5 is equal to ______ in decimal form.",
          options: ["0.10", "0.20", "0.25", "0.50"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "If an item costs ₦1,200 and you receive a 20% discount, what is the discount amount?",
          options: ["₦240", "₦300", "₦180", "₦200"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the steps for calculating a sale price from a discount in the correct order.",
          orderingItems: [
            "Subtract the discount amount from the original price to find the sale price.",
            "Multiply the original price by the decimal to get the discount amount.",
            "Convert the discount percentage to a decimal."
          ],
          correctOrder: [2, 1, 0],
        ),
        QuizQuestion.wordMeaning(
            question:
                "Match each percentage discount with the corresponding percentage of the original price you pay.",
            wordPairs: [
              {"word": "10% discount", "meaning": "Pay 90% of original price"},
              {"word": "25% discount", "meaning": "Pay 75% of original price"},
              {"word": "50% discount", "meaning": "Pay 50% of original price"}
            ]),
        QuizQuestion.multipleChoice(
          question: "What is 30% of ₦800?",
          options: ["₦240", "₦200", "₦280", "₦300"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.multipleChoice(
          question:
              "An item originally priced at ₦1,000 is discounted by 15%. The sale price is ₦_______",
          options: ["₦850", "₦900", "₦875", "₦800"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.ordering(
          question:
              "Rearrange these steps for evaluating a sales offer from different stores:",
          orderingItems: [
            "Convert the discount percentage to a decimal.",
            "Compare the final sale prices to determine the best deal",
            "Subtract the discount amount from the original price.",
            "Calculate the discount amount."
          ],
          correctOrder: [0, 3, 2, 1],
        ),
        QuizQuestion.multipleChoice(
          question:
              "Two stores sell the same gadget originally priced at ₦2,000. Store X offers a 10% discount, and Store Y offers a 25% discount. Which store gives the lower sale price?",
          options: [
            "Store X",
            "Store Y",
            "Both are the same",
            "Cannot be determined"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.wordMeaning(
            question: "Match each concept with its correct description.",
            wordPairs: [
              {
                "word": "Fraction-to-Decimal Conversion",
                "meaning": "Converting a fraction to a decimal by division."
              },
              {
                "word": "Percentage Calculation",
                "meaning":
                    "Expressing a value as a part of 100 and using it to compute portions."
              },
              {
                "word": "Discount Evaluation",
                "meaning":
                    "Determining the final sale price by applying a discount."
              }
            ]),
      ],
    ],
    //level 3
    [
      //stage 1
      [
        QuizQuestion.multipleChoice(
          question:
              "If one pencil costs ₦20 and you buy 5 pencils, what is the total cost?",
          options: ["₦80", "₦90", "₦100", "₦110"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question:
              "A book costs ₦250. If you buy 3 books, the total cost is ₦______.",
          options: ["₦700", "₦750", "₦800", "₦850"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the steps to calculate the total cost of items using multiplication.",
          orderingItems: [
            "Record the total cost.",
            "Determine the number of items you are buying.",
            "Multiply the unit price by the quantity.",
            "Identify the price of one item."
          ],
          correctOrder: [3, 1, 2, 0],
        ),
        QuizQuestion.wordMeaning(
            question:
                "Match each scenario with its correct total cost calculation.",
            wordPairs: [
              {
                "word": "Scenario 1: 7 notebooks at ₦120 each",
                "meaning": "₦840"
              },
              {"word": "Scenario 2: 4 erasers at ₦35 each", "meaning": "₦140"},
              {"word": "Scenario 3: 6 markers at ₦50 each", "meaning": "₦300"}
            ]),
        QuizQuestion.multipleChoice(
          question:
              "A shop sells bags for ₦350 each. If you buy 8 bags, what is your total expense?",
          options: ["₦2,800", "₦2,750", "₦3,000", "₦3,200"],
          correctAnswerIndex: 0,
        ),
      ],
      //stage 2
      [
        QuizQuestion.multipleChoice(
          question:
              "A box of 24 chocolates costs ₦480. What is the cost per chocolate?",
          options: ["₦15", "₦20", "₦25", "₦30"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "If you buy 8 notebooks for a total of ₦1,600, each notebook costs ______.",
          options: ["₦150", "₦160", "₦200", "₦250"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the steps for calculating the unit price of an item from a total cost.",
          orderingItems: [
            "Record the resulting unit price.",
            "Determine the number of items in the package.",
            "Divide the total cost by the number of items.",
            "Identify the total cost of the package"
          ],
          correctOrder: [3, 1, 2, 0],
        ),
        QuizQuestion.wordMeaning(
            question:
                "Match each scenario with its correct unit price calculation.",
            wordPairs: [
              {
                "word": "Scenario 1: A bundle of 10 pencils for ₦500",
                "meaning": "₦50"
              },
              {
                "word": "Scenario 2: A pack of 5 erasers for ₦250",
                "meaning": "₦50"
              },
              {
                "word": "Scenario 3: A set of 20 stickers for ₦400",
                "meaning": "₦20"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "You have ₦1,200 to spend on a pack of markers. Two packs are available: Pack A has 6 markers, and Pack B has 8 markers. Which pack gives a lower cost per marker?",
          options: [
            "Pack A",
            "Pack B",
            "Both cost the same",
            "Cannot be determined"
          ],
          correctAnswerIndex: 1,
        ),
      ],
      //stage 3
      [
        QuizQuestion.multipleChoice(
          question:
              "A pack of 6 markers costs ₦180. What is the unit price per marker?",
          options: ["₦20", "₦25", "₦30", "₦35"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question:
              "If a pack of 10 stickers costs ₦350, then each sticker costs ₦______.",
          options: ["₦30", "₦35", "₦40", "₦25"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the steps to determine the best value based on unit price.",
          orderingItems: [
            "Choose the option with the lowest unit price.",
            "Calculate the unit price by dividing total cost by quantity.",
            "Determine the total cost and quantity of items.",
            "Compare the unit price of different options"
          ],
          correctOrder: [2, 1, 3, 0],
        ),
        QuizQuestion.wordMeaning(
            question: "Match each pack with its correct unit price.",
            wordPairs: [
              {"word": "Pack A: 8 items for ₦240", "meaning": "₦30 per item"},
              {"word": "Pack B: 12 items for ₦432", "meaning": "₦36 per item"},
              {"word": "Pack C: 5 items for ₦175", "meaning": "₦35 per item"}
            ]),
        QuizQuestion.multipleChoice(
          question:
              "Two packs of notebooks are available. Pack X offers 10 notebooks for ₦500, and Pack Y offers 15 notebooks for ₦720. Which pack offers the better value based on unit price?",
          options: [
            "Pack X",
            "Pack Y",
            "Both offer the same value",
            "Not enough information"
          ],
          correctAnswerIndex: 1,
        ),
      ],
      //stage 4
      [
        QuizQuestion.multipleChoice(
          question:
              "You want to buy 3 notebooks at ₦150 each and 2 pens at ₦80 each. What is the total cost?",
          options: ["₦600", "₦610", "₦620", "₦630"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question:
              "A store sells 4 packs of erasers, each costing ₦50. The total cost for the erasers is ₦______.",
          options: ["₦150", "₦180", "₦200", "₦220"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the steps for calculating the total cost of a mixed purchase.",
          orderingItems: [
            "Multiply the quantity of each item by its unit price.",
            "Add the total costs of all items together.",
            "Record the final total cost.",
            "Identify the quantities and unit prices for each item."
          ],
          correctOrder: [3, 0, 1, 2],
        ),
        QuizQuestion.wordMeaning(
            question: "Match each scenario with its correct total cost.",
            wordPairs: [
              {"word": "Scenario A: 5 markers at ₦30 each", "meaning": "₦150"},
              {"word": "Scenario B: 7 pencils at ₦25 each", "meaning": "₦175"},
              {
                "word": "Scenario C: 3 notebooks at ₦200 each",
                "meaning": "₦600"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "You have ₦2,000 to spend. You plan to buy 2 items: one item costs ₦750 and the other costs ₦850. How much money will you have left after these purchases?",
          options: ["₦300", "₦400", "₦450", "₦500"],
          correctAnswerIndex: 0,
        ),
      ],
      //stage 5
      [
        QuizQuestion.multipleChoice(
          question:
              "A pack of 12 pencils costs ₦600. What is the unit price per pencil?",
          options: ["₦40", "₦45", "₦50", "₦55"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question:
              "If 5 notebooks cost ₦1,000 in total, then each notebook costs ₦______.",
          options: ["₦150", "₦175", "₦200", "₦250"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.ordering(
          question: "Arrange the steps to calculate the unit price of an item.",
          orderingItems: [
            "Divide the total cost by the number of items.",
            "Record the resulting unit price",
            "Determine the total cost of the package",
            "Count the number of items in the package."
          ],
          correctOrder: [2, 3, 0, 1],
        ),
        QuizQuestion.wordMeaning(
            question: "Match each pack with its correct unit price.",
            wordPairs: [
              {"word": "Pack A: 10 items for ₦500", "meaning": "₦50 per item"},
              {"word": "Pack B: 8 items for ₦384", "meaning": "₦48 per item"},
              {"word": "Pack C: 15 items for ₦750", "meaning": "₦50 per item"}
            ]),
        QuizQuestion.multipleChoice(
          question:
              "You have ₦1,200 to buy a pack of markers. Pack X offers 6 markers, while Pack Y offers 8 markers for the same total price. Which pack offers the better value?",
          options: [
            "Pack X",
            "Pack Y",
            "Both offer the same value",
            "Not enough information"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "A store sells 7 erasers for ₦245. What is the cost per eraser?",
          options: ["₦35", "₦30", "₦40", "₦45"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.multipleChoice(
          question:
              "If you buy 3 packs of stickers and each pack costs ₦180, the total cost is ₦______.",
          options: ["₦540", "₦500", "₦520", "₦600"],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.ordering(
          question:
              "Rearrange these steps to calculate the total cost of a mixed purchase (e.g., buying notebooks and pens).",
          orderingItems: [
            "Multiply the quantity of each item by its unit price.",
            "Identify the quantities and unit prices of all items.",
            "Add the total costs of each type of item together.",
            "Record the final combined total."
          ],
          correctOrder: [1, 0, 2, 3],
        ),
        QuizQuestion.multipleChoice(
          question:
              "A package of 4 books costs ₦1,200. What is the price per book?",
          options: ["₦250", "₦300", "₦350", "₦400"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.wordMeaning(
            question: "Match each calculation type with its description.",
            wordPairs: [
              {
                "word": "Multiplication for Total Cost",
                "meaning": "Finding the cost for multiple identical items."
              },
              {
                "word": "Division for Unit Price",
                "meaning": "Determining how much one item costs."
              },
              {
                "word": "Addition for Combined Purchases",
                "meaning": "Adding the costs of different items."
              }
            ]),
      ],
    ],
    //level 4
    [
      //stage 1
      [
        QuizQuestion.multipleChoice(
          question:
              "If you deposit ₦1,000 at an annual simple interest rate of 5% for 1 year, how much interest will you earn?",
          options: ["₦25", "₦50", "₦75", "₦100"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "Using the formula Simple Interest = Principal × Rate × Time, if you deposit ₦500 at a rate of 8% per year for 2 years, the interest earned is ₦______.",
          options: ["₦60", "₦70", "₦80", "₦90"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the steps to calculate simple interest in the correct order.",
          orderingItems: [
            "Multiply the principal by the rate and by the time period.",
            "Convert the interest rate into decimal form.",
            "Identify the principal amount.",
            "Record the resulting interest earned."
          ],
          correctOrder: [2, 1, 0, 3],
        ),
        QuizQuestion.wordMeaning(
            question: "Match each scenario with its correct interest earned.",
            wordPairs: [
              {
                "word": "Scenario A: ₦2,000 at 4% per year for 1 year",
                "meaning": "₦80"
              },
              {
                "word": "Scenario B: ₦1,500 at 6% per year for 1 year",
                "meaning": "₦90"
              },
              {
                "word": "Scenario C: ₦1,000 at 10% per year for 2 years",
                "meaning": "₦200"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "You invest ₦3,000 at a simple interest rate of 3% per year for 3 years. What is the total amount of money you will have at the end of the period?",
          options: ["₦3,270", "₦3,300", "₦3,240", "₦3,180"],
          correctAnswerIndex: 0,
        ),
      ],
      //stage 2
      [
        QuizQuestion.multipleChoice(
          question:
              "If you deposit ₦1,000 at an annual compound interest rate of 5% for 2 years, what is the approximate total amount?",
          options: ["₦1,050", "₦1,100", "₦1,103", "₦1,150"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question:
              "Compound interest is calculated on both the original principal and the ______ earned in previous periods.",
          options: ["deposit", "rate", "interest", "time"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the steps for calculating compound interest for one period.",
          orderingItems: [
            "Add the interest earned to the principal.",
            "Calculate the interest for the period.",
            "Multiply the current principal by the interest rate.",
            "Use the formula: Total Amount = Principal × (1 + Rate)."
          ],
          correctOrder: [
            3,
            2,
            0,
            1
          ], // Based on the logic: formula -> multiply -> add -> becomes new principal
        ),
        QuizQuestion.wordMeaning(
            question: "Match each term with its correct description.",
            wordPairs: [
              {
                "word": "Principal",
                "meaning": "The original amount of money deposited or invested."
              },
              {
                "word": "Compound Interest",
                "meaning":
                    "The process of earning interest on both the initial amount and previously earned interest."
              },
              {
                "word": "Compounding Frequency",
                "meaning":
                    "How often the earned interest is added to the principal (e.g., annually, monthly)."
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "A deposit of ₦2,000 is made at an annual compound interest rate of 10% for 3 years. What is the approximate total amount at the end of 3 years?",
          options: ["₦2,600", "₦2,662", "₦2,800", "₦3,000"],
          correctAnswerIndex: 1,
        ),
      ],
      //stage 3
      [
        QuizQuestion.multipleChoice(
          question:
              "You deposit ₦1,000 in a simple interest account at 6% per year for 3 years. What is the total amount after 3 years?",
          options: ["₦1,180", "₦1,190", "₦1,200", "₦1,250"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question:
              "In a compound interest scenario, if you deposit ₦500 at an annual rate of 8% for 2 years, the approximate total amount is ₦______.",
          options: ["₦572", "₦580", "₦583", "₦600"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the steps to compare a simple interest account with a compound interest account for the same principal, rate, and time period.",
          orderingItems: [
            "Calculate the total amount using the simple interest formula.",
            "Calculate the total amount using the compound interest formula.",
            "Compare the two totals to see which account grows more.",
            "Identify the principal, rate, and time period."
          ],
          correctOrder: [3, 0, 1, 2],
        ),
        QuizQuestion.wordMeaning(
            question:
                "Match each interest type with its description in a real-life context.",
            wordPairs: [
              {
                "word": "Simple Interest",
                "meaning":
                    "Interest is calculated only on the original principal."
              },
              {
                "word": "Compound Interest",
                "meaning":
                    "Interest is calculated on both the principal and the accumulated interest."
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "Suppose you have two savings options: Option A offers simple interest at 7% per year and Option B offers compound interest at 7% per year. If you invest ₦2,000 for 4 years, which option will yield a higher total amount?",
          options: [
            "Option A (Simple Interest)",
            "Option B (Compound Interest)",
            "Both yield the same amount",
            "Cannot be determined"
          ],
          correctAnswerIndex: 1,
        ),
      ],
      //stage 4
      [
        QuizQuestion.multipleChoice(
          question:
              "Which of the following best explains why starting to save early is beneficial with compound interest?",
          options: [
            "Interest is only earned on the principal amount.",
            "Interest accumulates on both the principal and the interest earned over time.",
            "Interest rates increase automatically with time.",
            "The total savings amount is fixed regardless of time."
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "The formula for annual compound interest is: Total Amount = Principal × (1 + Rate)^_______",
          options: ["Principal", "Rate", "Time", "Interest"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the factors that affect compound interest in order of how they directly influence the calculation (from the basic input to the outcome).",
          orderingItems: [
            "Principal",
            "Total Amount (Result)",
            "Interest Rate",
            "Time Period"
          ],
          correctOrder: [0, 2, 3, 1],
        ),
        QuizQuestion.wordMeaning(
            question:
                "Match each scenario with the type of interest calculation that applies.",
            wordPairs: [
              {
                "word":
                    "Scenario 1: You earn interest only on your original deposit.",
                "meaning": "Simple Interest"
              },
              {
                "word":
                    "Scenario 2: You earn interest on your deposit and on previously earned interest.",
                "meaning": "Compound Interest"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "If you invest ₦1,000 at a 5% annual compound interest rate for 10 years, compared to investing the same amount at 5% for 5 years, which statement is true?",
          options: [
            "The total amount after 10 years is only slightly more than after 5 years.",
            "The total amount after 10 years is roughly double the amount after 5 years.",
            "The longer period significantly increases the total amount due to compound growth.",
            "The interest earned remains the same regardless of the time period."
          ],
          correctAnswerIndex: 2,
        ),
      ],
      //stage 5
      [
        QuizQuestion.multipleChoice(
          question: "Which formula is used to calculate simple interest?",
          options: [
            "Principal + (Principal × Rate × Time)",
            "Principal × Rate × Time",
            "Principal × (1 + Rate × Time)",
            "Principal × (1 + Rate)^Time"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "In compound interest, interest is earned on both the principal and the __________ earned in previous periods.",
          options: ["deposit", "rate", "interest", "balance"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the steps to calculate compound interest for one period.",
          orderingItems: [
            "Record the total amount",
            "Add 1 to the interest rate (in decimal form).",
            "Multiply the principal by the result raised to the power of time.",
            "Convert the interest rate to a decimal if necessary."
          ],
          correctOrder: [3, 1, 2, 0],
        ),
        QuizQuestion.wordMeaning(
            question: "Match each type of interest with its description.",
            wordPairs: [
              {
                "word": "Simple Interest",
                "meaning": "Interest calculated only on the original principal."
              },
              {
                "word": "Compound Interest",
                "meaning":
                    "Interest calculated on the principal and on previously earned interest."
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "You deposit ₦1,000 at a 5% annual compound interest rate for 5 years. Which of the following statements is most accurate?",
          options: [
            "You will earn exactly ₦250 in interest.",
            "The total amount will be less than ₦1,300.",
            "The total amount will be more than what you'd earn with simple interest over 5 years.",
            "Compound interest does not affect the total amount over time."
          ],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question:
              "The compound interest formula is: Total Amount = Principal × (1 + Rate)^________.",
          options: ["Principal", "Rate", "Time", "Interest"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.multipleChoice(
          question: "Which of the following is true about compound interest?",
          options: [
            "It always yields the same amount as simple interest.",
            "It grows faster because interest is earned on both the principal and previously earned interest.",
            "It is calculated only once at the end of the investment period.",
            "It decreases the total savings over time."
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.ordering(
          question:
              "Rearrange the factors in the compound interest formula to reflect the calculation process.",
          orderingItems: [
            "Total Amount (Result)",
            "(1 + Rate)",
            "Exponent: Time",
            "Principal"
          ],
          correctOrder: [3, 1, 2, 0],
        ),
        QuizQuestion.wordMeaning(
            question: "Match each scenario with the correct outcome.",
            wordPairs: [
              {
                "word":
                    "Scenario 1: Investing ₦1,000 at 5% simple interest for 3 years.",
                "meaning": "Total Amount = ₦1,150"
              },
              {
                "word":
                    "Scenario 2: Investing ₦1,000 at 5% compound interest for 3 years.",
                "meaning": "Total Amount ≈ ₦1,157.63"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "Why is starting to save early especially beneficial when using compound interest?",
          options: [
            "Because the interest rate decreases over time.",
            "Because compound interest has a larger impact over longer time periods.",
            "Because simple interest will eventually overtake compound interest.",
            "Because saving early means you earn interest only on the principal."
          ],
          correctAnswerIndex: 1,
        ),
      ],
    ],
    //level 5
    [
      //stage 1
      [
        QuizQuestion.multipleChoice(
          question: "What is the primary purpose of creating a budget?",
          options: [
            "To track how much money you have in your bank account",
            "To plan how to allocate your income for needs, wants, and savings",
            "To record every expense in detail",
            "To avoid spending money entirely"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "In the 50/30/20 budgeting rule, 50% of your income should ideally be allocated to __________ expenses.",
          options: ["wants", "savings", "investments", "needs"],
          correctAnswerIndex: 3,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the steps for creating a basic budget in the correct order.",
          orderingItems: [
            "Subtract total expenses from your income",
            "Allocate remaining funds to savings or extra spending",
            "Identify your total monthly income",
            "List all your fixed and variable expenses"
          ],
          correctOrder: [2, 3, 0, 1],
        ),
        QuizQuestion.wordMeaning(
            question: "Match each budget category with its examples.",
            wordPairs: [
              {"word": "Needs", "meaning": "Rent, groceries, utilities"},
              {
                "word": "Wants",
                "meaning": "Dining out, entertainment, luxury items"
              },
              {
                "word": "Savings",
                "meaning": "Emergency fund, investments, future purchases"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "If your monthly income is ₦100,000 and you follow the 50/30/20 rule, how much money should you allocate for savings?",
          options: ["₦20,000", "₦30,000", "₦50,000", "₦60,000"],
          correctAnswerIndex: 0,
        ),
      ],
      //stage 2
      [
        QuizQuestion.multipleChoice(
          question: "Which of the following best describes fixed expenses?",
          options: [
            "Costs that change every month",
            "Costs that remain the same each month",
            "Expenses that you can easily reduce",
            "Non-essential expenses"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "Variable expenses are costs that __________ from month to month.",
          options: ["stay the same", "expire", "vary", "disappear"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the steps to forecast your monthly expenses in the correct order.",
          orderingItems: [
            "Adjust estimates for anticipated changes.",
            "Identify fixed and variable expense categories.",
            "Review past spending records.",
            "Summarize the total forecasted expenses."
          ],
          correctOrder: [2, 1, 0, 3],
        ),
        QuizQuestion.wordMeaning(
            question: "Match each expense category with its example.",
            wordPairs: [
              {
                "word": "Fixed Expenses",
                "meaning": "Monthly rent, Internet subscription"
              },
              {
                "word": "Variable Expenses",
                "meaning": "Grocery bills, Dining out"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "If your monthly income is ₦120,000 and your forecasted fixed expenses are ₦60,000 while your estimated variable expenses are ₦30,000, how much do you have left for savings or discretionary spending?",
          options: ["₦20,000", "₦30,000", "₦40,000", "₦50,000"],
          correctAnswerIndex: 1,
        ),
      ],
      //stage 3
      [
        QuizQuestion.multipleChoice(
          question: "What is the very first step in creating a budget?",
          options: [
            "Listing all your expenses",
            "Determining your total monthly income",
            "Allocating funds for savings",
            "Estimating variable expenses"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "After calculating your total expenses, subtracting them from your income gives you the ______, which can be used for savings or discretionary spending.",
          options: [
            "final income",
            "monthly debt",
            "remaining funds",
            "total earnings"
          ],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the steps for creating a budget in the correct order.",
          orderingItems: [
            "List all fixed expenses",
            "Determine your total monthly income",
            "Estimate your variable expenses",
            "Add fixed and variable expenses to get total expenses",
            "Subtract total expenses from income to find remaining funds"
          ],
          correctOrder: [1, 0, 2, 3, 4],
        ),
        QuizQuestion.wordMeaning(
            question: "Match each budget component with its example.",
            wordPairs: [
              {
                "word": "Fixed Expenses",
                "meaning": "Rent, internet subscription"
              },
              {"word": "Variable Expenses", "meaning": "Groceries, dining out"},
              {
                "word": "Remaining Funds",
                "meaning": "Money left after all expenses are deducted"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "Suppose your monthly income is ₦100,000. Your fixed expenses total ₦45,000, and your variable expenses are estimated at ₦30,000. How much do you have remaining for savings or extra spending?",
          options: ["₦15,000", "₦25,000", "₦35,000", "₦40,000"],
          correctAnswerIndex: 1,
        ),
      ],
      //stage 4
      [
        QuizQuestion.multipleChoice(
          question:
              "If your monthly income decreases by 20%, what is the most appropriate first step in adjusting your budget?",
          options: [
            "Increase your spending in all categories",
            "Review and update your expense estimates",
            "Ignore the change and maintain your original budget",
            "Cut out all discretionary spending immediately"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "Adjusting your budget when expenses increase helps maintain __________ over time.",
          options: ["savings", "stability", "balance", "income"],
          correctAnswerIndex: 2,
        ),
        QuizQuestion.ordering(
          question:
              "Arrange the steps for adjusting your budget in the correct order.",
          orderingItems: [
            "Update your expense estimates",
            "Reallocate funds among needs, wants, and savings",
            "Identify changes in your income and expenses",
            "Recalculate your total income"
          ],
          correctOrder: [2, 3, 0, 1],
        ),
        QuizQuestion.wordMeaning(
            question: "Match each scenario with the best adjustment strategy.",
            wordPairs: [
              {
                "word":
                    "Scenario A: Your utility bills have increased significantly.",
                "meaning":
                    "Update your fixed expense estimates and adjust remaining funds"
              },
              {
                "word":
                    "Scenario B: You received a bonus, increasing your monthly income.",
                "meaning": "Increase your savings allocation"
              },
              {
                "word": "Scenario C: Unexpected medical expenses have arisen.",
                "meaning": "Reallocate funds by reducing discretionary spending"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "Suppose your monthly income is ₦100,000, and initially your fixed and variable expenses total ₦80,000, leaving you ₦20,000 for savings and extras. If your fixed expenses unexpectedly rise by ₦10,000, what is your new remaining amount for savings and discretionary spending, assuming no other changes?",
          options: ["₦5,000", "₦10,000", "₦15,000", "₦20,000"],
          correctAnswerIndex: 1,
        ),
      ],
      //stage 5
      [
        QuizQuestion.multipleChoice(
          question: "What is the first step in creating a budget?",
          options: [
            "Listing all expenses",
            "Determining your total monthly income",
            "Allocating funds for savings",
            "Estimating variable expenses"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "The money left after subtracting total expenses from your income is called the __________.",
          options: [
            "monthly allowance",
            "remaining funds",
            "emergency savings",
            "gross income"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question: "Which of the following best describes fixed expenses?",
          options: [
            "Expenses that change each month",
            "Expenses that remain constant each month",
            "Non-essential expenses",
            "Expenses that you can easily adjust"
          ],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.ordering(
          question: "Arrange the steps for creating a basic budget in order.",
          orderingItems: [
            "List all fixed expenses",
            "Determine your total monthly income",
            "Estimate your variable expenses",
            "Add fixed and variable expenses to get total expenses",
            "Subtract total expenses from income to determine remaining funds"
          ],
          correctOrder: [1, 0, 2, 3, 4],
        ),
        QuizQuestion.wordMeaning(
            question: "Match each budget component with its example.",
            wordPairs: [
              {
                "word": "Fixed Expenses",
                "meaning": "Rent, internet subscription"
              },
              {"word": "Variable Expenses", "meaning": "Groceries, dining out"},
              {
                "word": "Remaining Funds",
                "meaning": "Money left after expenses are paid"
              }
            ]),
        QuizQuestion.multipleChoice(
          question:
              "If your monthly income is ₦100,000, fixed expenses are ₦45,000, and variable expenses are ₦30,000, what are your remaining funds?",
          options: ["₦15,000", "₦25,000", "₦35,000", "₦40,000"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.multipleChoice(
          question:
              "The 50/30/20 rule divides income into 50% for needs, 30% for wants, and __________ for savings.",
          options: ["10%", "20%", "25%", "15%"],
          correctAnswerIndex: 1,
        ),
        QuizQuestion.ordering(
          question:
              "Rearrange the steps for adjusting your budget when expenses change.",
          orderingItems: [
            "Update your expense estimates",
            "Recalculate total income and expenses",
            "Identify changes in income or expenses",
            "Reallocate funds among needs, wants, and savings"
          ],
          correctOrder: [2, 1, 0, 3],
        ),
        QuizQuestion.multipleChoice(
          question: "Why is it important to forecast your expenses?",
          options: [
            "To predict future spending and avoid overspending",
            "To increase your fixed expenses",
            "To ensure you spend all your income",
            "To eliminate variable expenses"
          ],
          correctAnswerIndex: 0,
        ),
        QuizQuestion.wordMeaning(
            question:
                "Match each step of the budgeting process with its purpose.",
            wordPairs: [
              {
                "word": "Determining total monthly income",
                "meaning": "Knowing how much money you earn each month."
              },
              {
                "word": "Listing fixed and variable expenses",
                "meaning": "Identifying your essential and non-essential costs."
              },
              {
                "word": "Subtracting expenses from income",
                "meaning":
                    "Finding out how much money is left after all expenses."
              },
              {
                "word": "Allocating remaining funds",
                "meaning":
                    "Deciding how to use the leftover money for savings and discretionary spending."
              }
            ]),
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
  
  // Reward system variables
  int totalCoinsEarned = 0;
  int totalXPEarned = 0;
  int correctAnswersInRow = 0;
  int x2MultiplierThreshold = 3; // Get x2 multiplier after 3 correct answers in a row
  bool showX2Multiplier = false;


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
    final isCorrect = selectedIndex == currentQuestion.correctAnswerIndex;
    

    
    if (isCorrect) {
      handleCorrectAnswer();
    } else {
      // Reset streak if wrong answer
      correctAnswersInRow = 0;
      showX2Multiplier = false;
    }
    
    notifyListeners();
    return isCorrect;
  }
  
  void handleCorrectAnswer() {
    // Add coins for correct answer
    totalCoinsEarned += 100;
    
    // Add XP based on current multiplier status
    if (showX2Multiplier) {
      totalXPEarned += 20; // x2 multiplier active
    } else {
      totalXPEarned += 10; // normal XP
    }
    
    correctAnswersInRow++;
    
    // Check if x2 multiplier should be activated
    if (correctAnswersInRow >= x2MultiplierThreshold && !showX2Multiplier) {
      showX2Multiplier = true;
    }
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
        
        // Check if all pairs are matched (question complete)
        if (allPairsMatched) {
          
          handleCorrectAnswer();
        }
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
    

    
    if (isOrderCorrect) {
      handleCorrectAnswer();
    } else {
      // Reset streak if wrong answer
      correctAnswersInRow = 0;
      showX2Multiplier = false;
    }
    
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
