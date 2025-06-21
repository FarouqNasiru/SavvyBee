import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelCard extends StatelessWidget {
  final String category;
  final int level;

  const LevelCard({
    super.key,
    required this.category,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    // You can customize level names per category if you want
    final String levelName = "Level ${level + 1}";

    return Container(
      width: 300,
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.asset(
              "lib/assets/images/Vector.png",
              width: 21.4,
              height: 23.6,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  levelName,
                  style: GoogleFonts.manrope(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "$category Journey",
                  style: GoogleFonts.manrope(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}