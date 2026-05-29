import 'package:flutter/material.dart';
import '../../../../core/base_page.dart';
import '../../../../core/state/favorites_controller.dart';
import '../../../../shared/models/collocation_model.dart';
import '../../../../shared/widgets/collocation_list.dart';
import '../../data/search_service.dart';
import '../widgets/search_input.dart';
import '../widgets/suggestion_button.dart';

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
  String? _erro;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _buscar(String query) async {
    if (query.trim().isEmpty) {
      if (mounted) {
        setState(() {
          _resultados = [];
          _erro = null;
        });
      }
      return;
    }

    if (mounted) {
      setState(() {
        _isLoading = true;
        _erro = null;
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

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_erro != null) {
      return Center(
        child: Text(_erro!, style: const TextStyle(color: Colors.red)),
      );
    }

    return AnimatedBuilder(
      animation: FavoritesController.instance,
      builder:
          (context, _) => CollocationList(
            collocations: _resultados,
            isFavorited: FavoritesController.instance.isFavorite,
            onFavoriteToggle: FavoritesController.instance.toggleFavorite,
          ),
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
          Expanded(child: _buildBody()),
          const SizedBox(height: 16),
          const SuggestionButton(),
        ],
      ),
    );
  }
}
