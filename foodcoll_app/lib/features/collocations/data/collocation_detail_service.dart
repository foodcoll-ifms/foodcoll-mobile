import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../shared/models/collocation_model.dart';
import '../../../shared/config/api_config.dart';

class CollocationDetailService {
  Future<CollocationModel> buscarDetalhes(String colocacao) async {
    final encoded = Uri.encodeComponent(colocacao);
    final url = Uri.parse('${ApiConfig.baseUrl}/detalheTermos/$encoded');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Erro ao buscar detalhes: ${response.statusCode}');
    }

    final data = jsonDecode(response.body);
    return CollocationModel.fromJson(data);
  }
}