import 'package:flutter/material.dart';
import '../../../../core/base_page.dart';
import '../../../../core/state/app_controller.dart';
import '../../../../shared/widgets/page_header.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Configurações',
      currentIndex: 3,
      body: AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, _) {
          return Column(
            spacing: 30,
            children: [
              PageHeader(title: "Configurações", onBack: () => true),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SwitchListTile(
                    secondary: const Icon(Icons.dark_mode, color: Color(0xFF1FA7A6)),
                    minLeadingWidth: 60,
                    title: const Text("Modo Escuro"),
                    value: AppController.instance.darkMode,
                    onChanged: (_) => AppController.instance.toggleDarkMode(),
                    inactiveTrackColor: const Color(0xFFA8D5D4),
                    inactiveThumbColor: const Color(0xFFFFFFFF),
                    activeThumbColor: const Color(0xFFFFFFFF),
                    activeTrackColor: const Color(0xFFA8D5D4),
                    trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                  ),
                  const Divider(color: Color(0xFFA8D5D4), thickness: 2),
                  SwitchListTile(
                    secondary: const Icon(Icons.volume_up, color: Color(0xFF1FA7A6)),
                    minLeadingWidth: 60,
                    title: const Text("Feedback sonoro"),
                    value: AppController.instance.somAtivado,
                    onChanged: (_) => AppController.instance.toggleSom(),
                    inactiveTrackColor: const Color(0xFFA8D5D4),
                    inactiveThumbColor: const Color(0xFFFFFFFF),
                    activeThumbColor: const Color(0xFFFFFFFF),
                    activeTrackColor: const Color(0xFFA8D5D4),
                    trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                  ),
                  const Divider(color: Color(0xFFA8D5D4), thickness: 2),
                  ListTile(
                    leading: const Icon(Icons.format_size, color: Color(0xFF1FA7A6)),
                    minLeadingWidth: 60,
                    title: const Text("Tamanho da fonte"),
                    trailing: DropdownButton<double>(
                      icon: const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Color(0xFFA8D5D4),
                      ),
                      value: AppController.instance.fontSize,
                      underline: const SizedBox(),
                      items: const [
                        DropdownMenuItem(value: 1.0, child: Text("P")),
                        DropdownMenuItem(value: 1.15, child: Text("M")),
                        DropdownMenuItem(value: 1.3, child: Text("G")),
                      ],
                      onChanged: (value) {
                        if (value != null) AppController.instance.setFontSize(value);
                      },
                    ),
                  ),
                  const Divider(color: Color(0xFFA8D5D4), thickness: 2),
                  ListTile(
                    leading: const Icon(Icons.info, color: Color(0xFF1FA7A6)),
                    minLeadingWidth: 60,
                    title: const Text("Sobre o App"),
                    onTap: () => showAboutDialog(
                      context: context,
                      applicationName: 'FoodColl',
                      applicationVersion: '1.0.0',
                      applicationLegalese: 'Projeto de Iniciação Científica',
                    ),
                  ),
                  const Divider(color: Color(0xFFA8D5D4), thickness: 2),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}