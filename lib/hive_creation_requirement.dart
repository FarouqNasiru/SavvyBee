import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvybee/identity_verification_page.dart';
import 'package:savvybee/link_account_screen.dart';
import 'package:savvybee/models/hive.dart';
import 'package:savvybee/reusable_button.dart';
import 'package:savvybee/screens/create_hive_screen.dart';
import 'package:savvybee/screens/hive/create_hive_screen.dart';
import 'package:savvybee/screens/hive/hive_creation_success_screen.dart';
import 'question_page.dart';
// import your identity verification page here
// import 'identity_verification_page.dart';

class HiveCreationRequirement extends StatefulWidget {
  const HiveCreationRequirement({super.key});

  @override
  State<HiveCreationRequirement> createState() =>
      _HiveCreationRequirementState();
}

class _HiveCreationRequirementState extends State<HiveCreationRequirement> {
  bool profileCompleted = false;
  bool identityVerified = false;
  bool isBankLinked = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCompletionStatus();
  }

  Future<void> _fetchCompletionStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      setState(() {
        profileCompleted = doc.data()?['profileCompleted'] ?? false;
        identityVerified = doc.data()?['identityVerified'] ?? false;
        isBankLinked = doc.data()?['bankAccount']?['isBankLinked'] ?? false;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final allComplete = profileCompleted && identityVerified && isBankLinked;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          width: double.infinity,
          child: Text(
            "Welcome to Hive",
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true, // This helps with centering on some platforms
      ),
      backgroundColor: Colors.white,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
              ),
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 19),
                      Image.asset(
                        'lib/assets/images/hiveflower 1.png',
                        height: 57,
                        width: 76,
                      ),
                      const SizedBox(height: 10),
                      // ... (your flower image and intro text here)
                      Text(
                        "Get Hive-Ready in 4 Simple Steps",
                        style: GoogleFonts.manrope(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Before you start saving in your Hive, let's get you set up properly. Each step unlocks the next.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildStepCard(
                        context,
                        step: 1,
                        title: "Complete Your Profile",
                        description:
                            "Help us know you better – your financial goals, habits, and vibe. It takes just a minute.",
                        completed: profileCompleted,
                        actionLabel: "Complete profile",
                        onAction: () {
                          if (!profileCompleted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const QuestionPage()),
                            ).then((_) => _fetchCompletionStatus());
                          }
                        },
                      ),
                      const SizedBox(height: 12),
                      _buildStepCard(
                        context,
                        step: 2,
                        title: "Verify Your Identity",
                        description:
                            "We protect your Hive with strong identity checks. Upload a valid ID to verify your account.",
                        completed: identityVerified,
                        actionLabel: "Verify identity",
                        onAction: () {
                          if (!identityVerified) {
                            // Replace with your actual identity verification page
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            IdentityVerificationPage()))
                                .then((_) => _fetchCompletionStatus());
                          }
                        },
                      ),

                      const SizedBox(height: 12),
                      _buildStepCard(
                        context,
                        step: 3,
                        title: "Learn How Hives Work",
                        description:
                            "Ajo. ROSCA. Hive. Learn how it all works — in a 2-minute interactive explainer.",
                        completed: identityVerified,
                        actionLabel: "Complete Tutorial",
                        onAction: () {
                          if (!identityVerified) {
                            // Replace with your actual identity verification page
                            // Navigator.push(context, MaterialPageRoute(builder: (_) => IdentityVerificationPage()))
                            //   .then((_) => _fetchCompletionStatus());
                          }
                        },
                      ),

                      const SizedBox(height: 12),
                      _buildStepCard(
                        context,
                        step: 4,
                        title: "Fund Your Wallet",
                        description:
                            "Add funds to your Savvy Bee wallet to claim your first Hive reward and start saving.",
                        completed: isBankLinked,
                        actionLabel: "Complete Profile",
                        onAction: () {
                          if (!isBankLinked) {
                            // Replace with your actual identity verification page
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => LinkAccountScreen()))
                                .then((_) async {
                              await Future.delayed(Duration(milliseconds: 500));
                              _fetchCompletionStatus();
                            });
                          }
                        },
                      ),

                      SizedBox(
                        height: 17,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  color:
                                      allComplete ? Colors.black : Colors.grey,
                                  width: 1),
                              left: BorderSide(
                                  color:
                                      allComplete ? Colors.black : Colors.grey,
                                  width: 1),
                              right: BorderSide(
                                  color:
                                      allComplete ? Colors.black : Colors.grey,
                                  width: 3),
                              bottom: BorderSide(
                                  color:
                                      allComplete ? Colors.black : Colors.grey,
                                  width: 3),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: allComplete
                                  ? Colors.yellow[700]
                                  : Colors.grey[300],
                              foregroundColor:
                                  allComplete ? Colors.black : Colors.grey[600],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 2,
                            ),
                            onPressed: allComplete
                                ? () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CreateHiveScreen(),
                                      ),
                                    );
                                  }
                                : null,
                            child: const Text(
                              "Create a Hive",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildStepCard(
    BuildContext context, {
    required int step,
    required String title,
    required String description,
    required bool completed,
    required String actionLabel,
    required VoidCallback onAction,
  }) {
    return GestureDetector(
      onTap: completed ? null : onAction, // <-- Same logic as the button
      child: Container(
        decoration: BoxDecoration(
          color: completed
              ? const Color.fromARGB(52, 255, 196, 0)
              : Colors.grey[200]!,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1.5,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row with Step and Button
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 3.0,
                      left: 12,
                      right: 12,
                      bottom: 3,
                    ),
                    child: Text(
                      "Step $step",
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: completed ? null : onAction,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (completed) return Colors.green;
                        if (states.contains(MaterialState.disabled))
                          return Colors.green;
                        return Colors.grey[300]!;
                      },
                    ),
                    foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (completed) return Colors.white;
                        if (states.contains(MaterialState.disabled))
                          return Colors.white;
                        return Colors.black;
                      },
                    ),
                    minimumSize: MaterialStateProperty.all(const Size(40, 32)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  child: Text(
                    actionLabel,
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            Text(
              title,
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                height: 1.0,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                description,
                style: GoogleFonts.manrope(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
