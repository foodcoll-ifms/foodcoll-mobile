import 'package:flutter/material.dart';
import '../../../../shared/models/collocation_model.dart';

class SourceCard extends StatelessWidget {
  final FonteModel fonte;

  const SourceCard({super.key, required this.fonte});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1F2429) : const Color(0xFFE9EEF0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.description_outlined, color: Color(0xFF1FA7A6)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              fonte.url.isNotEmpty ? fonte.url : 'Fonte sem link disponível',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: isDark ? const Color(0xFFE9EEF0) : Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            onPressed: fonte.url.isNotEmpty
                ? () => debugPrint('Abrir link: ${fonte.url}')
                : null,
            icon: const Icon(Icons.link, color: Color(0xFF1FA7A6)),
          ),
        ],
      ),
    );
  }
}