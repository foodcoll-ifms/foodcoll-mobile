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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Exemplo(s) de uso',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            color: Color(0xFF4A4F55),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ExampleCard(
          label: 'Inglês',
          text: exemploEn.isNotEmpty ? exemploEn : 'Exemplo não disponível',
          backgroundColor: const Color(0xFFA8D5D4),
        ),
        const SizedBox(height: 16),
        ExampleCard(
          label: 'Português',
          text: exemploPt.isNotEmpty ? exemploPt : 'Exemplo não disponível',
          backgroundColor: const Color(0xFFE9EEF0),
        ),
      ],
    );
  }
}