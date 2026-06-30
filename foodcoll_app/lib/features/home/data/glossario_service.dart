import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../shared/models/collocation_model.dart';
import '../../../shared/config/api_config.dart';

class GlossarioService {
  Future<List<CollocationModel>> listarTodas() async {
    final url = Uri.parse('${ApiConfig.baseUrl}/glossario');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Erro ao carregar glossário: ${response.statusCode}');
    }

    final List data = jsonDecode(response.body);
    return data.map((item) => CollocationModel.fromJson(item)).toList();
  }
}
