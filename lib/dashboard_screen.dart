import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvybee/achievements_screen.dart';
import 'package:savvybee/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savvybee/streak_tracker.dart';


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _firstName = 'User';
  double _walletBalance = 0.0;
  int _completedQuizzes = 0;
  int _activeHives = 0;
  int _currentStreak = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Refresh data when dependencies change (e.g., when returning to this screen)
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        // Load user data from Firestore with cache disabled to get latest data
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get(const GetOptions(source: Source.server));

        if (userDoc.exists) {
          final data = userDoc.data()!;
          
          // Load streak data
          final streakResult = await StreakTracker.trackAppOpen();
          
          // Calculate coins earned from hearts (each heart = 500 coins)
          final hearts = data['hearts'] ?? 0;
          final coinsEarned = hearts * 500;
          
          // Get wallet balance - check multiple possible locations
          double walletBalance = 0.0;
          
          // Check user document for wallet balance
          if (data['walletBalance'] != null) {
            walletBalance = (data['walletBalance'] ?? 0.0).toDouble();
          }
          
          // Check for hive-specific wallet balance
          if (data['hiveWalletBalance'] != null) {
            walletBalance = (data['hiveWalletBalance'] ?? 0.0).toDouble();
          }
          
          // Check for balance field
          if (data['balance'] != null) {
            walletBalance = (data['balance'] ?? 0.0).toDouble();
          }
          
          // Count active hives where user is a member
          int activeHivesCount = 0;
          try {
            final hivesQuery = await FirebaseFirestore.instance
                .collection('hives')
                .where('memberIds', arrayContains: user.uid)
                .where('status', isEqualTo: 'active')
                .get(const GetOptions(source: Source.server));
            
            activeHivesCount = hivesQuery.docs.length;
          } catch (e) {
            print('Error loading active hives: $e');
          }
          
          setState(() {
            _firstName = data['firstName'] ?? 'User';
            _walletBalance = walletBalance;
            _completedQuizzes = hearts; // Store hearts directly
            _currentStreak = streakResult.newStreak;
            _activeHives = activeHivesCount;
            _isLoading = false;
          });
          
          print('Dashboard data loaded: Wallet: $_walletBalance, Hearts: $hearts, Coins: $coinsEarned');
        } else {
          setState(() {
            _isLoading = false;
          });
        }
      } catch (e) {
        print('Error loading user data: $e');
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Calculate total coins earned (each quiz is worth 500 points)
  int get _totalCoinsEarned => _completedQuizzes * 500;

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.yellow[700],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Navbar(),
      body: RefreshIndicator(
        onRefresh: _loadUserData,
        color: Colors.yellow[700],
        child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Yellow background header
                Container(
                  color: Colors.yellow[700],
                  height: 200,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26, vertical: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hi $_firstName 👋",
                              style: GoogleFonts.manrope(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Image.asset("lib/assets/images/bell.png"),
                          ],
                        ),
                        Text(
                          "Here's your financial overview",
                          style: GoogleFonts.manrope(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Floating card
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: -100, // half outside the yellow container
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 22, left: 23, right: 23, bottom: 22),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Wallet balance",
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "₦",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                          fontFamily: 'Arial',
                                        ),
                                      ),
                                      Text(
                                        _walletBalance.toStringAsFixed(0),
                                        style: GoogleFonts.manrope(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Coins earned",
                                    style: GoogleFonts.manrope(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _totalCoinsEarned.toString(),
                                    style: GoogleFonts.manrope(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 17),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 255, 195, 0),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    "Withdraw",
                                    style: GoogleFonts.manrope(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 174, 174, 178),
                                    ),
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    "Fund",
                                    style: GoogleFonts.manrope(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 130), // space for the floating card

            // Quick Stats
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // ensures left alignment
              children: [
                // Quick Stats
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Quick Stats",
                        style: GoogleFonts.manrope(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12), // very small gap
                      Wrap(
                        spacing: 13, // horizontal space between items
                        runSpacing: 12, // vertical space between rows
                        children: [
                          SizedBox(
                            width: (MediaQuery.of(context).size.width -
                                    26 * 2 -
                                    13) /
                                2,
                            height: 100,
                            child: buildStatCard(_activeHives.toString(), "Active Hives",
                                "lib/assets/images/active-hives.png"),
                          ),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width -
                                    26 * 2 -
                                    13) /
                                2,
                            height: 100,
                            child: buildStatCard("21000", "Total XP",
                                "lib/assets/images/total-xp.png"),
                          ),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width -
                                    26 * 2 -
                                    13) /
                                2,
                            height: 100,
                            child: buildStatCard(_currentStreak.toString(), "Day Streak",
                                "lib/assets/images/day-streak.png"),
                          ),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width -
                                    26 * 2 -
                                    13) /
                                2,
                            height: 100,
                            child: buildStatCard("24", "Friends",
                                "lib/assets/images/friends.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 29),

            // Savvy Characters
            sectionHeader("Savvy Characters", context),

            const SizedBox(height: 12),

            buildImageRow([
              "lib/assets/images/budgeting bee pose 1 4.png",
              "lib/assets/images/budgeting bee pose 1 4.png",
              "lib/assets/images/budgeting bee pose 1 4.png",
            ]),

            const SizedBox(height: 27),

            // Achievements
            sectionHeader("Achievements", context),
            const SizedBox(height: 12),

            buildImageRow([
              "lib/assets/images/budgeting bee pose 1 4.png",
              "lib/assets/images/budgeting bee pose 1 4.png",
              "lib/assets/images/budgeting bee pose 1 4.png",
            ]),

            const SizedBox(height: 30),
          ],
        ),
        ),
      ),
    );
  }

  Widget sectionHeader(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.manrope(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AchievementsScreen(),
                ),
              );
            },
            child: Text(
              'See all',
              style: GoogleFonts.manrope(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 255, 195, 0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStatCard(String value, String label, String iconpath) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 255, 195, 0),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20.0,
              right: 6,
            ),
            child: Image.asset(
              iconpath,
              width: 24,
              height: 24,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: GoogleFonts.manrope(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildImageRow(List<String> imagePaths) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Container(
        height: 151,
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 255, 195, 0),
              width: 2), // outer border
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            for (int i = 0; i < imagePaths.length; i++) ...[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Image.asset(
                    imagePaths[i],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              if (i != imagePaths.length - 1)
                Container(
                  width: 1, // slimmer inside divider
                  color: const Color.fromARGB(255, 255, 195, 0),
                ),
            ]
          ],
        ),
      ),
    );
  }
}
