import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dropdown_provider.dart';

class TextDropdown extends StatelessWidget {
  final String headerText;
  final String dropdownText;
  final Color? backgroundColor;
  final Color? textColor;

  const TextDropdown({
    super.key,
    required this.headerText,
    required this.dropdownText,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DropdownProvider(),
      child: Consumer<DropdownProvider>(
        builder: (context, provider, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Clickable header
              Material(
                color: backgroundColor ?? Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: () => provider.toggleDropdown(),
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          headerText,
                          style: TextStyle(
                            fontSize: 16,
                            color: textColor ?? Colors.black,
                          ),
                        ),
                        Icon(
                          provider.isExpanded 
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: textColor ?? Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              // Dropdown content
              if (provider.isExpanded) ...[
                const SizedBox(height: 4),
                Material(
                  color: backgroundColor ?? Color(0xFFFAFAFA),
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      dropdownText,
                      style: TextStyle(
                        fontSize: 14,
                        color: textColor ?? Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}