import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../../shared/models/collocation_model.dart';

class SearchService {
  static String get _baseUrl {
    if (kIsWeb) return 'http://localhost:3000';
    return 'http://10.0.2.2:3000';
  }

  Future<List<CollocationModel>> buscar(String query) async {
    final url = Uri.parse('$_baseUrl/search?q=${Uri.encodeComponent(query)}');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Erro na busca: ${response.statusCode}');
    }

    final List data = jsonDecode(response.body);
    return data.map((item) => CollocationModel.fromJson(item)).toList();
  }
}