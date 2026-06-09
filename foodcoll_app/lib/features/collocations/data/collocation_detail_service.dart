import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../shared/models/collocation_model.dart';

class CollocationDetailService {
  static const _baseUrl = 'https://foodcoll-mobile-production.up.railway.app';

  Future<CollocationModel> buscarDetalhes(String colocacao) async {
    final encoded = Uri.encodeComponent(colocacao);
    final url = Uri.parse('$_baseUrl/detalheTermos/$encoded');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Erro ao buscar detalhes: ${response.statusCode}');
    }

    final data = jsonDecode(response.body);
    return CollocationModel.fromJson(data);
  }
}