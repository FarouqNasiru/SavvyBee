import 'package:cloud_firestore/cloud_firestore.dart';

enum HiveStatus { pending, active, completed, cancelled }
enum HiveFrequency { daily, weekly, monthly }
enum PayoutOrder { firstIn, lastIn, random }

class Hive {
  final String id;
  final String name;
  final String description;
  final String creatorId;
  final double contributionAmount;
  final HiveFrequency frequency;
  final int maxMembers;
  final int currentMembers;
  final PayoutOrder payoutOrder;
  final DateTime startDate;
  final DateTime endDate;
  final String rulesDescription;
  final String location;
  final String inviteCode;
  final HiveStatus status;
  final List<HiveMember> members;
  final List<PayoutSchedule> payoutSchedule;
  final DateTime createdAt;

  Hive({
    required this.id,
    required this.name,
    required this.description,
    required this.creatorId,
    required this.contributionAmount,
    required this.frequency,
    required this.maxMembers,
    required this.currentMembers,
    required this.payoutOrder,
    required this.startDate,
    required this.endDate,
    required this.rulesDescription,
    required this.location,
    required this.inviteCode,
    required this.status,
    required this.members,
    required this.payoutSchedule,
    required this.createdAt,
  });

  factory Hive.fromJson(Map<String, dynamic> json) {
    return Hive(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      creatorId: json['creatorId'],
      contributionAmount: json['contributionAmount'].toDouble(),
      frequency: HiveFrequency.values.firstWhere(
        (e) => e.toString().split('.').last == json['frequency'],
      ),
      maxMembers: json['maxMembers'],
      currentMembers: json['currentMembers'],
      payoutOrder: PayoutOrder.values.firstWhere(
        (e) => e.toString().split('.').last == json['payoutOrder'],
      ),
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      rulesDescription: json['rulesDescription'],
      location: json['location'],
      inviteCode: json['inviteCode'],
      status: HiveStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['status'],
      ),
      members: (json['members'] as List)
          .map((m) => HiveMember.fromJson(m))
          .toList(),
      payoutSchedule: (json['payoutSchedule'] as List)
          .map((p) => PayoutSchedule.fromJson(p))
          .toList(),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  factory Hive.fromFirestore(DocumentSnapshot doc) {
    final json = doc.data() as Map<String, dynamic>;
    return Hive(
      id: doc.id,
      name: json['name'],
      description: json['description'],
      creatorId: json['creatorId'],
      contributionAmount: (json['contributionAmount'] as num).toDouble(),
      frequency: HiveFrequency.values.firstWhere(
        (e) => e.toString().split('.').last == json['frequency'],
      ),
      maxMembers: json['maxMembers'],
      currentMembers: json['currentMembers'],
      payoutOrder: PayoutOrder.values.firstWhere(
        (e) => e.toString().split('.').last == json['payoutOrder'],
      ),
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      rulesDescription: json['rulesDescription'],
      location: json['location'],
      inviteCode: json['inviteCode'],
      status: HiveStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['status'],
      ),
      members: (json['members'] as List)
          .map((m) => HiveMember.fromFirestore(m as Map<String, dynamic>))
          .toList(),
      payoutSchedule: (json['payoutSchedule'] as List)
          .map((p) => PayoutSchedule.fromJson(p))
          .toList(),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'creatorId': creatorId,
      'contributionAmount': contributionAmount,
      'frequency': frequency.toString().split('.').last,
      'maxMembers': maxMembers,
      'currentMembers': currentMembers,
      'payoutOrder': payoutOrder.toString().split('.').last,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'rulesDescription': rulesDescription,
      'location': location,
      'inviteCode': inviteCode,
      'status': status.toString().split('.').last,
      'members': members.map((m) => m.toJson()).toList(),
      'payoutSchedule': payoutSchedule.map((p) => p.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

class HiveMember {
  final String userId;
  final String userName;
  final DateTime joinedAt;
  final int payoutPosition;
  final bool hasReceived;

  HiveMember({
    required this.userId,
    required this.userName,
    required this.joinedAt,
    required this.payoutPosition,
    required this.hasReceived,
  });

  factory HiveMember.fromJson(Map<String, dynamic> json) {
    return HiveMember(
      userId: json['userId'],
      userName: json['userName'],
      joinedAt: DateTime.parse(json['joinedAt']),
      payoutPosition: json['payoutPosition'],
      hasReceived: json['hasReceived'],
    );
  }

  factory HiveMember.fromFirestore(Map<String, dynamic> json) {
    return HiveMember(
      userId: json['userId'],
      userName: json['userName'],
      joinedAt: DateTime.parse(json['joinedAt']),
      payoutPosition: json['payoutPosition'],
      hasReceived: json['hasReceived'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'joinedAt': joinedAt.toIso8601String(),
      'payoutPosition': payoutPosition,
      'hasReceived': hasReceived,
    };
  }
}

class PayoutSchedule {
  final String userId;
  final String userName;
  final DateTime payoutDate;
  final double amount;
  final bool isPaid;

  PayoutSchedule({
    required this.userId,
    required this.userName,
    required this.payoutDate,
    required this.amount,
    required this.isPaid,
  });

  factory PayoutSchedule.fromJson(Map<String, dynamic> json) {
    return PayoutSchedule(
      userId: json['userId'],
      userName: json['userName'],
      payoutDate: DateTime.parse(json['payoutDate']),
      amount: json['amount'].toDouble(),
      isPaid: json['isPaid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'payoutDate': payoutDate.toIso8601String(),
      'amount': amount,
      'isPaid': isPaid,
    };
  }
}


