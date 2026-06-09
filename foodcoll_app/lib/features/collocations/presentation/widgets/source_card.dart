import 'package:flutter/material.dart';

class SourceCard extends StatelessWidget {
  final String fonte;

  const SourceCard({super.key, required this.fonte});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE9EEF0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.description_outlined, color: Color(0xFF1FA7A6)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Título da referência',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Autor/Organização',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Color(0xFF4A4F55),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => debugPrint('Abrir link: $fonte'),
            icon: const Icon(Icons.link, color: Color(0xFF1FA7A6)),
          ),
        ],
      ),
    );
  }
}