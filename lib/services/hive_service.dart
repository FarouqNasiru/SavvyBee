import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/hive_model.dart';
import 'dart:math';

class HiveService {
  final _hivesCollection = FirebaseFirestore.instance.collection('hives');

  /// Create a new hive in Firestore
  Future<Hive?> createHive(Map<String, dynamic> hiveData) async {
    try {
      // Generate invite code
      final inviteCode = _generateInviteCode();
      hiveData['inviteCode'] = inviteCode;

      // Add memberIds for querying
      final creatorId = hiveData['creatorId'];
      hiveData['memberIds'] = [creatorId];

      // Add createdAt
      hiveData['createdAt'] = DateTime.now().toIso8601String();

      // Save to Firestore
      final docRef = await _hivesCollection.add(hiveData);

      // Fetch the created hive document
      final docSnap = await docRef.get();
      return Hive.fromFirestore(docSnap);
    } catch (e) {
      print('Error creating hive: $e');
      return null;
    }
  }

  /// Join a hive by invite code
  Future<bool> joinHive(
      String inviteCode, String userId, Map<String, dynamic> memberData) async {
    try {
      // Find the hive by invite code
      final query = await _hivesCollection
          .where('inviteCode', isEqualTo: inviteCode)
          .limit(1)
          .get();
      if (query.docs.isEmpty) return false;

      final doc = query.docs.first;
      final data = doc.data();

      // Update members and memberIds
      List members = List.from(data['members'] ?? []);
      List memberIds = List.from(data['memberIds'] ?? []);
      if (!memberIds.contains(userId)) {
        members.add(memberData);
        memberIds.add(userId);

        await doc.reference.update({
          'members': members,
          'memberIds': memberIds,
          'currentMembers': memberIds.length,
        });
      }
      return true;
    } catch (e) {
      print('Error joining hive: $e');
      return false;
    }
  }

  /// Fetch all hives where the user is a member
  Future<List<Hive>> getUserHives(String userId) async {
    try {
      final snapshot = await _hivesCollection
          .where('memberIds', arrayContains: userId)
          .orderBy('createdAt', descending: true)
          .get();

      return snapshot.docs.map((doc) => Hive.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error fetching user hives: $e');
      return [];
    }
  }

  /// Fetch suggested hives by location (not joined by user)
  Future<List<Hive>> getSuggestedHives(String location, String userId) async {
    try {
      final snapshot =
          await _hivesCollection.where('location', isEqualTo: location).get();

      // Filter out hives the user is already a member of
      return snapshot.docs
          .map((doc) => Hive.fromFirestore(doc))
          
          .toList();
    } catch (e) {
      print('Error fetching suggested hives: $e');
      return [];
    }
  }

  String _generateInviteCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(
          8, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
    );
  }
}
