import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/hive_creation_requirement.dart';
import 'package:savvybee/home_page.dart';
import 'package:savvybee/models/hive_model.dart';
import 'package:savvybee/navbar.dart';
import 'package:savvybee/screens/create_hive_screen.dart';
import 'package:savvybee/screens/fund_account_screen.dart';
import 'package:savvybee/withdraw_screen.dart';
import '../../providers/auth_provider.dart';
import '../../providers/hive_provider.dart';
import '../../providers/wallet_provider.dart';
import '../hive/create_hive_screen.dart';
import '../hive/join_hive_screen.dart';
import '../hive/hive_details_screen.dart';
import '../profile/profile_screen.dart';
import '../../widgets/hive_card.dart';
import '../../utils/currency_formatter.dart';
import '../../utils/naira_symbol_widget.dart';
import 'package:savvybee/onboarding_data_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Helper function to convert HiveFrequency to string
String frequencyToString(HiveFrequency freq) {
  switch (freq) {
    case HiveFrequency.weekly:
      return 'Weekly';
    case HiveFrequency.monthly:
      return 'Monthly';
    // Add more cases if needed
    default:
      return freq.toString().split('.').last;
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  String? _firstName;
  String? _bankName;
  String? _accountNumber;

  @override
  void initState() {
    super.initState();
    _loadUserHives();
    _fetchFirstName();
    _fetchBankDetails();
    _loadWalletBalance();
  }

  Future<void> _loadUserHives() async {
    final hiveProvider = Provider.of<HiveProvider>(context, listen: false);
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Fetch user document from Firestore to get extra info like location
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      final location = doc.data()?['location'] ?? '';

      await hiveProvider.fetchUserHives(user.uid);
      await hiveProvider.fetchSuggestedHives(location, user.uid);
    }
  }

  Future<void> _fetchFirstName() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      setState(() {
        _firstName = doc.data()?['firstName'] ?? '';
      });
    }
  }

  Future<void> _fetchBankDetails() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      final bankAccount = doc.data()?['bankAccount'];
      setState(() {
        _bankName = bankAccount?['bankName'] ?? '';
        _accountNumber = bankAccount?['accountNumber'] ?? '';
      });
    }
  }

  Future<bool> _hasCompletedHiveRequirements() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      final data = doc.data() ?? {};
      final profileCompleted = data['profileCompleted'] ?? false;
      final identityVerified = data['identityVerified'] ?? false;
      final isBankLinked = data['bankAccount']?['isBankLinked'] ?? false;
      return profileCompleted && identityVerified && isBankLinked;
    }
    return false;
  }

  Future<void> _loadWalletBalance() async {
    final walletProvider = Provider.of<WalletProvider>(context, listen: false);
    await walletProvider.loadWalletBalance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildHomeTab(),
          _buildHivesTab(),
          _buildProfileTab(),
        ],
      ),
      bottomNavigationBar: Navbar(),
    );
  }

  Widget _buildHomeTab() {
    return Consumer<HiveProvider>(
      builder: (context, hiveProvider, child) {
        return RefreshIndicator(
          onRefresh: _loadUserHives,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Container(
                  padding: EdgeInsets.fromLTRB(20, 50, 20, 12),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.orange[100],
                        child: Text(
                          (_firstName != null && _firstName!.isNotEmpty)
                              ? _firstName![0].toUpperCase()
                              : '',
                          style: TextStyle(
                            color: Colors.orange[800],
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                      Image.asset(
                        "lib/assets/images/bi_gear.png",
                        height: 23.998,
                        width: 23.998,
                      ),
                    ],
                  ),
                ),

                // Welcome Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome ${_firstName ?? ''}',
                        style: GoogleFonts.manrope(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Your saving hive are growing stronger by day.',
                        style: GoogleFonts.manrope(
                          fontSize: 12,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 12),

                // Wallet Balance Card
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 5.0,
                                bottom: 5.0,
                                left: 10,
                                right: 10,
                              ),
                              child: Text(
                                'Your Wallet Balance',
                                style: GoogleFonts.manrope(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Consumer<WalletProvider>(
                            builder: (context, walletProvider, child) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  NairaSymbolWidget(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(width: 4),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      
                                      Text(
                                        walletProvider.formatCurrency(
                                            walletProvider.walletBalance).replaceFirst('₦', ''),
                                        style: GoogleFonts.manrope(
                                          fontSize: 36,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 8),
                                  Image.asset(
                                    "lib/assets/images/solar_eye-linear.png",
                                    height: 24,
                                    width: 24,
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 239, 181),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 5.0,
                                        bottom: 5.0,
                                        left: 10,
                                      ),
                                      child: Text(
                                        '${_bankName ?? 'Bank'}: ${_accountNumber ?? 'Account'}',
                                        style: GoogleFonts.manrope(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Icon(Icons.copy,
                                          size: 16, color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (_) => WithdrawScreen()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10.0,
                                      bottom: 10.0,
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: Text(
                                      'Withdraw',
                                      style: GoogleFonts.manrope(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (_) => FundAccountScreen()),
                                    );
                                  },
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    foregroundColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    side: BorderSide(color: Colors.black),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10.0,
                                      bottom: 10.0,
                                      left: 20,
                                      right: 20,
                                    ),
                                    child: Text(
                                      'Fund',
                                      style: GoogleFonts.manrope(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -32,
                      left: 2,
                      child: Image.asset(
                        'lib/assets/images/half-hive.png',
                        width: 135.75, // adjust as needed
                        height: 150,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16),

                // Quick Actions
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quick Actions',
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildQuickActionButton(
                            'Create a hive',
                            'lib/assets/images/solar_user-plus-linear.png',
                            () async {
                              final completed =
                                  await _hasCompletedHiveRequirements();
                              if (completed) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => CreateHiveScreen()),
                                );
                              } else {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          HiveCreationRequirement()),
                                );
                              }
                            },
                          ),
                          _buildQuickActionButton(
                            'Join a hive',
                            'lib/assets/images/ph_users-four-light.png',
                            () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => JoinHiveScreen()),
                              );
                            },
                          ),
                          _buildQuickActionButton(
                            'History',
                            'lib/assets/images/cil_transfer.png',
                            () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24),

                Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                ),

                SizedBox(height: 16),

                // Your Hives Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Your Hives',
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                SizedBox(height: 16),

                // Hives List
                if (hiveProvider.userHives.isEmpty)
                  _buildEmptyHivesState()
                else
                  Container(
                    height: 152,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      itemCount: hiveProvider.userHives.length,
                      itemBuilder: (context, index) {
                        final hive = hiveProvider.userHives[index];
                        return Container(
                          width: 262, // Increased width from 160 to 200
                          margin: EdgeInsets.only(right: 16),
                          child: _buildHiveCard(hive),
                        );
                      },
                    ),
                  ),

                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildQuickActionButton(
      String title, String imageAssetPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 2.0,
                color: const Color.fromARGB(255, 255, 195, 0),
              ),
            ),
            child: Image.asset(
              imageAssetPath,
              width: 40,
              height: 40,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildHiveCard(hive) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => HiveDetailsScreen(hive: hive),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ...existing code...
            Row(
              children: [
                Image.asset(
                  "lib/assets/images/Frame 278.png",
                  width: 36,
                  height: 36,
                ),
                Spacer(),
                // Member avatars (overlapping)
                SizedBox(
  width: 48, // Adjust width to fit your design
  height: 20, // Adjust height to fit your design
  child: Stack(
    children: List.generate(
      (hive.members.length > 3 ? 3 : hive.members.length),
      (index) => Positioned(
        left: index * 14.0, // Adjust this value for more/less overlap
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: index % 2 == 0 ? Colors.grey[300] : const Color(0xFFFFE975), // alternate
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              hive.members[index].userName[0].toUpperCase(),
              style: GoogleFonts.manrope(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ),
  ),
),
              ],
            ),

            SizedBox(
              height: 8,
            ),
            RichText(
              text: TextSpan(
                style: GoogleFonts.manrope(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  height: 1.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: '₦',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                      fontFamily: 'Inter',
                      fontFamilyFallback: ['Roboto', 'Arial', 'sans-serif'],
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: CurrencyFormatter.format(hive.contributionAmount).replaceFirst('₦', ''),
                  ),
                ],
              ),
            ),
            Text(
              hive.name,
              style: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                height: 1.0,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      frequencyToString(hive.frequency) + ' Contributions',
                      style: GoogleFonts.manrope(
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Next Payout: June 1st',
                      style: GoogleFonts.manrope(
                        fontSize: 8,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.yellow[100],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyHivesState() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(40),
      child: Column(
        children: [
          Icon(
            Icons.savings_outlined,
            size: 60,
            color: Colors.grey[400],
          ),
          SizedBox(height: 16),
          Text(
            'No Hives Yet',
            style: GoogleFonts.manrope(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Create your first hive to start saving',
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHivesTab() {
    return Consumer<HiveProvider>(
      builder: (context, hiveProvider, child) {
        return RefreshIndicator(
          onRefresh: _loadUserHives,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Text(
                  'My Hives',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                if (hiveProvider.userHives.isEmpty)
                  _buildEmptyHivesState()
                else
                  ...hiveProvider.userHives.map(
                    (hive) => Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: HiveCard(
                        hive: hive,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => HiveDetailsScreen(hive: hive),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfileTab() {
    return ProfileScreen();
  }
}
