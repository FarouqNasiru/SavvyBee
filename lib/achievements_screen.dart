import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savvybee/achievement_item.dart';
import 'package:savvybee/bee_master_screen.dart';

class AchievementsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Achievements',
          style: GoogleFonts.manrope(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 30,
            childAspectRatio: 0.7,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            return AchievementItem(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BeeMasterScreen(),
                  ),
                );
              },
              current: index + 1, // Shows 1, 2, 3, etc.
              total: 9, // Total number of achievements
            );
          },
        ),
      ),
    );
  }

  void _showAchievementDialog(BuildContext context, int achievementNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Achievement #$achievementNumber'),
          content: Text('You clicked on Budget Master achievement!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
