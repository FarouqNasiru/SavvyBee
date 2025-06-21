import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/navbar.dart';
import 'package:savvybee/reading_screen.dart';
import 'card_onboarding_provider.dart';

// ...existing imports...

class CardOnboardingScreen extends StatelessWidget {
  final String category;
  final int level;
  final String stageKey;
  final String title;
  final String description;
  final int levels;
  final int games;
  final int coins;

  CardOnboardingScreen({
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

  // Central content map for all stages, levels, and categories
  static const Map<String, Map<String, dynamic>> onboardingCardContent = {
    // --- Budgeting ---
    'Stage 1_Level 0_Budgeting': {
      'cardTexts': [
        'Know Where Your Money Goes – Track income and expenses.',
        'Avoid Overspending – Keep finances under control',
        'Spot Spending Patterns – Identify areas to save.',
        'Make Budgeting Easier – Plan your finances effectively.',
        'Achieve Savings Goals – Set aside money for future needs.',
        'Simple Tracking Methods – Use a notebook, app, receipts, or a spreadsheet.'
      ],
      'readingTexts': [
        'Tracking your money.',
        'Tracking your money helps you stay in control of your finances. It shows where your money comes from and where it goes, helping you make smarter decisions.',
        'Why is Tracking Important?'
      ],
      'dropdowns': [
        {
          'header': 'Keeps You in Control',
          'body': 'Helps you avoid overspending'
        },
        {
          'header': 'Reveals Spending Habits',
          'body': 'Shows where you can cut back.'
        },
        {
          'header': 'Ensures Your Needs Are Covered',
          'body': 'Prevents running out of money.'
        },
        {
          'header': 'Make Budgeting Easier',
          'body': 'Helps you create a plan that works.'
        },
        {
          'header': 'Supports Savings Goals',
          'body': 'Helps you save for things you want.'
        },
      ],
      'bulletPoints': [
        'Write it down in a notebook.',
        'Use an app or spreadsheet.',
        'Keep and review receipts.',
        'Check your spending weekly.'
      ],
    },

    'Stage 1_Level 1_Budgeting': {
      'cardTexts': [
        'Prevents mistakes and tracks spending',
        'Avoids overspending with real-time updates',
        'Recording Methods: Notebook, Apps, Spreadsheets, Envelope System',
        'Best Practices: Record instantly, save receipts, review regularly'
      ],
      'readingTexts': [
        'Recording Transactions Accurately',
        'Tracking your money helps prevent errors, manage your budget, and avoid overspending.',
        'Recording transactions immediately ensures accuracy and keeps your finances organized.',
      ],
      'dropdowns': [
        {
          'header': 'Why It’s Important:',
          'body':
              'Prevents mistakes and forgotten expenses \nHelps track spending habits and adjust budgets \n Avoids overspending by showing real-time balances'
        },
      ],
      'bulletPoints': [
        'Notebook: Write transactions by hand',
        'Apps: Automatically track and categorize spending',
        'Spreadsheets: Organize and calculate expenses',
        'Envelope System: Allocate cash for specific needs',
      ],
    },

    'Stage 1_Level 2_Budgeting': {
      'cardTexts': [
        'Traditional Methods: Handwritten ledgers & envelope system for manual tracking',
        'Digital Tools: Budgeting apps & spreadsheets for automated tracking',
        'Benefits of Digital Tracking: Saves time, improves accuracy, and provides spending reports'
      ],
      'readingTexts': [
        'Budgeting helps you understand where your money goes each month.',
        'Tracking your expenses is the first step to financial freedom.',
        'With a budget, you can plan for both needs and wants.',
      ],
      'dropdowns': [
        {
          'header': 'Why It’s Important:',
          'body':
              'Prevents mistakes and forgotten expenses \nHelps track spending habits and adjust budgets \n Avoids overspending by showing real-time balances'
        },
      ],
      'bulletPoints': [
        'Notebook: Write transactions by hand',
        'Apps: Automatically track and categorize spending',
        'Spreadsheets: Organize and calculate expenses',
        'Envelope System: Allocate cash for specific needs',
      ],
    },

    'Stage 1_Level 3_Budgeting': {
      'cardTexts': [
        'Review spending regularly to track patterns and identify unnecessary expenses',
        'Compare actual spending to your budget to stay on track',
        'Categorize expenses to see where your money goes',
        'Check for errors or unusual charges to avoid mistakes',
        'Adjust spending habits to save more and improve financial health'
      ],
      'readingTexts': [
        'Budgeting helps you understand where your money goes each month.',
        'Tracking your expenses is the first step to financial freedom.',
        'With a budget, you can plan for both needs and wants.',
      ],
      'dropdowns': [
        {
          'header': 'Advanced budgeting',
          'body': 'Track your spending and adjust your plan.'
        },
      ],
      'bulletPoints': [
        'Review your budget monthly',
        'Adjust for unexpected expenses',
      ],
    },

    'Stage 1_Level 4_Budgeting': {
      'cardTexts': [
        'Why Track Money? Stay in control, avoid overspending, and save effectively',
        'Recording Transactions: Use a notebook, app, or spreadsheet---record immediately to prevent mistakes',
        'Tracking Tools: Digital (Budgeting apps, online trackers) and Traditional (Notebooks, envelope system)',
        'Reviewing Spending: Compare expenses to your budget, spot unnecessary costs, and adjust habits',
        'Smart Money Choices: Tracking and analyzing spending leads to better financial decisions and savings growth.'
      ],
      'readingTexts': [
        'Budgeting helps you understand where your money goes each month.',
        'Tracking your expenses is the first step to financial freedom.',
        'With a budget, you can plan for both needs and wants.',
      ],
      'dropdowns': [
        {
          'header': 'Advanced budgeting',
          'body': 'Track your spending and adjust your plan.'
        },
      ],
      'bulletPoints': [
        'Review your budget monthly',
        'Adjust for unexpected expenses',
      ],
    },

    'Stage 1_Level 5_Budgeting': {
      'cardTexts': [
        'Budget hacks help reduce unnecessary spending.',
        'Optimization means making the most of your money.',
        'Identify expenses, find cheaper alternatives, and set savings goals',
        'Applying hacks can cut costs and improve financial habits.'
      ],
      'readingTexts': [
        'Budgeting helps you understand where your money goes each month.',
        'Tracking your expenses is the first step to financial freedom.',
        'With a budget, you can plan for both needs and wants.',
      ],
      'dropdowns': [
        {
          'header': 'Advanced budgeting',
          'body': 'Track your spending and adjust your plan.'
        },
      ],
      'bulletPoints': [
        'Review your budget monthly',
        'Adjust for unexpected expenses',
      ],
    },

    'Stage 1_Level 6_Budgeting': {
      'cardTexts': [
        'Use Budgeting Tools: Apps or spreadsheets help track income and expenses efficiently',
        'Automate Payments: Prevents late fees and improves budgeting discipline.',
        'Tracking Methods: Digital tools offer automation, while traditional methods (e.g., envelope system) provide hands-on control.',
        'Budget Hack – Envelope System: Allocate cash into labeled envelopes to limit spending per category',
        'Budget Setup Steps: List income → Record expenses → Set savings goal → Track daily spending → Review & adjust regularly'
      ],
      'readingTexts': [
        'Budgeting helps you understand where your money goes each month.',
        'Tracking your expenses is the first step to financial freedom.',
        'With a budget, you can plan for both needs and wants.',
      ],
      'dropdowns': [
        {
          'header': 'Advanced budgeting',
          'body': 'Track your spending and adjust your plan.'
        },
      ],
      'bulletPoints': [
        'Review your budget monthly',
        'Adjust for unexpected expenses',
      ],
    },

    'Stage 2_Level 0_Budgeting': {
      'cardTexts': [
        'Tracking Expenses (Level 1)',
        'Why track your spending?',
        'Let\'s get organized!'
      ],
      'readingTexts': [
        'Budgeting helps you understand where your money goes each month.',
        'Tracking your expenses is the first step to financial freedom.',
        'With a budget, you can plan for both needs and wants.',
      ],
      'dropdowns': [
        {
          'header': 'How to track?',
          'body': 'Record every purchase, no matter how small.'
        },
      ],
      'bulletPoints': [
        'Save receipts',
        'Use a spending app',
      ],
    },
    'Stage 2_Level 1_Budgeting': {
      'cardTexts': [
        'Tracking Expenses (Level 2)',
        'Let\'s track more complex expenses.',
        'Ready for advanced tracking?'
      ],
      'readingTexts': [
        'Budgeting helps you understand where your money goes each month.',
        'Tracking your expenses is the first step to financial freedom.',
        'With a budget, you can plan for both needs and wants.',
      ],
      'dropdowns': [
        {
          'header': 'Tracking tips',
          'body': 'Categorize your expenses for better insights.'
        },
      ],
      'bulletPoints': [
        'Group expenses by type',
        'Analyze your spending patterns',
      ],
    },
    // --- Savings ---
    'Stage 1_Level 0_Savings': {
      'cardTexts': [
        'Welcome to Savings (Level 1)!',
        'Learn how to save for your goals.',
        'Let\'s start saving!'
      ],
      'readingTexts': [
        'Budgeting helps you understand where your money goes each month.',
        'Tracking your expenses is the first step to financial freedom.',
        'With a budget, you can plan for both needs and wants.',
      ],
      'dropdowns': [
        {
          'header': 'Why save?',
          'body': 'Savings help you prepare for emergencies and future needs.'
        },
      ],
      'bulletPoints': [
        'Set a savings goal',
        'Open a savings account',
      ],
    },
    'Stage 1_Level 1_Savings': {
      'cardTexts': [
        'Welcome to Savings (Level 2)!',
        'Let\'s save for bigger goals.',
        'Ready for Level 2?'
      ],
      'readingTexts': [
        'Budgeting helps you understand where your money goes each month.',
        'Tracking your expenses is the first step to financial freedom.',
        'With a budget, you can plan for both needs and wants.',
      ],
      'dropdowns': [
        {
          'header': 'Bigger goals',
          'body': 'Plan for long-term savings like education or a house.'
        },
      ],
      'bulletPoints': [
        'Automate your savings',
        'Track your progress',
      ],
    },
    // --- Numeracy ---
    'Stage 1_Level 0_Numeracy': {
      'cardTexts': [
        'Welcome to Numeracy (Level 1)!',
        'Numbers help you manage money.',
        'Let\'s build your skills!'
      ],
      'readingTexts': [
        'Budgeting helps you understand where your money goes each month.',
        'Tracking your expenses is the first step to financial freedom.',
        'With a budget, you can plan for both needs and wants.',
      ],
      'dropdowns': [
        {
          'header': 'Why numeracy?',
          'body':
              'Understanding numbers helps you make better financial decisions.'
        },
      ],
      'bulletPoints': [
        'Practice mental math',
        'Estimate before you buy',
      ],
    },
    'Stage 1_Level 1_Numeracy': {
      'cardTexts': [
        'Welcome to Numeracy (Level 2)!',
        'Let\'s learn about percentages.',
        'Ready for Level 2?'
      ],
      'readingTexts': [
        'Budgeting helps you understand where your money goes each month.',
        'Tracking your expenses is the first step to financial freedom.',
        'With a budget, you can plan for both needs and wants.',
      ],
      'dropdowns': [
        {
          'header': 'Percentages',
          'body': 'Percentages help you understand discounts and interest.'
        },
      ],
      'bulletPoints': [
        'Calculate discounts',
        'Compare prices using percentages',
      ],
    },
    // --- Default fallback ---
    'default': {
      'cardTexts': ['Welcome!', 'Let\'s learn together.', 'Start now!'],
      'readingTexts': [
        'Budgeting helps you understand where your money goes each month.',
        'Tracking your expenses is the first step to financial freedom.',
        'With a budget, you can plan for both needs and wants.',
      ],
      'dropdowns': [
        {
          'header': 'Default Info',
          'body': 'This is the default onboarding content.'
        },
      ],
      'bulletPoints': [
        'Default bullet 1',
        'Default bullet 2',
      ],
    },
  };

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final String contentKey = '${stageKey}_Level $level\_$category';
    final content =
        onboardingCardContent[contentKey] ?? onboardingCardContent['default']!;
    final List<String> cardTexts = List<String>.from(content['cardTexts']);
    final List<Map<String, String>> cardData = List.generate(
      cardTexts.length,
      (index) => {'mainText': cardTexts[index]},
    );

    return ChangeNotifierProvider(
      create: (_) => CardOnboardingProvider(),
      child: Scaffold(
        appBar: _buildAppBar(context),
        backgroundColor: Colors.white,
        body: _buildBody(context, cardData, content),
        bottomNavigationBar: const Navbar(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
    final iconSize = screenWidth * 0.1; // ~10% of screen width

    return SizedBox(
      width: iconSize,
      height: iconSize * 1.28, // Maintain aspect ratio
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: iconSize * 0.066, // ~6.6% of icon height
            child: Image.asset(
              'lib/assets/images/Rectangle 4.png',
              width: iconSize * 0.7, // 70% of icon width
              height: iconSize * 1.08, // 108% of icon height
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: iconSize * 0.005, // ~0.5% of icon height
            left: iconSize * 0.16, // ~16% of icon width
            child: Image.asset(
              'lib/assets/images/Rectangle 3.png',
              width: iconSize * 0.81, // 81% of icon width
              height: iconSize * 1.27, // 127% of icon height
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: iconSize * 0.26, // ~26% of icon height
            left: iconSize * 0.26, // ~26% of icon width
            child: Image.asset(
              'lib/assets/images/cbi_hive.png',
              width: iconSize * 0.63, // 63% of icon width
              height: iconSize * 0.63, // 63% of icon height
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, List<Map<String, String>> cardData,
      Map<String, dynamic> content) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Consumer<CardOnboardingProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              SizedBox(height: screenHeight * 0.025), // ~2.5% of screen height
              _buildPageView(
                  provider, screenHeight, cardData, content, context),
              _buildPageIndicator(provider, context, cardData),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPageView(
      CardOnboardingProvider provider,
      double screenHeight,
      List<Map<String, String>> cardData,
      Map<String, dynamic> content,
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
              content: content,
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
      padding:
          EdgeInsets.only(bottom: screenHeight * 0.05), // ~5% of screen height
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          cardData.length,
          (index) => Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.01), // ~1% of screen width
            child: Container(
              width: screenWidth * 0.09, // ~15% of screen width
              height: screenHeight * 0.01, // ~1.2% of screen height
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
    required Map<String, dynamic> content,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        if (isLastCard) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReadingScreen(
                readingTexts: List<String>.from(content['readingTexts'] ?? []),
                dropdownData:
                    List<Map<String, String>>.from(content['dropdowns']),
                bulletPoints: List<String>.from(content['bulletPoints']),
                category: category,
                level: level,
                stage:
                    int.tryParse(stageKey.replaceAll(RegExp(r'[^0-9]'), '')) ??
                        0,
                title: title,
                description: description,
                levels: levels,
                games: games,
                coins: coins,
              ),
            ),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05), // ~5% of screen width
        child: Stack(
          children: [
            _buildCardBackground(screenHeight),
            _buildCardOverlay(context),
            _buildCardContent(data, context),
          ],
        ),
      ),
    );
  }

  Widget _buildCardBackground(double screenHeight) {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(screenHeight * 0.02), // ~2% of screen height
      child: Image.asset(
        'lib/assets/images/image 5.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: screenHeight * 0.44, // ~44% of screen height
      ),
    );
  }

  Widget _buildCardOverlay(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 252, 174, 4),
          width: screenHeight * 0.005, // ~0.5% of screen height
        ),
        borderRadius:
            BorderRadius.circular(screenHeight * 0.02), // ~2% of screen height
        color: const Color(0xFFFFE975).withOpacity(0.7),
      ),
    );
  }

  Widget _buildCardContent(Map<String, String> data, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.025), // ~2.5% of screen width
        child: Text(
          data['mainText']!,
          style: TextStyle(
            fontSize: screenWidth * 0.08, // ~8% of screen width
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
