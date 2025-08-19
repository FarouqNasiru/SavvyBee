import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/hive_model.dart';
import '../../utils/currency_formatter.dart';

class HiveDetailsScreen extends StatelessWidget {
  final Hive hive;

  const HiveDetailsScreen({Key? key, required this.hive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 250, 250),
        title: Text(
          hive.name,
          textAlign: TextAlign.center, style: GoogleFonts.manrope(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Banner
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10),
              color: const Color.fromARGB(255, 255, 243, 204),
              child: Text(
                'Active: From May 2025 to August 1st, 2025',
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                top: 17,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Payout Position
                  Text(
                    'You are No.5 in the payout order',
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 17),

                  // Main Stats Section
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 6.0,
                      right: 6.0,
                    ),
                    child: Container(
                      height: 258,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: const Border(
                          top: BorderSide(
                              color: Color.fromARGB(73, 118, 118, 128),
                              width: 1),
                          left: BorderSide(
                              color: Color.fromARGB(73, 118, 118, 128),
                              width: 1),
                          right: BorderSide(
                              color: Color.fromARGB(73, 118, 118, 128),
                              width: 3),
                          bottom: BorderSide(
                              color: Color.fromARGB(73, 118, 118, 128),
                              width: 3),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 23.0,
                          bottom: 9.0,
                          left: 31.0,
                          right: 0.0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 3.0,
                                        bottom: 3.0,
                                        left: 7,
                                        right: 7,
                                      ),
                                      child: Text(
                                        'Next Pay In: May 10th',
                                        style: GoogleFonts.manrope(
                                          fontSize: 10,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Row(
                                    children: [
                                      Text(
                                        '₦',
                                        style: GoogleFonts.manrope(
                                          fontSize:
                                              14, // Reduced size for the Naira symbol
                                          fontWeight: FontWeight.w400,
                                          height: 1.0,
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '50,000',
                                        style: GoogleFonts.manrope(
                                          fontSize: 36,
                                          fontWeight: FontWeight.w600,
                                          height: 1.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Weekly Contribution',
                                    style: GoogleFonts.manrope(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w400,
                                      height: 1.0,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '10',
                                    style: GoogleFonts.manrope(
                                      fontSize: 36,
                                      fontWeight: FontWeight.w500,
                                      height: 1.0,
                                    ),
                                  ),
                                  Text(
                                    'Members',
                                    style: GoogleFonts.manrope(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                      height: 1.0,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        '₦',
                                        style: GoogleFonts.manrope(
                                          fontSize:
                                              14, // Reduced size for the Naira symbol
                                          fontWeight: FontWeight.w400,
                                          height: 1.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        '200,000',
                                        style: GoogleFonts.manrope(
                                          fontSize: 36,
                                          fontWeight: FontWeight.w600,
                                          height: 1.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Total money you have contributed',
                                    style: GoogleFonts.manrope(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                      height: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Bee Character
                            Container(
                              width: 140,
                              height: 190,
                              child: Image.asset(
                                'lib/assets/images/quiz bee CLOSET TEE 1.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 12),

                  // Auto-debit Notice
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.info, color: Colors.black, size: 20),
                      SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          'Your Weekly contributions are auto-debited', textAlign: TextAlign.center,
                          style: GoogleFonts.manrope(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12),

                  // Recipients Schedule
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recipients Schedule',
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See All',
                          style: GoogleFonts.manrope(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.orange,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12),

                  // Recipients List
                  ...hive.members
                      .take(3)
                      .map((member) => _buildRecipientItem(
                            member.userName,
                            'May 15th, 2025 • 12:00PM',
                            member.hasReceived
                                ? 'Paid'
                                : 'No.${member.payoutPosition}',
                            member.hasReceived,
                          ))
                      .toList(),

                  SizedBox(height: 12),

                  // Payment Activity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Payment Activity',
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See All',
                          style: GoogleFonts.manrope(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.orange,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12),

                  // Payment Activity List
                  ...hive.members
                      .take(3)
                      .map((member) => _buildPaymentActivityItem(
                            member.userName,
                            'May 15th, 2025 • 12:00PM',
                            member.hasReceived ? 'Paid' : 'Next',
                          ))
                      .toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipientItem(
      String name, String date, String status, bool isPaid) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: const Border(
          top: BorderSide(color: Color.fromARGB(73, 118, 118, 128), width: 1),
          left: BorderSide(color: Color.fromARGB(73, 118, 118, 128), width: 1),
          right: BorderSide(color: Color.fromARGB(73, 118, 118, 128), width: 3),
          bottom:
              BorderSide(color: Color.fromARGB(73, 118, 118, 128), width: 3),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey[200],
              child: Text(
                name[0].toUpperCase(),
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    date,
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: isPaid ? Colors.green[100] : Colors.orange[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                status,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isPaid ? Colors.green[800] : Colors.orange[800],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentActivityItem(String name, String date, String status) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: const Border(
          top: BorderSide(color: Color.fromARGB(73, 118, 118, 128), width: 1),
          left: BorderSide(color: Color.fromARGB(73, 118, 118, 128), width: 1),
          right: BorderSide(color: Color.fromARGB(73, 118, 118, 128), width: 3),
          bottom:
              BorderSide(color: Color.fromARGB(73, 118, 118, 128), width: 3),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey[200],
              child: Text(
                name[0].toUpperCase(),
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[700],
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    date,
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color:
                    status == 'Paid' ? Colors.green[100] : Colors.orange[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                status,
                style: GoogleFonts.manrope(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color:
                      status == 'Paid' ? Colors.green[800] : Colors.orange[800],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
