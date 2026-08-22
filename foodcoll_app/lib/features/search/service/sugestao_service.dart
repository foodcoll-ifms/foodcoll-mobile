// lib/features/pesquisa/services/sugestao_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../shared/config/api_config.dart';

Future<bool> enviarSugestao(String colocacao) async {
  final uri = Uri.parse('${ApiConfig.baseUrl}/feedback/sugestão')
      .replace(queryParameters: {'info': colocacao});

  final response = await http
      .get(uri)
      .timeout(const Duration(seconds: 10));

  if (response.statusCode == 200) {
    final resultado = jsonDecode(response.body);
    return resultado == true;
  }

  throw Exception('Erro ao enviar sugestão: ${response.statusCode}');
}