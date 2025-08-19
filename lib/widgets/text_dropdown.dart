import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextDropdown extends StatefulWidget {
  final String headerText;
  final String dropdownText;
  final Color backgroundColor;
  final Color textColor;

  const TextDropdown({
    super.key,
    required this.headerText,
    required this.dropdownText,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  State<TextDropdown> createState() => _TextDropdownState();
}

class _TextDropdownState extends State<TextDropdown> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.headerText,
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: widget.textColor,
                      ),
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: widget.textColor,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                widget.dropdownText,
                style: GoogleFonts.manrope(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: widget.textColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
