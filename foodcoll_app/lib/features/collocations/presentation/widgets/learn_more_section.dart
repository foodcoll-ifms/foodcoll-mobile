import 'package:flutter/material.dart';
import 'source_card.dart';

class LearnMoreSection extends StatefulWidget {
  final String infClasse;
  final String infEstrutura;
  final String observacao;
  final List<String> fontes;

  const LearnMoreSection({
    super.key,
    required this.infClasse,
    required this.infEstrutura,
    required this.observacao,
    required this.fontes,
  });

  @override
  State<LearnMoreSection> createState() => _LearnMoreSectionState();
}

class _LearnMoreSectionState extends State<LearnMoreSection> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text(
            'Saiba mais',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(
            _expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down_sharp,
            color: Colors.black,
          ),
          onTap: () => setState(() => _expanded = !_expanded),
        ),
        if (_expanded) ...[
          const SizedBox(height: 8),
          _buildContent(),
        ],
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.infClasse.isNotEmpty) ...[
          _buildInfoRow('Classe', widget.infClasse),
          const SizedBox(height: 8),
        ],
        if (widget.infEstrutura.isNotEmpty) ...[
          _buildInfoRow('Estrutura', widget.infEstrutura),
          const SizedBox(height: 8),
        ],
        if (widget.observacao.isNotEmpty) ...[
          _buildInfoRow('Observação', widget.observacao),
          const SizedBox(height: 16),
        ],
        if (widget.fontes.isNotEmpty) ...[
          const Text(
            'Fontes e Referências',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...widget.fontes.map((fonte) => SourceCard(fonte: fonte)),
        ],
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 15,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: value),
        ],
      ),
    );
  }
}