import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:savvybee/screens/home/home_screen.dart';
import '../../models/hive_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/hive_provider.dart';

class JoinHiveDetailsScreen extends StatelessWidget {
  final Hive hive;

  const JoinHiveDetailsScreen({Key? key, required this.hive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Join a Hive',
          textAlign: TextAlign.center,
          style: GoogleFonts.manrope(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 0, left: 26, right: 26, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hive Header Card
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!, width: 1),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "lib/assets/images/Ellipse_bee.png",
                    width: 48,
                    height: 48,
                  ),
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
                        Text(
                          '@ ${hive.currentMembers} Members',
                          style: GoogleFonts.manrope(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),

            SizedBox(height: 16),

            // About this Hive
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About this Hive',
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'This Hive was created by John Olu to help professionals build emergency funds together. Each member contributes ₦50,000 every week. Payouts are shared in turn until everyone receive theirs.',
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      color: Colors.black,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Contribution Details
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader('Contribution Details'),
                  SizedBox(height: 12),
                  _buildDetailItem('Contribution Frequency:',
                      hive.frequency.toString().split('.').last.toUpperCase()),
                  _buildDetailItem('Next Contribution Due:', 'June 10'),
                  _buildDetailItem('Your Payout Turn:', '5th in line'),
                  _buildDetailItem('Estimated Payout Date:', 'July 1'),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Hive Rules Summary
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader('🏛️ Hive Rules Summary'),
                  SizedBox(height: 12),
                  _buildRuleItem(
                      '📅 Contributions are due every Monday by 6PM'),
                  _buildRuleItem(
                      '⚠️ Failure to contribute on time may lead to removal'),
                  _buildRuleItem(
                      '👨‍💼 Admin approval is required to leave the Hive early'),
                  _buildRuleItem('👥 Group chat is available for members'),
                  _buildRuleItem('⏰ Late joiners may receive payout last'),
                ],
              ),
            ),

            SizedBox(height: 35),

            // Join Button
            Consumer<HiveProvider>(
              builder: (context, hiveProvider, child) {
                return Container(
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
                    onPressed: hiveProvider.isLoading
                        ? null
                        : () => _joinHive(context),
                    child: hiveProvider.isLoading
                        ? CircularProgressIndicator(color: Colors.black)
                        : Text('Join the Hive'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[700],
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 29),

            Text(
              'By joining this Hive, you agree to: Savvy Bee\'s terms & conditions, Commitment to weekly contributions, Respecting the order and Hive rules',
              style: GoogleFonts.manrope(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.manrope(
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 5,
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 6),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.manrope(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: label,
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(text: ' $value'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRuleItem(String rule) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              rule,
              style: GoogleFonts.manrope(
                fontSize: 12,
                color: Colors.black,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _joinHive(BuildContext context) async {
    final hiveProvider = Provider.of<HiveProvider>(context, listen: false);

    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You must be logged in to join a hive.')),
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

    final inviteCode = hive.inviteCode.trim().toUpperCase();

    final success = await hiveProvider.joinHive(inviteCode, userId, memberData);

    if (success && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Successfully joined ${hive.name}!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(hiveProvider.errorMessage ?? 'Failed to join hive'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
