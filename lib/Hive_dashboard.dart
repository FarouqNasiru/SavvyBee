import 'package:flutter/material.dart';
import 'package:savvybee/navbar.dart';

class HiveDashboard extends StatefulWidget {
  const HiveDashboard({super.key});

  @override
  State<HiveDashboard> createState() => _HiveDashboardState();
}

class _HiveDashboardState extends State<HiveDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'lib/assets/images/Ellipse 158.png', // Replace with your logo path
              height: 24,
              width: 24,
            ),
            Image.asset(
              'lib/assets/images/bi_gear.png', // Replace with your logo text path
              height: 24,
              width: 24,
            )
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Text(
            'Welcome to the Hive Dashboard!',
            style: TextStyle(fontSize: 24, color: Colors.black),
            
          ),
          Text('hello'),
          SizedBox(height: 20),

          
        ],
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
