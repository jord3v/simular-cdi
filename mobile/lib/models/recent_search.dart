import 'dart:convert';

class RecentSearch {
  final double valorInicial;
  final double percentualCdi;
  final double aporteMensal;
  final int diaAporte;
  final String dataInicial;
  final String timestamp;

  RecentSearch({
    required this.valorInicial,
    required this.percentualCdi,
    required this.aporteMensal,
    required this.diaAporte,
    required this.dataInicial,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'valorInicial': valorInicial,
      'percentualCdi': percentualCdi,
      'aporteMensal': aporteMensal,
      'diaAporte': diaAporte,
      'dataInicial': dataInicial,
      'timestamp': timestamp,
    };
  }

  factory RecentSearch.fromMap(Map<String, dynamic> map) {
    return RecentSearch(
      valorInicial: map['valorInicial']?.toDouble() ?? 0.0,
      percentualCdi: map['percentualCdi']?.toDouble() ?? 0.0,
      aporteMensal: map['aporteMensal']?.toDouble() ?? 0.0,
      diaAporte: map['diaAporte']?.toInt() ?? 1,
      dataInicial: map['dataInicial'] ?? '',
      timestamp: map['timestamp'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RecentSearch.fromJson(String source) => RecentSearch.fromMap(json.decode(source));
}
