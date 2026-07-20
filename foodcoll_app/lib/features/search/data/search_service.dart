import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../shared/models/collocation_model.dart';
import '../../../shared/config/api_config.dart';

class SearchService {
  Future<List<CollocationModel>> buscar(String query) async {
    final url = Uri.parse('${ApiConfig.baseUrl}/pesquisa?q=${Uri.encodeComponent(query)}');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Erro na busca: ${response.statusCode}');
    }

    final List data = jsonDecode(response.body);
    return data.map((item) => CollocationModel.fromJson(item)).toList();
  }
}