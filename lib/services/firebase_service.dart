import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();
  factory FirebaseService() => _instance;
  FirebaseService._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // User Management
  Future<void> updateUserRewards(String userId, int coinsEarned, int xpEarned) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'points': FieldValue.increment(xpEarned),
        'coins': FieldValue.increment(coinsEarned),
        'lastUpdated': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to update user rewards: $e');
    }
  }

  Future<void> incrementHearts(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'hearts': FieldValue.increment(1),
        'lastUpdated': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to increment hearts: $e');
    }
  }

  Future<Map<String, dynamic>?> getUserData(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();
      return doc.data();
    } catch (e) {
      throw Exception('Failed to get user data: $e');
    }
  }

  // Quiz Progress
  Future<void> updateQuizProgress(String userId, Map<String, dynamic> progressData) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'unlockedStages': progressData['unlockedStages'],
        'completedLevel': progressData['completedLevel'],
        'completedStage': progressData['completedStage'],
        'lastUpdated': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to update quiz progress: $e');
    }
  }

  // Streak Management
  Future<void> updateStreakData(String userId, Map<String, dynamic> streakData) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'streak_data': streakData,
        'lastUpdated': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to update streak data: $e');
    }
  }

  // Error handling and retry logic
  Future<T> _retryOperation<T>(Future<T> Function() operation, {int maxRetries = 3}) async {
    int attempts = 0;
    while (attempts < maxRetries) {
      try {
        return await operation();
      } catch (e) {
        attempts++;
        if (attempts >= maxRetries) {
          throw e;
        }
        // Exponential backoff
        await Future.delayed(Duration(seconds: attempts * 2));
      }
    }
    throw Exception('Operation failed after $maxRetries attempts');
  }
}
