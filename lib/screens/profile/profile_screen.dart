import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        final user = authProvider.currentUser;
        if (user == null) {
          return Center(child: Text('No user data'));
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.orange[100],
                  child: Text(
                    user.fullName[0].toUpperCase(),
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[800],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  user.fullName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user.email,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 30),
                _buildInfoCard('Phone', user.phoneNumber),
                _buildInfoCard('Bank', '${user.bankName} - ${user.accountNumber}'),
                _buildInfoCard('Location', user.location),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    authProvider.logout();
                  },
                  child: Text('Logout'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Spacer(),
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
