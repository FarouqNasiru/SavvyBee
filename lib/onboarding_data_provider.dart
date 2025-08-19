import 'package:flutter/material.dart';

class OnboardingDataProvider extends ChangeNotifier {
  String? country;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? nin;
  String? dateOfBirth;
  String? bvn;
  String? residenceCountry;
  String? countryCode;

  List<Map<String, dynamic>> questionAnswers = [];

  // Add more fields as needed

  void updateFirstName(String value) {
    firstName = value;
    notifyListeners();
  }

  void updateLastName(String value) {
    lastName = value;
    notifyListeners();
  }

  void updateEmail(String value) {
    email = value;
    notifyListeners();
  }

  void updatePhoneNumber(String value) {
    phoneNumber = value;
    notifyListeners();
  }

  void updateCountry(String value) {
    country = value;
    notifyListeners();
  }

  void addQuestionAnswer(String question, String answer) {
    questionAnswers.add({'question': question, 'answer': answer});
    notifyListeners();
  }
  
  void updateNIN(String value) {
    nin = value;
    notifyListeners();
  }

  void updateDateOfBirth(String value) {
    dateOfBirth = value;
    notifyListeners();
  }

  void updateBVN(String value) {
    bvn = value;
    notifyListeners();
  }

  void updateResidenceCountry(String value) {
    residenceCountry = value;
    notifyListeners();
  }

   void updatecountryCode(String value) {
    countryCode = value;
    notifyListeners();
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'country': country,
      'questionAnswers': questionAnswers,
      'residenceCountry': residenceCountry,
      'countryCode': countryCode,
      'nin': nin,
      'dateOfBirth': dateOfBirth,
      'bvn': bvn,
      // Add more fields as needed
    };
  }
}
