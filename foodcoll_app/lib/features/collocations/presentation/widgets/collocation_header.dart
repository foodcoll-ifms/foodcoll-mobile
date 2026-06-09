import 'package:flutter/material.dart';
import '../../../../core/state/favorites_controller.dart';
import '../../../../shared/models/collocation_model.dart';
import '../../../../shared/widgets/page_header.dart';

class CollocationHeader extends StatelessWidget {
  final CollocationModel collocation;
  final bool isFavorited;
  final BuildContext pageContext;

  const CollocationHeader({
    super.key,
    required this.collocation,
    required this.isFavorited,
    required this.pageContext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PageHeader(
            title: collocation.colocacao,
            onBack: () => Navigator.pop(pageContext),
          ),
        ),
        IconButton(
          onPressed: () =>
              FavoritesController.instance.toggleFavorite(collocation),
          icon: Icon(
            isFavorited ? Icons.star : Icons.star_border,
            color: const Color(0xFF1FA7A6),
          ),
        ),
        IconButton(
          onPressed: () =>
              debugPrint('Ouvir pronúncia de ${collocation.colocacao}'),
          icon: const Icon(Icons.volume_up, color: Color(0xFF1FA7A6)),
        ),
      ],
    );
  }
}