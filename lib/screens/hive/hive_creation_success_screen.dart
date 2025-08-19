import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/hive_model.dart';
import '../home/home_screen.dart';

class HiveCreationSuccessScreen extends StatelessWidget {
  final Hive hive;

  const HiveCreationSuccessScreen({Key? key, required this.hive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 40),

              // Success Header
              Image.asset(
                "lib/assets/images/Your Hive is Created!.png",
              ),

              SizedBox(height: 24),

              Text(
                'The Hive is ready but it won\'t work without your people. Invite friends, family or your community to start saving together. The more, the better.',
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),

              // Bee Illustration
              Stack(children: [
                Image.asset(
                  'lib/assets/images/big-hive.png',
                  width: 221,
                  height: 221,
                ),
                Positioned(
                  top: 12.89,
                  left: 29.64,
                  child: Image.asset(
                    'lib/assets/images/bee_with_letter.png',
                    width: 225.51,
                    height: 225.51,
                  ),
                ),
              ]),

              SizedBox(height: 7),

              Text(
                'No one\'s buzzed in yet. Let\'s fix that.',
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(height: 21),

              // Hive Details Card
              Container(
                height: 60,
                width: 350,
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 243, 204),
                  borderRadius: BorderRadius.circular(6),
                  border: Border(
                    top: BorderSide(color: Colors.black, width: 1),
                    left: BorderSide(color: Colors.black, width: 1),
                    right: BorderSide(color: Colors.black, width: 1),
                    bottom: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "lib/assets/images/Frame 217.png",
                      width: 48,
                      height: 48,
                    ), // Replace with actual asset path

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hive.name,
                            style: GoogleFonts.manrope(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              height: 1.0,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '₦${hive.contributionAmount.toStringAsFixed(0)} ${hive.frequency.toString().split('.').last}',
                                style: GoogleFonts.manrope(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w400,
                                  height: 1.0,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                hive.frequency
                                    .toString()
                                    .split('.')
                                    .last
                                    .toUpperCase(),
                                style: GoogleFonts.manrope(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 1.0,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                '1 of ${hive.maxMembers}',
                                style: GoogleFonts.manrope(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w400,
                                  height: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12),

              // Invite Options
              _buildInviteOption(
                icon: Icons.contacts,
                title: 'Invite from Contacts',
                subtitle: 'Select from your phonebook',
                onTap: () {
                  // TODO: Implement contact invitation
                },
              ),

              SizedBox(height: 12),

              _buildInviteOption(
                icon: Icons.link,
                title: 'Copy Invite Link',
                subtitle:
                    'savvybee.app/invite/${hive.inviteCode}', // <-- show actual code
                onTap: () {
                  Clipboard.setData(ClipboardData(
                      text: 'savvybee.app/invite/${hive.inviteCode}'));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invite link copied!')),
                  );
                },
              ),

              SizedBox(height: 12),

              _buildInviteOption(
                icon: Icons.email,
                title: 'Add by Email or Phone',
                subtitle: 'Select from your phonebook',
                onTap: () {
                  // TODO: Implement email/phone invitation
                },
              ),

              Spacer(),

              // Go to Dashboard Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => HomeScreen()),
                      (route) => false,
                    );
                  },
                  child: Text('Go to Dashboard'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInviteOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 350,
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 243, 204),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.grey[700]),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}
