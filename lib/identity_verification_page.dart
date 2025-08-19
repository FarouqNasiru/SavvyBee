import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/hive_creation_requirement.dart';
import 'package:savvybee/onboarding_data_provider.dart';
import 'package:savvybee/reusable_button.dart';

class IdentityVerificationPage extends StatelessWidget {
  const IdentityVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Identity Verification'),
      ),
      body: Center(
        child: ReusableButton(text: "Verify", onPressed: () async {
            // Mark profile as completed in Firestore
                    final user = FirebaseAuth.instance.currentUser;
                    if (user != null) {
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(user.uid)
                          .set({'identityVerified': true},
                              SetOptions(merge: true));
                    }
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HiveCreationRequirement()),
                    );
        },),
      ),
    );
  }
}
Future<void> saveOnboardingDataToFirestore(BuildContext context) async {
  final onboardingData =
      Provider.of<OnboardingDataProvider>(context, listen: false);
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set(
          onboardingData.toMap(),
          SetOptions(merge: true),
        );
  }
}