import 'package:flutter/material.dart';
import 'core/state/historico_controller.dart';
import 'features/collocations/presentation/pages/collocations_page.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/search/presentation/pages/search_page.dart';
import 'features/favorites/presentation/pages/favorites_page.dart';
import 'features/settings/presentation/pages/settings_page.dart';
import 'shared/models/collocation_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HistoricoController.instance.carregar();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      theme: ThemeData(),
      routes: {
        '/home': (_) => const HomePage(),
        '/search': (_) => const SearchPage(),
        '/favorites': (_) => const FavoritesPage(),
        '/settings': (_) => const SettingsPage(),
        '/collocations': (context) {
          final args = ModalRoute.of(context)!.settings.arguments;
          final collocation =
              args is CollocationModel
                  ? args
                  : CollocationModel(
                    colocacao: args?.toString() ?? '',
                    traducao: '',
                  );
          return CollocationsPage(collocation: collocation);
        },
      },
    );
  }
}
