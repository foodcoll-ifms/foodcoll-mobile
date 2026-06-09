import 'package:flutter/material.dart';
import 'example_card.dart';

class ExamplesSection extends StatelessWidget {
  final String exemploEn;
  final String exemploPt;

  const ExamplesSection({
    super.key,
    required this.exemploEn,
    required this.exemploPt,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Exemplo(s) de uso',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            color: isDark ? const Color(0xFFE9EEF0) : const Color(0xFF4A4F55),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ExampleCard(
          label: 'Inglês',
          text: exemploEn.isNotEmpty ? exemploEn : 'Exemplo não disponível',
          backgroundColor: const Color(0xFFA8D5D4),
          isDark: isDark,
          textColor: const Color(0xFF4A4F55),
        ),
        const SizedBox(height: 16),
        ExampleCard(
          label: 'Português',
          text: exemploPt.isNotEmpty ? exemploPt : 'Exemplo não disponível',
          backgroundColor:
              isDark ? const Color(0xFF1F2429) : const Color(0xFFE9EEF0),
          isDark: isDark,
        ),
      ],
    );
  }
}
