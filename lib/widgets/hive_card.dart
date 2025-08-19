import 'package:flutter/material.dart';
import '../models/hive_model.dart';
import '../utils/currency_formatter.dart';

class HiveCard extends StatelessWidget {
  final Hive hive;
  final VoidCallback? onTap;
  final VoidCallback? onJoin;
  final bool showJoinButton;

  const HiveCard({
    Key? key,
    required this.hive,
    this.onTap,
    this.onJoin,
    this.showJoinButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.savings,
                      color: Colors.orange[800],
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hive.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '₦${hive.contributionAmount.toStringAsFixed(0)} ${hive.frequency.toString().split('.').last}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildStatusChip(),
                ],
              ),
              
              SizedBox(height: 12),
              
              // Member count and dates
              Text(
                '${hive.startDate.day}/${hive.startDate.month} to ${hive.endDate.day}/${hive.endDate.month}/${hive.endDate.year}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
              Text(
                '@ ${hive.currentMembers} Members',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
              
              if (showJoinButton) ...[
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onJoin,
                    child: Text('Join Hive'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip() {
    Color color;
    String text;
    
    switch (hive.status) {
      case HiveStatus.pending:
        color = Colors.orange;
        text = 'Pending';
        break;
      case HiveStatus.active:
        color = Colors.green;
        text = 'Active';
        break;
      case HiveStatus.completed:
        color = Colors.blue;
        text = 'Completed';
        break;
      case HiveStatus.cancelled:
        color = Colors.red;
        text = 'Cancelled';
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
