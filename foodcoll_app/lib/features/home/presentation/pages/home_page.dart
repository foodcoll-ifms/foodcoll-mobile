import 'package:flutter/material.dart';
import '../../../../core/base_page.dart';
import '../../../../core/state/favorites_controller.dart';
import '../../../../core/state/historico_controller.dart';
import '../../../../shared/models/collocation_model.dart';
import '../../data/glossario_service.dart';
import '../widgets/trending_chip.dart';
import '../../../../shared/widgets/collocation_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _glossarioService = GlossarioService();

  List<CollocationModel> _glossario = [];
  bool _isLoading = true;
  String? _erro;

  final List<String> _trending = [
    'Food Processing',
    'Quality Control',
    'Food Safety',
    'Shelf Life',
    'Heat Treatment',
  ];

  @override
  void initState() {
    super.initState();
    FavoritesController.instance.addListener(_onUpdate);
    _carregarGlossario();
  }

  @override
  void dispose() {
    FavoritesController.instance.removeListener(_onUpdate);
    super.dispose();
  }

  void _onUpdate() {
    if (mounted) setState(() {});
  }

  Future<void> _carregarGlossario() async {
    try {
      final resultado = await _glossarioService.listarTodas();
      if (mounted) setState(() => _glossario = resultado);
    } catch (e) {
      if (mounted) setState(() => _erro = 'Erro ao carregar glossário.');
      debugPrint('Erro: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Widget _buildSaudacao() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Seja bem-vindo(a), Aluno!',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1FA7A6),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Pesquise termos técnicos, ouça a pronúncia e salve seus favoritos.',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: Color(0xFF4A4F55),
          ),
        ),
      ],
    );
  }

  Widget _buildTrending() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Termos em Destaque (Trending)',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                _trending.map((termo) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: TrendingChip(label: termo),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Home',
      currentIndex: 0,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSaudacao(),
                const SizedBox(height: 24),
                _buildTrending(),
                const SizedBox(height: 24),
                const Text(
                  'Glossário (Ordem Alfabética)',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                if (_isLoading)
                  const Center(child: CircularProgressIndicator())
                else if (_erro != null)
                  Center(
                    child: Text(
                      _erro!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          ),
          if (!_isLoading && _erro == null)
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final collocation = _glossario[index];
                return InkWell(
                  onTap: () {
                    HistoricoController.instance.adicionar(collocation);
                    Navigator.pushNamed(
                      context,
                      '/collocations',
                      arguments: collocation,
                    );
                  },
                  child: CollocationCard(
                    collocation: collocation.colocacao,
                    translation: collocation.traducao,
                    isFavorited: FavoritesController.instance.isFavorite(
                      collocation.colocacao,
                    ),
                    onFavoriteToggle:
                        () => FavoritesController.instance.toggleFavorite(
                          collocation,
                        ),
                  ),
                );
              }, childCount: _glossario.length),
            ),
        ],
      ),
    );
  }
}