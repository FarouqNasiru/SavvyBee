import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../providers/auth_provider.dart';
import '../../providers/hive_provider.dart';
import 'join_hive_details_screen.dart';

class JoinHiveScreen extends StatefulWidget {
  @override
  _JoinHiveScreenState createState() => _JoinHiveScreenState();
}

class _JoinHiveScreenState extends State<JoinHiveScreen> {
  final _searchController = TextEditingController();
  final _inviteCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSuggestedHives();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _inviteCodeController.dispose();
    super.dispose();
  }

  Future<void> _loadSuggestedHives() async {
    final hiveProvider = Provider.of<HiveProvider>(context, listen: false);

    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get();
      final userData = userDoc.data() ?? {};
      final location = userData['location'] ?? '';

      await hiveProvider.fetchSuggestedHives(location, firebaseUser.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Join a Hive',
          textAlign: TextAlign.center,
          style: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Bee Illustration
            Image.asset(
              'lib/assets/images/FAMILY BEE JAR 2.png',
              height: 292,
              width: 292,
            ),

            const SizedBox(height: 15),

            Text(
              'Join a group savings circle that works just like Ajo – but smarter.',
              style: GoogleFonts.manrope(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 15),

            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: const Color.fromARGB(10, 118, 118, 128)),
                ),
                hintText: 'Search by name',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.tune),
              ),
            ),

            SizedBox(height: 15),

            // Suggested Hives
            Text(
              'Suggested Hives',
              style: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(height: 5),

            Consumer<HiveProvider>(
              builder: (context, hiveProvider, child) {
                if (hiveProvider.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (hiveProvider.suggestedHives.isEmpty) {
                  return Container(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 60,
                          color: Colors.grey[400],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No suggested hives found',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return Column(
                  children: hiveProvider.suggestedHives
                      .map(
                        (hive) => _buildSuggestedHiveCard(hive),
                      )
                      .toList(),
                );
              },
            ),

            SizedBox(height: 22),

            // OR Divider
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'OR', textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),

            SizedBox(height: 16),

            // Paste Hive Link
            TextField(
              controller: _inviteCodeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color.fromARGB(10, 118, 118, 128)),
                ),
                hintText: 'Paste Hive Link',
                prefixIcon: Icon(Icons.search),
              ),
            ),

            SizedBox(height: 52),

            // Continue Button
            Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.black, width: 1),
                  left: BorderSide(color: Colors.black, width: 1),
                  right: BorderSide(color: Colors.black, width: 3),
                  bottom: BorderSide(color: Colors.black, width: 3),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (_inviteCodeController.text.isNotEmpty) {
                    _joinWithCode();
                  }
                },
                child: Text('Continue'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.grey[600],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),

            Text(
              'By joining this Hive, you agree to: Savvy Bee\'s terms & conditions, Commitment to weekly contributions, Respecting the order and Hive rules',
              style: GoogleFonts.manrope(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestedHiveCard(hive) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Image.asset("lib/assets/images/Ellipse_bee.png",
              height: 48, width: 48),
          SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hive.name,
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '₦${hive.contributionAmount.toStringAsFixed(0)} ${hive.frequency.toString().split('.').last}',
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  '${hive.startDate.day}/${hive.startDate.month} to ${hive.endDate.day}/${hive.endDate.month}/${hive.endDate.year}',
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '@ ${hive.currentMembers} Members',
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => JoinHiveDetailsScreen(hive: hive),
                ),
              );
            },
            child: Text(
              'See details',
              style: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(
                color: Colors.black,
                width: 1,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ), 
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _joinWithCode() async {
    final hiveProvider = Provider.of<HiveProvider>(context, listen: false);

    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You must be logged in to join a hive.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final userId = firebaseUser.uid;

    // Fetch extra user info from Firestore if you need the user's name
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    final userData = userDoc.data() ?? {};

    final memberData = {
      'userId': userId,
      'userName': userData['firstName'] ?? '', // or whatever field you use
      'joinedAt': DateTime.now().toIso8601String(),
      'payoutPosition': 0,
      'hasReceived': false,
    };

    final inviteCode = _inviteCodeController.text.trim().toUpperCase();
    final success = await hiveProvider.joinHive(inviteCode, userId, memberData);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Successfully joined hive!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(hiveProvider.errorMessage ?? 'Failed to join hive'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
