import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/screens/hive/hive_details_screen.dart';
import '../../models/hive.dart';
import '../models/user.dart';
import '../widgets/hive_card.dart';
import '../widgets/quick_action_button.dart';
import '../providers/auth_provider.dart';
import '../providers/hive_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final hiveProvider = Provider.of<HiveProvider>(context, listen: false);

    if (authProvider.currentUser != null) {
      await hiveProvider.fetchUserHives(authProvider.currentUser!.id);
      await hiveProvider.fetchSuggestedHives(
          authProvider.currentUser!.location, authProvider.currentUser!.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // Black icons for Android
        statusBarBrightness: Brightness.light, // Black icons for iOS
      ),
    );
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildHomeTab(),
          _buildHivesTab(),
          _buildProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.hive), label: 'Hive'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
    );
  }

  Widget _buildHomeTab() {
    return Consumer2<AuthProvider, HiveProvider>(
      builder: (context, authProvider, hiveProvider, child) {
        final user = authProvider.currentUser;
        if (user == null) {
          return Center(child: Text('User not found'));
        }

        final walletBalance = 10000000.0; // Mock wallet balance

        return SafeArea(
          child: RefreshIndicator(
            onRefresh: _loadUserData,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding:
                  EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.orange.shade100,
                            child: Text(
                              user.fullName[0].toUpperCase(),
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome ${user.fullName.split(' ').first}!',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Your saving hive are growing stronger by day',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        icon: Icon(Icons.settings),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  // Wallet Balance Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Your Wallet Balance',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              '₦ ${_formatCurrency(walletBalance)}',
                              style: GoogleFonts.manrope(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.visibility,
                                size: 20, color: Colors.grey),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              user.bankName.isEmpty ? 'No Bank' : user.bankName,
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[600]),
                            ),
                            SizedBox(width: 8),
                            Text(
                              user.accountNumber.isEmpty
                                  ? 'Not linked'
                                  : user.accountNumber,
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[600]),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.copy, size: 16, color: Colors.grey),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Withdraw feature coming soon!')),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
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
                            SizedBox(width: 12),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Fund feature coming soon!')),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
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
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),

                  // Quick Actions
                  Text(
                    'Quick Actions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      QuickActionButton(
                        icon: Icons.add_circle_outline,
                        label: 'Create a hive',
                        onTap: () =>
                            Navigator.pushNamed(context, '/create-hive'),
                      ),
                      QuickActionButton(
                        icon: Icons.group_add,
                        label: 'Join a hive',
                        onTap: () => Navigator.pushNamed(context, '/join-hive'),
                      ),
                      QuickActionButton(
                        icon: Icons.history,
                        label: 'History',
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('History feature coming soon!')),
                          );
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  // Your Hives
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Hives',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _currentIndex = 1;
                          });
                        },
                        child: Text('See All'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Hive Cards
                  if (hiveProvider.userHives.isEmpty)
                    _buildEmptyHivesState()
                  else
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: hiveProvider.userHives.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: HiveCard(
                              hive: hiveProvider.userHives[index],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HiveDetailsScreen(
                                      hive: hiveProvider.userHives[index],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHivesTab() {
    return Consumer<HiveProvider>(
      builder: (context, hiveProvider, child) {
        return SafeArea(
          child: RefreshIndicator(
            onRefresh: _loadUserData,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
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
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: hiveProvider.userHives.length,
                      itemBuilder: (context, index) {
                        final hive = hiveProvider.userHives[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: HiveCard(
                            hive: hive,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HiveDetailsScreen(hive: hive),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfileTab() {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        final user = authProvider.currentUser;
        if (user == null) {
          return Center(child: Text('User not found'));
        }

        return SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFFFFA500),
                  child: Text(
                    user.fullName[0].toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  user.fullName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  user.email,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 30),

                // Quick stats
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatCard('Active Hives',
                        '${Provider.of<HiveProvider>(context).userHives.length}'),
                    _buildStatCard('Total Saved', '₦0'),
                    _buildStatCard('Payouts', '0'),
                  ],
                ),

                SizedBox(height: 30),

                // Action buttons
                _buildActionButton(
                  icon: Icons.person,
                  title: 'View Full Profile',
                  onTap: () => Navigator.pushNamed(context, '/profile'),
                ),
                _buildActionButton(
                  icon: Icons.settings,
                  title: 'Settings',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Settings feature coming soon!')),
                    );
                  },
                ),
                _buildActionButton(
                  icon: Icons.help,
                  title: 'Help & Support',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Help & Support feature coming soon!')),
                    );
                  },
                ),
                _buildActionButton(
                  icon: Icons.logout,
                  title: 'Logout',
                  onTap: () => _showLogoutDialog(context, authProvider),
                  isDestructive: true,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyHivesState() {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        children: [
          Icon(
            Icons.hive,
            size: 80,
            color: Colors.grey[300],
          ),
          SizedBox(height: 20),
          Text(
            'No Hives Yet',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Create your first hive or join an existing one to start saving together',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/create-hive'),
                  child: Text('Create Hive'),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pushNamed(context, '/join-hive'),
                  child: Text('Join Hive'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.orange[700],
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          icon,
          color: isDestructive ? Colors.red : Colors.grey[600],
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isDestructive ? Colors.red : null,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        tileColor: Colors.grey[50],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, AuthProvider authProvider) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await authProvider.logout();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login',
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  String _formatCurrency(double amount) {
    return amount.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }
}
