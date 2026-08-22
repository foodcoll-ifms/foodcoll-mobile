import 'package:flutter/material.dart';
import '../../../../shared/widgets/app_dialog.dart';
import '../../../../core/utils/feedback_sonoro.dart';
import '../../service/sugestao_service.dart';

class SuggestionButton extends StatelessWidget {
  const SuggestionButton({super.key});

  void _showDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder:
          (dialogContext) => AppDialog(
            title: 'Enviar sugestão',
            hintText: 'Digite uma colocação',
            controller: controller,
            confirmText: 'Enviar',
            cancelText: 'Cancelar',
            onConfirm: () async {
              final suggestion = controller.text.trim();
              if (suggestion.isEmpty) return;

              try {
                final sucesso = await enviarSugestao(suggestion);
                if (sucesso) {
                  tocarFeedbackConfirmacao();
                }
                if (dialogContext.mounted) Navigator.of(dialogContext).pop();
              } catch (e) {
                debugPrint('Falha ao enviar sugestão: $e');
                // TODO: mostrar feedback de erro ao usuário (SnackBar, por exemplo)
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
            backgroundColor:
                isDark ? const Color(0xFF1F2429) : const Color(0xFFE9EEF0),
            foregroundColor:
                isDark ? const Color(0xFF7A848C) : const Color(0xFF4A4F55),
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
