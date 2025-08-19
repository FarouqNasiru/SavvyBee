import '../models/user_model.dart' as app_user;
import '../utils/secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final SecureStorage _storage = SecureStorage();
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<app_user.User?> login(String email, String password) async {
    // Simulate API call
    await Future.delayed(Duration(seconds: 1));
    
    // Demo credentials
    if (email == 'demo@example.com' && password == 'password') {
      final user = app_user.User(
        id: '1',
        fullName: 'Tunwase Ogundimu',
        email: email,
        phoneNumber: '8123456789',
        countryCode: '+234',
        isPhoneVerified: true,
        bvn: '12345678901',
        location: 'Lagos, Nigeria',
        bankName: 'Wema Bank',
        accountNumber: '1234567890',
        createdAt: DateTime.now(),
      );
      
      await _storage.storeUser(user);
      return user;
    }
    
    return null;
  }

  Future<app_user.User?> register(Map<String, dynamic> userData) async {
    // Simulate API call
    await Future.delayed(Duration(seconds: 2));
    
    final user = app_user.User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      fullName: userData['fullName'],
      email: userData['email'],
      phoneNumber: userData['phoneNumber'],
      countryCode: userData['countryCode'] ?? '+234',
      isPhoneVerified: false,
      bvn: userData['bvn'],
      location: userData['location'],
      bankName: userData['bankName'],
      accountNumber: userData['accountNumber'],
      createdAt: DateTime.now(),
    );
    
    await _storage.storeUser(user);
    return user;
  }

  Future<bool> verifyPhoneNumber(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (firebase_auth.PhoneAuthCredential credential) {
          // Auto-verification if supported
        },
        verificationFailed: (firebase_auth.FirebaseAuthException e) {
          throw Exception(e.message ?? 'Verification failed');
        },
        codeSent: (String verificationId, int? resendToken) {
          // Store verification ID for later use
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle timeout
        },
        timeout: const Duration(seconds: 60),
      );
      return true;
    } catch (e) {
      throw Exception('Phone verification failed: $e');
    }
  }

  Future<bool> verifyOTP(String verificationId, String otp) async {
    try {
      firebase_auth.PhoneAuthCredential credential = firebase_auth.PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      await _auth.signInWithCredential(credential);
      
      // Update user's phone verification status in Firestore
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        await _firestore
            .collection('users')
            .doc(currentUser.uid)
            .update({'isPhoneVerified': true});
      }
      
      return true;
    } catch (e) {
      throw Exception('Invalid verification code');
    }
  }

  Future<app_user.User?> getCurrentUser() async {
    return await _storage.getUser();
  }

  Future<void> logout() async {
    await _auth.signOut();
    await _storage.clearUser();
  }

  Future<void> updatePhoneVerificationStatus(String userId, bool isVerified) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .update({'isPhoneVerified': isVerified});
  }
}
