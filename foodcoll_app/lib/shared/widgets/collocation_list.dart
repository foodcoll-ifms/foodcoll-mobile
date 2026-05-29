import 'package:flutter/material.dart';
import '../../features/collocations/presentation/pages/collocations_page.dart';
import '../../shared/models/collocation_model.dart';
import 'collocation_card.dart';

class CollocationList extends StatelessWidget {
  final List<CollocationModel> collocations;
  final bool Function(String colocacao)? isFavorited;
  final void Function(CollocationModel collocation)? onFavoriteToggle;

  const CollocationList({
    super.key,
    required this.collocations,
    this.isFavorited,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    if (collocations.isEmpty) {
      return const SizedBox.expand(
        child: Center(
          child: Text(
            'Nenhuma colocação encontrada.',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: Color(0xFF4A4F55),
            ),
          ),
        ),
      );
    }

    final sorted = [...collocations]
      ..sort((a, b) => a.colocacao.compareTo(b.colocacao));

    return ListView.builder(
      itemCount: sorted.length,
      itemBuilder: (context, index) {
        final collocation = sorted[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CollocationsPage(
                  collocation: collocation,
                ),
              ),
            );
          },
          child: CollocationCard(
            collocation: collocation.colocacao,
            translation: collocation.traducao,
            isFavorited: isFavorited?.call(collocation.colocacao) ?? false,
            onFavoriteToggle: onFavoriteToggle == null
                ? null
                : () => onFavoriteToggle!(collocation),
          ),
        );
      },
    );
  }
}