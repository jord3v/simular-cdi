import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/simulation.dart';

class ApiService {
  static const String baseUrl = 'https://api.desenvolvimento-0d9.workers.dev/api/cdi';

  static Future<SimulationResult> fetchSimulation({
    required double valorInicial,
    required double percentualCdi,
    required String dataInicial,
    required double aporteMensal,
    required int diaAporte,
    String? dataFinal,
  }) async {
    final queryParams = {
      'valorInicial': valorInicial.toString(),
      'percentualCdi': percentualCdi.toString(),
      'dataInicial': dataInicial,
      'aporteMensal': aporteMensal.toString(),
      'diaAporte': diaAporte.toString(),
    };

    if (dataFinal != null && dataFinal.isNotEmpty) {
      queryParams['dataFinal'] = dataFinal;
    }

    final uri = Uri.parse(baseUrl).replace(queryParameters: queryParams);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return SimulationResult.fromJson(json.decode(response.body));
    } else {
      final errorJson = json.decode(response.body);
      throw Exception(errorJson['error'] ?? 'Erro desconhecido da API');
    }
  }
}
