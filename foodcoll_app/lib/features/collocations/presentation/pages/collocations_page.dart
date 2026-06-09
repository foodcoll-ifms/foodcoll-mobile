import 'package:flutter/material.dart';
import '../../../../core/base_page.dart';
import '../../../../core/state/favorites_controller.dart';
import '../../../../shared/models/collocation_model.dart';
import '../../data/collocation_detail_service.dart';
import '../widgets/collocation_header.dart';
import '../widgets/examples_section.dart';
import '../widgets/learn_more_section.dart';

class CollocationsPage extends StatefulWidget {
  final CollocationModel collocation;

  const CollocationsPage({super.key, required this.collocation});

  @override
  State<CollocationsPage> createState() => _CollocationsPageState();
}

class _CollocationsPageState extends State<CollocationsPage> {
  final _detailService = CollocationDetailService();
  CollocationModel? _detalhes;
  bool _isLoading = true;
  String? _erro;

  @override
  void initState() {
    super.initState();
    _carregarDetalhes();
  }

  Future<void> _carregarDetalhes() async {
    try {
      final detalhes = await _detailService.buscarDetalhes(
        widget.collocation.colocacao,
      );
      if (mounted) setState(() => _detalhes = detalhes);
    } catch (e) {
      if (mounted) setState(() => _erro = 'Erro ao carregar detalhes.');
      debugPrint('Erro: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Colocações',
      showBottomNavigation: false,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_erro != null) {
      return Center(
        child: Text(_erro!, style: const TextStyle(color: Colors.red)),
      );
    }

    final collocation = _detalhes ?? widget.collocation;

    return SingleChildScrollView(
      child: AnimatedBuilder(
        animation: FavoritesController.instance,
        builder: (context, _) {
          final isFavorited = FavoritesController.instance
              .isFavorite(collocation.colocacao);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CollocationHeader(
                collocation: collocation,
                isFavorited: isFavorited,
                pageContext: context,
              ),
              const SizedBox(height: 24),
              Text(
                collocation.fonetica,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: Color(0xFF4A4F55),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                collocation.traducao.isNotEmpty
                    ? collocation.traducao
                    : 'Tradução não disponível',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 32),
              ExamplesSection(
                exemploEn: collocation.exemploEn,
                exemploPt: collocation.exemploPt,
              ),
              const SizedBox(height: 24),
              LearnMoreSection(
                infClasse: collocation.infClasse,
                infEstrutura: collocation.infEstrutura,
                observacao: collocation.observacao,
                fontes: collocation.fontes,
              ),
            ],
          );
        },
      ),
    );
  }
}