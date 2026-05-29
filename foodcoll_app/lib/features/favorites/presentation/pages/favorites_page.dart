import 'package:flutter/material.dart';
import '../../../../core/base_page.dart';
import '../../../../core/state/favorites_controller.dart';
import '../../../../shared/widgets/collocation_list.dart';
import '../../../../shared/widgets/page_header.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Favoritos',
      currentIndex: 2,
      body: AnimatedBuilder(
        animation: FavoritesController.instance,
        builder: (context, _) {
          final favorites = FavoritesController.instance.favoritesList;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageHeader(title: "Meus Favoritos", onBack: () => Navigator.pop(context)),
              const SizedBox(height: 24),
              if (favorites.isEmpty)
                const Expanded(
                  child: Center(
                    child: Text(
                      'Você ainda não salvou termos.\nExplore o glossário! 🔍',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        color: Color(0xFF4A4F55),
                      ),
                    ),
                  ),
                )
              else
                Expanded(
                  child: CollocationList(
                    collocations: favorites,
                    isFavorited: FavoritesController.instance.isFavorite,
                    onFavoriteToggle: FavoritesController.instance.toggleFavorite,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}