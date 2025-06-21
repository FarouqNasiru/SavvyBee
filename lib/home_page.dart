import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/budgeting_page.dart';
import 'package:savvybee/navbar.dart';
import 'package:savvybee/reusable_button.dart';
import 'package:savvybee/savvybot_1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savvybee/streak_tracker.dart';
import 'progress_provider.dart';

class CardContentProvider with ChangeNotifier {
  String _content =
      'Introduction to Budgeting\nLearn how a budget helps you manage income, control expenses, and plan for financial goals.';
  String get content => _content;
  String _selectedCard = 'Budgeting';

  void updateContent(String newContent, String cardTitle) {
    _content = newContent;
    _selectedCard = cardTitle;
    notifyListeners();
  }

  String get selectedCard => _selectedCard;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _firstName = 'User'; // Simplified to just first name
  int _points = 0;
  int _hearts = 0;
  int _currentStreak = 0;
  List<bool> _activeDays = List.filled(7, false);

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _initializeStreak();
    // Load progress when the app starts
    Future.microtask(() => context.read<ProgressProvider>().loadProgress());
  }

  Future<void> _loadUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        setState(() {
          _firstName = userDoc.data()?['firstName'] ?? 'User';
          _points = userDoc.data()?['points'] ?? 120;
          _hearts = userDoc.data()?['hearts'] ?? 0;
        });
      }
    }
  }

   Future<void> _initializeStreak() async {
    final result = await StreakTracker.trackAppOpen();
    final activeDayNames = await StreakTracker.getActiveDays();
    
    if (mounted) {
      setState(() {
        _currentStreak = result.newStreak;
        _updateActiveDays(activeDayNames);
        _points += result.pointsEarned; // Add points from streak
        
        if (result.isMilestoneReached) {
          _showMilestoneCelebration(result.milestone);
        }
      });
    }
  }
  void _updateActiveDays(List<String> activeDayNames) {
    final dayMap = {
      'Mon': 0, 'Tue': 1, 'Wed': 2, 
      'Thu': 3, 'Fri': 4, 'Sat': 5, 'Sun': 6
    };
    
    setState(() {
      _activeDays = List.filled(7, false);
      for (final dayName in activeDayNames) {
        final index = dayMap[dayName];
        if (index != null) _activeDays[index] = true;
      }
    });
  }

 void _showMilestoneCelebration(int milestone) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('🎉 $milestone Day Streak!'),
        content: Text('You\'ve maintained a $milestone day streak! Keep it up!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // User points display
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.06,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
              bottom: screenHeight * 0.02,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hey $_firstName',
                  style: GoogleFonts.manrope(
                    fontSize: screenHeight * 0.02,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: screenWidth * 0.01),
                const Text(
                  '🐝',
                  style: TextStyle(fontSize: 16),
                ),
                const Spacer(),
                Row(
                  children: [
                    Image.asset(
                      'lib/assets/images/fire.png',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: screenWidth * 0.005),
                    Text(
                      '$_currentStreak',
                      style: TextStyle(fontSize: screenHeight * 0.02),
                    ),
                  ],
                ),
                SizedBox(width: screenWidth * 0.03),
                Row(
                  children: [
                    Image.asset(
                      'lib/assets/images/mage_health-square-fill.png',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: screenWidth * 0.005),
                    Text(
                      '$_hearts',
                      style: TextStyle(fontSize: screenHeight * 0.02),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
          // Week navigation
          LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildDayCircle('Mon', 0, screenHeight),
                    buildDayCircle('Tue', 1, screenHeight),
                    buildDayCircle('Wed', 2, screenHeight),
                    buildDayCircle('Thu', 3, screenHeight),
                    buildDayCircle('Fri', 4, screenHeight),
                    buildDayCircle('Sat', 5, screenHeight),
                    buildDayCircle('Sun', 6, screenHeight),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: screenHeight * 0.03),

          // Interactive Cards
          Consumer<CardContentProvider>(
            builder: (context, provider, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCard(
                      context,
                      provider,
                      'Budgeting',
                      'Introduction to Budgeting\nLearn how a budget helps you manage income, control expenses, and plan for financial goals.',
                      screenHeight,
                      screenWidth),
                  SizedBox(width: screenWidth * 0.03),
                  _buildCard(
                      context,
                      provider,
                      'Savings',
                      'Introduction to Savings\nLearn how to save money effectively and plan for future expenses.',
                      screenHeight,
                      screenWidth),
                  SizedBox(width: screenWidth * 0.03),
                  _buildCard(
                      context,
                      provider,
                      'Numeracy',
                      'Introduction to Numeracy\nImprove your numerical skills to better manage your finances.',
                      screenHeight,
                      screenWidth),
                ],
              );
            },
          ),

          // Display content based on selected card
          Consumer<CardContentProvider>(
            builder: (context, provider, child) {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.03,
                ),
                decoration: BoxDecoration(
                  border: const Border(
                    top: BorderSide(color: Colors.black, width: 2),
                    left: BorderSide(color: Colors.black, width: 2),
                    right: BorderSide(color: Colors.black, width: 4),
                    bottom: BorderSide(color: Colors.black, width: 4),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                        horizontal: screenWidth * 0.05,
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: screenHeight * 0.02,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: provider.selectedCard == 'Budgeting'
                                  ? 'Introduction to Budgeting\n'
                                  : provider.selectedCard == 'Savings'
                                      ? 'Introduction to Savings\n'
                                      : 'Introduction to Numeracy\n',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: screenHeight * 0.02,
                              ),
                            ),
                            TextSpan(
                              text: provider.content.split('\n').length > 1
                                  ? provider.content
                                      .split('\n')
                                      .sublist(1)
                                      .join('\n')
                                  : provider.content,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: screenHeight * 0.015,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // Image
                    Image.asset(
                      'lib/assets/images/budgeting bee pose 3 1 (1).png',
                      width: screenWidth * 1.0,
                      height: screenHeight * 0.30,
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // Button with padding
                    Padding(
                      padding: EdgeInsets.all(screenHeight * 0.01),
                      child: ReusableButton(
                        text: "Get started",
                        onPressed: () {
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

                          final cardDescription =
                              cardData[provider.selectedCard]?['description'] ??
                                  '';

                          // Get the data for the selected card
                          final selectedData = cardData[provider.selectedCard];

                          // Navigate to the next page and pass the data
                          if (selectedData != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BudgetingPage(
                                  category: selectedData['category'],
                                  title: selectedData['title'],
                                  description:
                                      cardDescription, // <-- Always use cardData description
                                  levels: selectedData['levels'],
                                  games: selectedData['games'],
                                  coins: selectedData['coins'],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(
            side: BorderSide(width: 2, color: Color(0xFFDF7600))),
        onPressed: () {
          // Add your action here
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Savvybot1(),
            ),
          );
        },
        backgroundColor: const Color(0xFFFFE975),
        child: Image.asset(
            "lib/assets/images/material-symbols_hive-rounded2.png",
            width: 24,
            height: 24),
      ),
      bottomNavigationBar: Navbar(),
    );
  }

  Widget buildDayCircle(String day, int dayIndex, double screenHeight) {
    return Column(
      children: [
        CircleAvatar(
          radius: screenHeight * 0.028,
          backgroundColor: _activeDays[dayIndex] ? Color(0xFFFFE975) : Color(0xFFD9D9D9),
          child: Image.asset(
            'lib/assets/images/small-hive.png',
            width: screenHeight * 0.028,
            height: screenHeight * 0.028,
          ),
        ),
        SizedBox(height: screenHeight * 0.005),
        Text(
          day,
          style: TextStyle(fontSize: screenHeight * 0.015),
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context, CardContentProvider provider,
      String title, String content, double screenHeight, double screenWidth) {
    final bool isSelected = provider.selectedCard == title;

    // Map the title to the corresponding image
    final String imagePath = title == 'Numeracy'
        ? 'lib/assets/images/mynaui_math-square.png'
        : title == 'Savings'
            ? 'lib/assets/images/solar_wallet-outline.png'
            : 'lib/assets/images/solar_calculator-linear.png';

    return GestureDetector(
      onTap: () {
        provider.updateContent(content, title);
      },
      child: Container(
        width: screenWidth * 0.25,
        height: screenHeight * 0.085,
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  colors: [
                    Color(0xFFFFF4C2),
                    Color(0xFFFFE98A),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : null,
          color: isSelected ? null : Colors.white,
          border: Border(
            top: BorderSide(
                color: isSelected ? Colors.black : Colors.grey, width: 1),
            left: BorderSide(
                color: isSelected ? Colors.black : Colors.grey, width: 1),
            right: BorderSide(
                color: isSelected ? Colors.black : Colors.grey, width: 3),
            bottom: BorderSide(
                color: isSelected ? Colors.black : Colors.grey, width: 3),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image
            Image.asset(
              imagePath,
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
            SizedBox(height: screenHeight * 0.01),
            // Text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * 0.015,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
