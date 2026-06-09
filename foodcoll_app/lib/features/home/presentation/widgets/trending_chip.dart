import 'package:flutter/material.dart';

class TrendingChip extends StatelessWidget {
  final String label;

  const TrendingChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1F2429) : const Color(0xFFE9EEF0),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          color: isDark ? const Color(0xFF7A848C) : const Color(0xFF4A4F55),
        ),
      ),
    );
  }
}