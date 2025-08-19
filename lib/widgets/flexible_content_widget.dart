import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/content_models.dart';
import 'text_dropdown.dart';

class FlexibleContentWidget extends StatelessWidget {
  final List<ContentSection> sections;

  const FlexibleContentWidget({
    super.key,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sections.map((section) => _buildSection(section, screenHeight)).toList(),
    );
  }

  Widget _buildSection(ContentSection section, double screenHeight) {
    switch (section.type) {
      case 'title':
        return Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
          child: Text(
            section.text ?? '',
            style: GoogleFonts.manrope(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        );
      
      case 'subtitle':
        return Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.012),
          child: Text(
            section.text ?? '',
            style: GoogleFonts.manrope(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.start,
          ),
        );
      
      case 'paragraph':
        return Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.008),
          child: Text(
            section.text ?? '',
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.start,
          ),
        );
      
      case 'list':
        return Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.008),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: (section.items ?? []).map((item) => Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.004),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• ',
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            )).toList(),
          ),
        );
      
      case 'numbered_list':
        return Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.008),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: (section.items ?? []).asMap().entries.map((entry) {
              int index = entry.key;
              String item = entry.value;
              return Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.004),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${index + 1}. ',
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item,
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        );
      
      case 'dropdown':
        return Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.006),
          child: TextDropdown(
            headerText: section.header ?? '',
            dropdownText: section.body ?? '',
            backgroundColor: const Color(0xFFFAFAFA),
            textColor: Colors.black,
          ),
        );
      
      default:
        return const SizedBox.shrink();
    }
  }
}
