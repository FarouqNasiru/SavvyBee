import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProgressProvider extends ChangeNotifier {
  // category -> level -> List<String> (stageKeys)
  Map<String, Map<int, List<String>>> _unlockedStages = {};

  // NEW: Track completed level/stage per category
  Map<String, int> _completedLevel = {};
  Map<String, int> _completedStage = {};

  /// Loads the user's unlocked stages from Firestore.
  Future<void> loadProgress() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    if (doc.exists) {
      final data = doc.data() ?? {};
      final unlockedStagesData = data['unlockedStages'] as Map<String, dynamic>? ?? {};
      _unlockedStages = unlockedStagesData.map((cat, val) {
        final levelMap = (val as Map<String, dynamic>).map((levelStr, stages) {
          return MapEntry(
            int.parse(levelStr),
            List<String>.from(stages as List),
          );
        });
        return MapEntry(cat, levelMap);
      });

      // Load completedLevel/completedStage per category if present
      final completedLevelData = data['completedLevel'] as Map<String, dynamic>? ?? {};
      final completedStageData = data['completedStage'] as Map<String, dynamic>? ?? {};
      _completedLevel = completedLevelData.map((cat, val) => MapEntry(cat, val as int));
      _completedStage = completedStageData.map((cat, val) => MapEntry(cat, val as int));

      notifyListeners();
    }
  }

  /// Returns the list of unlocked stageKeys for a category and level.
  List<String> unlockedStagesFor(String category, int level) {
    return _unlockedStages[category]?[level] ?? ['Stage 1']; // Default: Stage 1 unlocked
  }

  int getCompletedLevel(String category) => _completedLevel[category] ?? 0;
  int getCompletedStage(String category) => _completedStage[category] ?? 0;

  /// Unlock a specific stage for a category and level.
  Future<void> unlockStage(String category, int level, String stageKey) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    _unlockedStages.putIfAbsent(category, () => {});
    _unlockedStages[category]!.putIfAbsent(level, () => ['Stage 1']);
    if (!_unlockedStages[category]![level]!.contains(stageKey)) {
      _unlockedStages[category]![level]!.add(stageKey);
      // Optionally update completedStage
      _completedLevel[category] = level;
      _completedStage[category] = _unlockedStages[category]![level]!.length - 1;
      notifyListeners();
      await _saveProgress(user.uid);
    }
  }

  /// Unlock the first stage of the next level.
  Future<void> unlockNextLevel(String category, int nextLevel, String firstStageKey) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    _unlockedStages.putIfAbsent(category, () => {});
    _unlockedStages[category]![nextLevel] = [firstStageKey];
    // Optionally update completedLevel
    _completedLevel[category] = nextLevel;
    _completedStage[category] = 0;
    notifyListeners();
    await _saveProgress(user.uid);
  }

  /// Call this after a quiz is completed.
  /// If there is a next stage, unlock it. If the level is completed, unlock the next level.
  Future<void> handleQuizCompletion({
    required String category,
    required int level,
    required String currentStageKey,
    required List<String> allStageKeysForLevel,
  }) async {
    final currentIndex = allStageKeysForLevel.indexOf(currentStageKey);
    // If not last stage, unlock next stage
    if (currentIndex < allStageKeysForLevel.length - 1) {
      final nextStageKey = allStageKeysForLevel[currentIndex + 1];
      await unlockStage(category, level, nextStageKey);
    } else {
      // If last stage, unlock first stage of next level
      await unlockNextLevel(category, level + 1, 'Stage 1');
    }
  }

  Future<void> _saveProgress(String uid) async {
    // Save the unlockedStages map to Firestore
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'unlockedStages': _unlockedStages.map((cat, levelMap) => MapEntry(
        cat,
        levelMap.map((level, stages) => MapEntry(level.toString(), stages)),
      )),
      'completedLevel': _completedLevel,
      'completedStage': _completedStage,
    }, SetOptions(merge: true));
  }
}