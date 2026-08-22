import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'slug.dart';

final AudioPlayer _player = AudioPlayer();

/// Toca o áudio de pronúncia do termo, se o arquivo existir nos assets.
/// Falha silenciosamente (só loga) quando o áudio daquele termo específico
Future<void> tocarPronuncia(String termo) async {
  // audioplayers espera o caminho relativo à pasta "assets/", sem o prefixo
  final caminho = audioAssetPath(termo).replaceFirst('assets/', '');

  try {
    await _player.stop();
    await _player.play(AssetSource(caminho));
  } catch (e) {
    debugPrint('Áudio de pronúncia não encontrado para "$termo": $e');
  }
}