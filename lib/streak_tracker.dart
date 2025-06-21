import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StreakUpdateResult {
  final int newStreak;
  final int pointsEarned;
  final bool isMilestoneReached;
  final int milestone;
  final List<String> activeDays;

  StreakUpdateResult({
    required this.newStreak,
    required this.pointsEarned,
    required this.isMilestoneReached,
    required this.milestone,
    required this.activeDays,
  });
}

class StreakTracker {
  static Future<StreakUpdateResult> trackAppOpen() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final currentWeek = _getWeekNumber(now);
    
    // Get stored data
    final lastOpenStr = prefs.getString('last_open_date');
    final lastOpen = lastOpenStr != null ? DateTime.parse(lastOpenStr) : null;
    final lastWeek = prefs.getInt('last_week_number');
    final currentStreak = prefs.getInt('current_streak') ?? 0;
    var activeDays = prefs.getStringList('active_days') ?? [];
    
    bool isNewDay = false;
    bool isNewWeek = false;
    bool isMilestoneReached = false;
    int milestone = 0;
    int newStreak = currentStreak;
    int pointsEarned = 0;
    
    // Check if week changed
    if (lastWeek != currentWeek) {
      isNewWeek = true;
      activeDays = [];
    }
    
    // Check if this is first open today
    if (lastOpen == null || !_isSameDay(lastOpen, today)) {
      isNewDay = true;
      
      // Calculate new streak
      newStreak = 1; // Default for first time or broken streak
      if (lastOpen != null) {
        final difference = today.difference(lastOpen).inDays;
        newStreak = difference == 1 ? currentStreak + 1 : 1;
      }
      
      // Calculate points (10 base + 2 per consecutive day)
      pointsEarned = 10 + (newStreak * 2);
      
      // Check for milestones (3, 7, 14, 30 days)
      if ([3, 7, 14, 30].contains(newStreak)) {
        isMilestoneReached = true;
        milestone = newStreak;
      }
      
      // Update active days for the week
      final dayName = DateFormat('E').format(today); // Gets 'Mon', 'Tue', etc.
      if (!activeDays.contains(dayName)) {
        activeDays = [...activeDays, dayName];
      }
      
      // Save to local storage
      await prefs.setString('last_open_date', today.toString());
      await prefs.setInt('current_streak', newStreak);
      await prefs.setStringList('active_days', activeDays);
      await prefs.setInt('last_week_number', currentWeek);
      
      // Sync with Firebase
      await _updateFirebaseStreak(newStreak, pointsEarned, activeDays);
    }
    
    return StreakUpdateResult(
      newStreak: newStreak,
      pointsEarned: pointsEarned,
      isMilestoneReached: isMilestoneReached,
      milestone: milestone,
      activeDays: activeDays,
    );
  }

  static Future<void> _updateFirebaseStreak(
    int streak, 
    int points, 
    List<String> activeDays,
  ) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;
      
      final userDoc = FirebaseFirestore.instance.collection('users').doc(user.uid);
      
      await userDoc.set({
        'streak_data': {
          'current_streak': streak,
          'last_open_date': DateTime.now(),
          'active_days': activeDays,
        },
        'points': FieldValue.increment(points),
      }, SetOptions(merge: true));
    } catch (e) {
      print('Error updating Firebase streak: $e');
    }
  }

  static Future<int> getCurrentStreak() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('current_streak') ?? 0;
  }

  static Future<List<String>> getActiveDays() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('active_days') ?? [];
  }

  static Future<int> getTotalDays() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('total_days') ?? 0;
  }

  static Future<DateTime?> getLastOpenDate() async {
    final prefs = await SharedPreferences.getInstance();
    final dateStr = prefs.getString('last_open_date');
    return dateStr != null ? DateTime.tryParse(dateStr) : null;
  }

  // Helper methods
  static bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
  
  static int _getWeekNumber(DateTime date) {
    final firstDay = DateTime(date.year, 1, 1);
    final daysDiff = date.difference(firstDay).inDays;
    return (daysDiff / 7).floor();
  }
}