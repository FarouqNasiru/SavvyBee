class User {
  final String id;
  final String name;
  final String email;
  final String? profileImage;
  final String location;
  final bool isBankLinked;
  final String phoneNumber;
  final String bvn;
  final String bankAccountNumber;
  final String bankName;
  final bool isBankVerified;
  final DateTime createdAt;
  final List<String> hiveIds;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
    required this.location,
    this.isBankLinked = false,
    required this.phoneNumber,
    this.bvn = '',
    this.bankAccountNumber = '',
    this.bankName = '',
    this.isBankVerified = false,
    required this.createdAt,
    this.hiveIds = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'] ?? json['fullName'] ?? '',
      email: json['email'],
      profileImage: json['profileImage'],
      location: json['location'],
      isBankLinked: json['isBankLinked'] ?? false,
      phoneNumber: json['phoneNumber'] ?? '',
      bvn: json['bvn'] ?? '',
      bankAccountNumber: json['bankAccountNumber'] ?? '',
      bankName: json['bankName'] ?? '',
      isBankVerified: json['isBankVerified'] ?? false,
      createdAt: json['createdAt'] != null 
          ? DateTime.parse(json['createdAt']) 
          : DateTime.now(),
      hiveIds: List<String>.from(json['hiveIds'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'location': location,
      'isBankLinked': isBankLinked,
      'phoneNumber': phoneNumber,
      'bvn': bvn,
      'bankAccountNumber': bankAccountNumber,
      'bankName': bankName,
      'isBankVerified': isBankVerified,
      'createdAt': createdAt.toIso8601String(),
      'hiveIds': hiveIds,
    };
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? profileImage,
    String? location,
    bool? isBankLinked,
    String? phoneNumber,
    String? bvn,
    String? bankAccountNumber,
    String? bankName,
    bool? isBankVerified,
    DateTime? createdAt,
    List<String>? hiveIds,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      location: location ?? this.location,
      isBankLinked: isBankLinked ?? this.isBankLinked,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      bvn: bvn ?? this.bvn,
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
      bankName: bankName ?? this.bankName,
      isBankVerified: isBankVerified ?? this.isBankVerified,
      createdAt: createdAt ?? this.createdAt,
      hiveIds: hiveIds ?? this.hiveIds,
    );
  }
}

class HiveMember {
  final User user;
  final DateTime joinedDate;
  final int payoutPosition;
  final bool hasPaid;
  final bool hasReceived;
  final List<ContributionRecord> contributions;

  HiveMember({
    required this.user,
    required this.joinedDate,
    required this.payoutPosition,
    this.hasPaid = false,
    this.hasReceived = false,
    this.contributions = const [],
  });

  factory HiveMember.fromJson(Map<String, dynamic> json) {
    return HiveMember(
      user: User.fromJson(json['user']),
      joinedDate: DateTime.parse(json['joinedDate']),
      payoutPosition: json['payoutPosition'],
      hasPaid: json['hasPaid'] ?? false,
      hasReceived: json['hasReceived'] ?? false,
      contributions: (json['contributions'] as List?)
          ?.map((c) => ContributionRecord.fromJson(c))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'joinedDate': joinedDate.toIso8601String(),
      'payoutPosition': payoutPosition,
      'hasPaid': hasPaid,
      'hasReceived': hasReceived,
      'contributions': contributions.map((c) => c.toJson()).toList(),
    };
  }
}

class ContributionRecord {
  final String id;
  final String userId;
  final double amount;
  final DateTime contributionDate;
  final String transactionId;
  final bool isSuccessful;

  ContributionRecord({
    required this.id,
    required this.userId,
    required this.amount,
    required this.contributionDate,
    required this.transactionId,
    this.isSuccessful = false,
  });

  factory ContributionRecord.fromJson(Map<String, dynamic> json) {
    return ContributionRecord(
      id: json['id'],
      userId: json['userId'],
      amount: json['amount'].toDouble(),
      contributionDate: DateTime.parse(json['contributionDate']),
      transactionId: json['transactionId'],
      isSuccessful: json['isSuccessful'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'amount': amount,
      'contributionDate': contributionDate.toIso8601String(),
      'transactionId': transactionId,
      'isSuccessful': isSuccessful,
    };
  }
}
