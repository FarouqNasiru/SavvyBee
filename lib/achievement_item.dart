import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AchievementItem extends StatelessWidget {
  final VoidCallback onTap;
  final int current;
  final int total;

  const AchievementItem({
    Key? key, 
    required this.onTap,
    required this.current,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Bee Image Container
          Container(
            width: 85.188,
            height: 110.251,
            child: Image.asset(
              'lib/assets/images/budgeting bee pose 1 4.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          // Budget Master Text
          Text(
            'Budget Master',
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              height: 1.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2),
          // Progress Text
          Text(
            '$current of $total',
            style: GoogleFonts.manrope(
              fontSize: 14,
              color: const Color.fromARGB(255, 255, 195, 0),
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
