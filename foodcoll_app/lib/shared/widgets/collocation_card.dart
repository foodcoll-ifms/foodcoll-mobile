import 'package:flutter/material.dart';

class CollocationCard extends StatelessWidget {
  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  final String collocation;
  final String translation;
  final bool isFavorited;
  final VoidCallback? onFavoriteToggle;

  const CollocationCard({
    Key? key,
    required this.collocation,
    required this.translation,
    this.isFavorited = false,
    this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _capitalize(collocation),
                      style: textTheme.bodyLarge?.copyWith(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _capitalize(translation),
                      style: textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Inter',
                        color: colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onFavoriteToggle,
                child: Icon(
                  isFavorited ? Icons.star : Icons.star_border,
                  color: const Color(0xFF1FA7A6),
                  size: 32,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 2,
          thickness: 2,
          color: Color(0xFFA8D5D4),
        ),
      ],
    );
  }
}