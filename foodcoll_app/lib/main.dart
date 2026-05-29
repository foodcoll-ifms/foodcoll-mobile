import 'package:flutter/material.dart';
import 'features/collocations/presentation/pages/collocations_page.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/search/presentation/pages/search_page.dart';
import 'features/favorites/presentation/pages/favorites_page.dart';
import 'features/settings/presentation/pages/settings_page.dart';
import 'shared/models/collocation_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            for (final platform in TargetPlatform.values)
              platform: const _FadeTransitionsBuilder(),
          },
        ),
      ),
      routes: {
        '/home': (_) => const HomePage(),
        '/search': (_) => const SearchPage(),
        '/favorites': (_) => const FavoritesPage(),
        '/settings': (_) => const SettingsPage(),
        '/collocations': (context) {
          final args = ModalRoute.of(context)!.settings.arguments;

          // suporta tanto String quanto CollocationModel
          final collocation =
              args is CollocationModel
                  ? args
                  : CollocationModel(colocacao: args as String, traducao: '');

          return CollocationsPage(collocation: collocation);
        },
      },
    );
  }
}

class _FadeTransitionsBuilder extends PageTransitionsBuilder {
  const _FadeTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) => FadeTransition(opacity: animation, child: child);
}
