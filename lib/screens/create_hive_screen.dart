import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvybee/models/hive_model.dart';
import 'package:savvybee/screens/hive/hive_creation_success_screen.dart';
import 'package:provider/provider.dart';
import 'package:savvybee/providers/hive_provider.dart';

class CreateHiveScreen extends StatefulWidget {
  @override
  _CreateHiveScreenState createState() => _CreateHiveScreenState();
}

class _CreateHiveScreenState extends State<CreateHiveScreen> {
  final _formKey = GlobalKey<FormState>();
  final _hiveNameController = TextEditingController();
  final _contributionController = TextEditingController();
  final _rulesController = TextEditingController();

  HiveFrequency _selectedFrequency = HiveFrequency.weekly;
  int _selectedMembers = 5;
  PayoutOrder _selectedPayoutOrder = PayoutOrder.firstIn;
  DateTime? _startDate;
  DateTime? _endDate;
  bool _isLoading = false;

  @override
  void dispose() {
    _hiveNameController.dispose();
    _contributionController.dispose();
    _rulesController.dispose();
    super.dispose();
  }

  Future<void> _selectStartDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 7)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (date != null) {
      setState(() {
        _startDate = date;
      });
    }
  }

  Future<void> _selectEndDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now().add(Duration(days: 7)),
      firstDate: _startDate ?? DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 730)),
    );
    if (date != null) {
      setState(() {
        _endDate = date;
      });
    }
  }

  Future<void> _createHive() async {
    if (_formKey.currentState!.validate() &&
        _startDate != null &&
        _endDate != null) {
      setState(() {
        _isLoading = true;
      });

      final firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User not logged in. Please log in again.'),
            backgroundColor: Colors.red,
          ),
        );
        setState(() {
          _isLoading = false;
        });
        return;
      }
      final creatorId = firebaseUser.uid;

      // Fetch extra user info from Firestore (e.g., location)
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(creatorId)
          .get();
      final userData = userDoc.data() ?? {};
      final location = userData['location'] ?? '';

      // Generate invite code
      final inviteCode =
          DateTime.now().millisecondsSinceEpoch.toString().substring(7) + "AJO";

      final creatorMember = {
        'userId': creatorId,
        'userName': userData['firstName'] ?? '',
        'joinedAt': DateTime.now().toIso8601String(),
        'payoutPosition': 1,
        'hasReceived': false,
      };

      final hiveData = {
        'name': _hiveNameController.text.trim(),
        'creatorId': creatorId,
        'contributionAmount': double.parse(_contributionController.text),
        'frequency': _selectedFrequency.toString().split('.').last,
        'maxMembers': _selectedMembers,
        'payoutOrder': _selectedPayoutOrder.toString().split('.').last,
        'startDate': _startDate!.toIso8601String(),
        'endDate': _endDate!.toIso8601String(),
        'rulesDescription': _rulesController.text.trim(),
        'location': location,
        'inviteCode': inviteCode,
        'members': [creatorMember],
        'memberIds': [creatorId], // <-- ADD THIS LINE!
        'createdAt': DateTime.now().toIso8601String(),
        'description': '',
        'currentMembers': 1,
        'status': 'active',
        'payoutSchedule': [],
      };

      try {
        final docRef =
            await FirebaseFirestore.instance.collection('hives').add(hiveData);

        // Fetch the created hive document
        final docSnap = await docRef.get();
        final hive = Hive(
          id: docRef.id,
          name: hiveData['name'],
          creatorId: creatorId,
          contributionAmount: hiveData['contributionAmount'],
          frequency: _selectedFrequency,
          maxMembers: _selectedMembers,
          payoutOrder: _selectedPayoutOrder,
          startDate: _startDate!,
          endDate: _endDate!,
          rulesDescription: _rulesController.text.trim(),
          location: location,
          members: [
            HiveMember(
              userId: creatorId,
              userName: userData['firstName'] ?? '',
              joinedAt: DateTime.now(),
              payoutPosition: 1,
              hasReceived: false,
              // add other required fields for Member here
            )
          ],
          inviteCode: inviteCode,
          createdAt: DateTime.now(),
          description: '',
          currentMembers: 1,
          status: HiveStatus.active,
          payoutSchedule: [],
        );

        setState(() {
          _isLoading = false;
        });

        final hiveProvider = Provider.of<HiveProvider>(context, listen: false);
        await hiveProvider
            .fetchUserHives(FirebaseAuth.instance.currentUser!.uid);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HiveCreationSuccessScreen(hive: hive),
          ),
        );
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create hive: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else if (_startDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a start date'),
          backgroundColor: Colors.red,
        ),
      );
    } else if (_endDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select an end date'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Create Your Hive',
          textAlign: TextAlign.center,
          style: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 0, left: 20.0, right: 20.0, bottom: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bee illustration placeholder
              Center(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/images/FAMILY BEE JAR 2.png',
                        width: 290,
                        height: 290,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Start a group savings circle that works\njust like Ajo — but smarter.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 26),

              // Hive Name
              Text(
                'Hive Name',
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 7),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 1),
                    left: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 1),
                    right: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 3),
                    bottom: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 3),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: _hiveNameController,
                  decoration: const InputDecoration(
                    hintText: 'Give your Hive a name',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a hive name';
                    }
                    return null;
                  },
                ),
              ),

              SizedBox(height: 8),

              // Contribution Amount
              Text(
                'Contribution Amount',
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 7),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 1),
                    left: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 1),
                    right: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 3),
                    bottom: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 3),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: _contributionController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'How much to contribute',
                    prefixText: '₦ ',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter contribution amount';
                    }
                    final amount = double.tryParse(value);
                    if (amount == null || amount <= 0) {
                      return 'Please enter a valid amount';
                    }
                    if (amount < 1000) {
                      return 'Minimum contribution is ₦1,000';
                    }
                    return null;
                  },
                ),
              ),

              SizedBox(height: 8),

              // Frequency
              Text(
                'Frequency',
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 7),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 1),
                    left: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 1),
                    right: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 3),
                    bottom: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 3),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonFormField<HiveFrequency>(
                  value: _selectedFrequency,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                  items: HiveFrequency.values.map((frequency) {
                    return DropdownMenuItem(
                      value: frequency,
                      child: Text(_getFrequencyText(frequency)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedFrequency = value!;
                    });
                  },
                ),
              ),

              SizedBox(height: 8),

              // Members
              Text(
                'Members',
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 7),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 1),
                    left: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 1),
                    right: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 3),
                    bottom: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 3),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonFormField<int>(
                  value: _selectedMembers,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                  items: List.generate(15, (index) => index + 2).map((count) {
                    return DropdownMenuItem(
                      value: count,
                      child: Text('$count people'),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedMembers = value!;
                    });
                  },
                ),
              ),

              SizedBox(height: 8),

              // Start Date
              Text(
                'Start Date',
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 7),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 1),
                    left: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 1),
                    right: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 3),
                    bottom: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 3),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  onTap: _selectStartDate,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _startDate == null
                              ? 'Select start date'
                              : '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}',
                          style: TextStyle(
                            color: _startDate == null ? Colors.grey[600] : null,
                          ),
                        ),
                        Icon(Icons.calendar_today, color: Colors.grey[600]),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 8),

              // End Date
              Text(
                'End Date',
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 7),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color:
                            _selectEndDate != null ? Colors.black : Colors.grey,
                        width: 1),
                    left: BorderSide(
                        color:
                            _selectEndDate != null ? Colors.black : Colors.grey,
                        width: 1),
                    right: BorderSide(
                        color:
                            _selectEndDate != null ? Colors.black : Colors.grey,
                        width: 3),
                    bottom: BorderSide(
                        color:
                            _selectEndDate != null ? Colors.black : Colors.grey,
                        width: 3),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  onTap: _selectEndDate,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _endDate == null
                              ? 'Select end date'
                              : '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}',
                          style: TextStyle(
                            color: _endDate == null ? Colors.grey[600] : null,
                          ),
                        ),
                        Icon(Icons.calendar_today, color: Colors.grey[600]),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 8),

              // Payout Order
              Text(
                'Payout Order',
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 7),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 1),
                    left: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 1),
                    right: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 3),
                    bottom: BorderSide(
                        color: _hiveNameController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 3),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonFormField<PayoutOrder>(
                  value: _selectedPayoutOrder,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                  items: PayoutOrder.values.map((order) {
                    return DropdownMenuItem(
                      value: order,
                      child: Text(_getPayoutOrderText(order)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedPayoutOrder = value!;
                    });
                  },
                ),
              ),

              SizedBox(height: 8),

              // Rules Summary
              Text(
                'Rules Summary (Optional)',
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 7),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _rulesController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 1),
                    left: BorderSide(
                        color: _rulesController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 1),
                    right: BorderSide(
                        color: _rulesController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 3),
                    bottom: BorderSide(
                        color: _rulesController.text.isNotEmpty
                            ? Colors.black
                            : Colors.grey,
                        width: 3),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: _rulesController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText:
                        'Each member contributes ₦5,000 every week.\nPayouts will be in random order. Total cycle will last 5 weeks.',
                    hintStyle: GoogleFonts.manrope(
                      color: Colors.grey[400],
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
              ),

              SizedBox(height: 8),

              // Hive Summary
              //  if (_startDate != null && _contributionController.text.isNotEmpty)
              //    Container(
              //      padding: EdgeInsets.all(16),
              //      decoration: BoxDecoration(
              //        color: Colors.blue[50],
              //        borderRadius: BorderRadius.circular(8),
              //      ),
              //      child: Column(
              //        crossAxisAlignment: CrossAxisAlignment.start,
              //        children: [
              //          Text(
              //            'Hive Summary',
              //            style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               color: Colors.blue[800],
              //             ),
              //           ),
              //           SizedBox(height: 8),
              //           Text(
              //               'End Date: ${_endDate != null ? '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}' : ''}'),
              //           Text(
              //               'Total Pool: ₦${(double.tryParse(_contributionController.text) ?? 0) * _selectedMembers}'),
              //           Text(
              //               'Duration: ${_getFrequencyText(_selectedFrequency)} contributions'),
              //          ],
              //       ),
              //    ),

              SizedBox(height: 40),

              // Create Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _createHive,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: _isLoading
                      ? CircularProgressIndicator(color: Colors.yellow)
                      : Text(
                          'Create a Hive',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getFrequencyText(HiveFrequency frequency) {
    switch (frequency) {
      case HiveFrequency.daily:
        return 'Daily';
      case HiveFrequency.weekly:
        return 'Weekly';
      case HiveFrequency.monthly:
        return 'Monthly';
    }
  }

  String _getPayoutOrderText(PayoutOrder order) {
    switch (order) {
      case PayoutOrder.random:
        return 'Random Order';
      case PayoutOrder.firstIn:
        return 'First In, First Out';
      case PayoutOrder.lastIn:
        return 'Last In, First Out';
    }
  }
}
