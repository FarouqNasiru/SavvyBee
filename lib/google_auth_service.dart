import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<UserCredential?> signInWithGoogle(BuildContext context) async {
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      // User cancelled the sign-in
      return null;
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in with Google
    final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    
    // Check if this is a new user (registration) or existing user (sign-in)
    final isNewUser = userCredential.additionalUserInfo?.isNewUser ?? false;
    
    if (isNewUser) {
      // This is a new user registration - create user data in Firestore
      await _createUserData(userCredential.user!, googleUser);
    }
    
    return userCredential;
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Google authentication failed: $e')),
    );
    return null;
  }
}

Future<void> _createUserData(User user, GoogleSignInAccount googleUser) async {
  try {
    // Extract first name from display name
    String firstName = 'User';
    if (googleUser.displayName != null && googleUser.displayName!.isNotEmpty) {
      firstName = googleUser.displayName!.split(' ').first;
    }
    
    // Create user document in Firestore
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'firstName': firstName,
      'email': user.email,
      'createdAt': FieldValue.serverTimestamp(),
      'points': 0, // Default points
      'hearts': 0,   // Default hearts
      'authProvider': 'google', // Track that this user signed up with Google
    });
  } catch (e) {
    print('Error creating user data: $e');
    // Don't throw here as the user is already authenticated
  }
}
