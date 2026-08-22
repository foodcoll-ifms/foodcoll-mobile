import 'package:flutter/material.dart';
import '../../../../shared/widgets/app_dialog.dart';
import '../../../../core/utils/feedback_sonoro.dart';
import '../../service/sugestao_service.dart';

class SuggestionButton extends StatelessWidget {
  const SuggestionButton({super.key});

  void _mostrarMensagem(BuildContext context, String texto, {bool erro = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(texto),
        backgroundColor: erro ? Colors.redAccent : const Color(0xFF1FA7A6),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showDialog(BuildContext pageContext) {
    final controller = TextEditingController();
    showDialog(
      context: pageContext,
      builder: (dialogContext) => AppDialog(
        title: 'Enviar sugestão',
        hintText: 'Digite uma colocação',
        controller: controller,
        confirmText: 'Enviar',
        cancelText: 'Cancelar',
        onConfirm: () async {
          final suggestion = controller.text.trim();

          if (suggestion.isEmpty) return;

          // validação local: colocação precisa ter mais de uma palavra
          if (suggestion.split(' ').length <= 1) {
            _mostrarMensagem(
              pageContext,
              'Colocações precisam ter mais de uma palavra.',
              erro: true,
            );
            return; // mantém o diálogo aberto pra corrigir
          }

          try {
            final sucesso = await enviarSugestao(suggestion);

            if (dialogContext.mounted) Navigator.of(dialogContext).pop();

            if (sucesso) {
              tocarFeedbackConfirmacao();
              _mostrarMensagem(pageContext, 'Sugestão enviada, obrigado!');
            } else {
              _mostrarMensagem(
                pageContext,
                'Esse termo já existe no glossário ou não pôde ser registrado.',
                erro: true,
              );
            }
          } catch (e) {
            debugPrint('Falha ao enviar sugestão: $e');
            if (dialogContext.mounted) Navigator.of(dialogContext).pop();
            _mostrarMensagem(
              pageContext,
              'Não foi possível enviar. Verifique sua conexão e tente novamente.',
              erro: true,
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: () => _showDialog(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: isDark
                ? const Color(0xFF1F2429)
                : const Color(0xFFE9EEF0),
            foregroundColor: isDark
                ? const Color(0xFF7A848C)
                : const Color(0xFF4A4F55),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Enviar sugestão de colocação',
            style: TextStyle(fontFamily: 'Inter', fontSize: 16),
          ),
        ),
      ),
    );
  }
}