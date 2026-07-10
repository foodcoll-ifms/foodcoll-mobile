import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import '../state/app_controller.dart';

final AudioPlayer _player = AudioPlayer();

void tocarFeedbackConfirmacao() {
  if (!AppController.instance.somAtivado) return;
  _player.play(AssetSource('sounds/confirm.mp3'));
  HapticFeedback.lightImpact();
}