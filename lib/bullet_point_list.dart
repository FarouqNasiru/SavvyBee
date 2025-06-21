import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BulletPointList extends StatelessWidget {
  final List<String> points;
  const BulletPointList({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20,),
      decoration: BoxDecoration(
        color: Colors.white,
        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: points
            .map((text) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildBulletPoint(text),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 5, right: 8),
          child: Icon(
            Icons.circle,
            size: 5,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.manrope(
              fontSize: 16,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}