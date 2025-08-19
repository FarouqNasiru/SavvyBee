import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../../models/hive_model.dart';
import '../services/hive_service.dart';

class HiveProvider with ChangeNotifier {
  final HiveService _hiveService = HiveService();
  
  List<Hive> _userHives = [];
  List<Hive> _suggestedHives = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Hive> get userHives => _userHives;
  List<Hive> get suggestedHives => _suggestedHives;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> createHive(Map<String, dynamic> hiveData) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final hive = await _hiveService.createHive(hiveData);
      if (hive != null) {
        _userHives.add(hive);
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = 'Failed to create hive';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

 Future<bool> joinHive(String inviteCode, String userId, Map<String, dynamic> memberData) async {
  _isLoading = true;
  _errorMessage = null;
  notifyListeners();

  try {
    final success = await _hiveService.joinHive(inviteCode, userId, memberData);
    if (success) {
      await fetchUserHives(userId);
      _isLoading = false;
      notifyListeners();
      return true;
    } else {
      _errorMessage = 'Failed to join hive';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  } catch (e) {
    _errorMessage = e.toString();
    _isLoading = false;
    notifyListeners();
    return false;
  }
}

  Future<void> fetchUserHives(String userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _userHives = await _hiveService.getUserHives(userId);
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchSuggestedHives(String location, String userId) async {
    try {
      _suggestedHives = await _hiveService.getSuggestedHives(location, userId);
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

// In HiveProvider
Future<DocumentReference?> createHiveDocument(Map<String, dynamic> hiveData) async {
  try {
    // Generate invite code
    hiveData['inviteCode'] = generateInviteCode();
    final docRef = await FirebaseFirestore.instance.collection('hives').add(hiveData);
    return docRef;
  } catch (e) {
    _errorMessage = e.toString();
    return null;
  }
}

String generateInviteCode() {
  // Simple random code generator
  return DateTime.now().millisecondsSinceEpoch.toString().substring(7) + "AJO";
}
}
