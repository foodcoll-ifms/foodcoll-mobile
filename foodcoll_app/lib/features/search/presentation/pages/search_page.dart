import 'package:flutter/material.dart';
import '../../../../core/base_page.dart';
import '../../../../core/state/favorites_controller.dart';
import '../../../../core/state/historico_controller.dart';
import '../../../../shared/models/collocation_model.dart';
import '../../../../shared/widgets/collocation_card.dart';
import '../../../../shared/widgets/collocation_list.dart';
import '../../data/search_service.dart';
import '../widgets/search_input.dart';
import '../widgets/suggestion_button.dart';
import '../../../../features/collocations/presentation/pages/collocations_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  final _searchService = SearchService();

  List<CollocationModel> _resultados = [];
  bool _isLoading = false;
  bool _mostrandoHistorico = true;
  String? _erro;

  @override
  void initState() {
    super.initState();
    HistoricoController.instance.addListener(_onControllerUpdate);
    FavoritesController.instance.addListener(_onControllerUpdate);
  }

  @override
  void dispose() {
    HistoricoController.instance.removeListener(_onControllerUpdate);
    FavoritesController.instance.removeListener(_onControllerUpdate);
    _searchController.dispose();
    super.dispose();
  }

  void _onControllerUpdate() {
    if (mounted) setState(() {});
  }

  Future<void> _buscar(String query) async {
    if (query.trim().isEmpty) {
      if (mounted) {
        setState(() {
          _resultados = [];
          _erro = null;
          _mostrandoHistorico = true;
        });
      }
      return;
    }

    if (mounted) {
      setState(() {
        _isLoading = true;
        _erro = null;
        _mostrandoHistorico = false;
      });
    }

    try {
      final resultados = await _searchService.buscar(query);
      if (mounted) setState(() => _resultados = resultados);
    } catch (e) {
      if (mounted) {
        setState(() {
          _resultados = [];
          _erro = 'Não foi possível conectar ao servidor.';
        });
      }
      debugPrint('Erro ao buscar: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Widget _buildHistorico(List<CollocationModel> historico) {
    if (historico.isEmpty) {
      return const Center(
        child: Text(
          'Nenhuma busca recente.',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: Color(0xFF4A4F55),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Última(s) pesquisa(s)',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4A4F55),
            ),
          ),
          const SizedBox(height: 8),
          ...historico
              .take(10)
              .map(
                (item) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => CollocationsPage(collocation: item),
                      ),
                    );
                  },
                  child: CollocationCard(
                    collocation: item.colocacao,
                    translation: item.traducao,
                    isFavorited: FavoritesController.instance.isFavorite(
                      item.colocacao,
                    ),
                    onFavoriteToggle:
                        () => FavoritesController.instance.toggleFavorite(item),
                  ),
                ),
              ),
        ],
      ),
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

    if (_mostrandoHistorico) {
      return _buildHistorico(HistoricoController.instance.historico);
    }

    return CollocationList(
      collocations: _resultados,
      isFavorited: FavoritesController.instance.isFavorite,
      onFavoriteToggle: FavoritesController.instance.toggleFavorite,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Buscar',
      currentIndex: 1,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchInput(controller: _searchController, onChanged: _buscar),
          const SizedBox(height: 16),
          Flexible(child: _buildBody()),
          const SizedBox(height: 16),
          const SuggestionButton(),
        ],
      ),
    );
  }
}
