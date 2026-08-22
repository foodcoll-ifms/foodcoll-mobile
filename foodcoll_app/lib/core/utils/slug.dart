/// Converte o nome de um termo/colocação em um slug determinístico,
/// usado para derivar nomes de arquivos de mídia (áudio, imagem).
///
/// Regra fixa: minúsculas, sem acento, espaços e caracteres especiais
/// viram underscore. Essa função é a ÚNICA fonte de verdade para gerar
/// nomes de arquivo — qualquer mídia produzida (pelo Pedro, por exemplo)
/// deve seguir exatamente esse resultado.
///
/// Exemplos:
///   slugify('Food Safety')       -> 'food_safety'
///   slugify('Cross-Contamination') -> 'cross_contamination'
///   slugify('Não é uma-palavra')   -> 'nao_e_uma_palavra'
String slugify(String termo) {
  var resultado = termo.trim().toLowerCase();

  const comAcento = 'àáâãäåèéêëìíîïòóôõöùúûüçñ';
  const semAcento = 'aaaaaaeeeeiiiiooooouuuucn';

  for (var i = 0; i < comAcento.length; i++) {
    resultado = resultado.replaceAll(comAcento[i], semAcento[i]);
  }

  // qualquer coisa que não seja letra ou número vira underscore
  resultado = resultado.replaceAll(RegExp(r'[^a-z0-9]+'), '_');

  // remove underscores duplicados e das pontas
  resultado = resultado.replaceAll(RegExp(r'_+'), '_');
  resultado = resultado.replaceAll(RegExp(r'^_|_$'), '');

  return resultado;
}

/// Caminho do asset de áudio de pronúncia para um termo
String audioAssetPath(String termo) => 'assets/audio/${slugify(termo)}.mp3';

/// Caminho do asset de imagem ilustrativa.
String imageAssetPath(String termo) => 'assets/images/termos/${slugify(termo)}.png';