import 'package:flutter/material.dart';

class ExampleCard extends StatelessWidget {
  final String label;
  final String text;
  final Color backgroundColor;
  final bool isDark;
  final Color? textColor;

  const ExampleCard({
    super.key,
    required this.label,
    required this.text,
    required this.backgroundColor,
    this.isDark = false,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: isDark ? const Color(0xFF7A848C) : const Color(0xFF4A4F55),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: backgroundColor,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              color:
                  textColor ??
                  (isDark ? const Color(0xFF7A848C) : const Color(0xFF4A4F55)),
            ),
          ),
        ),
      ],
    );
  }
}
