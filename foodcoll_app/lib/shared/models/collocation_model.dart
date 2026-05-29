class CollocationModel {
  final String colocacao;
  final String traducao;

  CollocationModel({
    required this.colocacao,
    required this.traducao,
  });

  factory CollocationModel.fromJson(Map<String, dynamic> json) {
    return CollocationModel(
      colocacao: json['colocacao'] ?? '',
      traducao: json['traducao'] ?? '',
    );
  }
}