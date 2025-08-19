class User {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String countryCode;
  final bool isPhoneVerified;
  final String bvn;
  final String location;
  final String bankName;
  final String accountNumber;
  final DateTime createdAt;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.countryCode,
    this.isPhoneVerified = false,
    required this.bvn,
    required this.location,
    required this.bankName,
    required this.accountNumber,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      countryCode: json['countryCode'] ?? '+234',
      isPhoneVerified: json['isPhoneVerified'] ?? false,
      bvn: json['bvn'],
      location: json['location'],
      bankName: json['bankName'],
      accountNumber: json['accountNumber'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'countryCode': countryCode,
      'isPhoneVerified': isPhoneVerified,
      'bvn': bvn,
      'location': location,
      'bankName': bankName,
      'accountNumber': accountNumber,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  User copyWith({
    String? id,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? countryCode,
    bool? isPhoneVerified,
    String? bvn,
    String? location,
    String? bankName,
    String? accountNumber,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      countryCode: countryCode ?? this.countryCode,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
      bvn: bvn ?? this.bvn,
      location: location ?? this.location,
      bankName: bankName ?? this.bankName,
      accountNumber: accountNumber ?? this.accountNumber,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
