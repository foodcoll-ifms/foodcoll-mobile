class CollocationModel {
  final String colocacao;
  final String traducao;
  final String fonetica;
  final String exemploEn;
  final String exemploPt;
  final String infClasse;
  final String infEstrutura;
  final String observacao;
  final List<String> remissivas;
  final List<Map<String, dynamic>> fontes;

  CollocationModel({
    required this.colocacao,
    required this.traducao,
    this.fonetica = '',
    this.exemploEn = '',
    this.exemploPt = '',
    this.infClasse = '',
    this.infEstrutura = '',
    this.observacao = '',
    this.remissivas = const [],
    this.fontes = const [],
  });

  factory CollocationModel.fromJson(Map<String, dynamic> json) {
    final exemplos = json['exemplos_uso'] as List? ?? [];
    final infGramatical =
        json['informacoes_gramaticais'] as Map<String, dynamic>? ?? {};

    final exemploEn = exemplos.isNotEmpty ? (exemplos[0]['en'] ?? '') : '';
    final exemploPt = exemplos.isNotEmpty ? (exemplos[0]['pt'] ?? '') : '';

    return CollocationModel(
      colocacao: json['colocacao']?.toString() ?? '',
      traducao: json['traducao']?.toString() ?? '',
      fonetica: json['fonetica']?.toString() ?? '',
      exemploEn: exemploEn.toString(),
      exemploPt: exemploPt.toString(),
      infClasse: infGramatical['classe']?.toString() ?? '',
      infEstrutura: infGramatical['estrutura']?.toString() ?? '',
      observacao: json['observacao']?.toString() ?? '',
      remissivas: List<String>.from(json['remissivas'] ?? []),
      fontes: List<Map<String, dynamic>>.from(json['fontes'] ?? []),
    );
  }
}
