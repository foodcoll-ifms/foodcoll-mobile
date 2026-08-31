import 'package:flutter/material.dart';

/// Widget reutilizável de cabeçalho de página.

/// Exibe um título e, opcionalmente, um botão de voltar.
class PageHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;

  const PageHeader({Key? key, required this.title, this.onBack})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (onBack != null)
          GestureDetector(
            onTap: onBack,
            child: const Icon(Icons.arrow_back, size: 24),
          ),
        if (onBack != null) const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
        ),
      ],
    );
  }
}