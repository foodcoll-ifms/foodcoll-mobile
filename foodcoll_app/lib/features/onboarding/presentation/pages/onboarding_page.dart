import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _paginaAtual = 0;

  final List<Map<String, String>> _paginas = [
    {
      'titulo': 'Aprenda colocações com facilidade',
      'descricao':
          'Pesquise por colocações em inglês usadas na área de Ciência e Tecnologia de Alimentos.',
      'imagem': 'assets/images/1.png',
    },
    {
      'titulo': 'Veja exemplos e pronúncias',
      'descricao':
          'Cada colocação apresenta tradução, exemplos em frases e áudio para praticar a pronúncia.',
      'imagem': 'assets/images/2.png',
    },
    {
      'titulo': 'Salve e consulte quando quiser',
      'descricao':
          'Favorite colocações importantes e acesse rapidamente sempre que precisar.',
      'imagem': 'assets/images/3.png',
    },
  ];

  Future<void> _finalizarOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_completo', true);

    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/entrada');
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ultimaPagina = _paginaAtual == _paginas.length - 1;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors:
                Theme.of(context).brightness == Brightness.dark
                    ? [const Color(0xFF10312F), const Color(0xFF121212)]
                    : [const Color(0xFF1FA7A6), Colors.white],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _paginas.length,
                  onPageChanged:
                      (index) => setState(() => _paginaAtual = index),
                  itemBuilder: (context, index) {
                    final pagina = _paginas[index];
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        final alturaImagem = (constraints.maxHeight * 0.4)
                            .clamp(200.0, 400.0);

                        return SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxHeight: alturaImagem,
                                    ),
                                    child: Image.asset(
                                      pagina['imagem']!,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(height: 32),
                                  Text(
                                    pagina['titulo']!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    pagina['descricao']!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      color: Color(0xFF4A4F55),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _paginas.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          index == _paginaAtual
                              ? const Color(0xFF1FA7A6)
                              : const Color(0xFFA8D5D4),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed:
                        ultimaPagina
                            ? _finalizarOnboarding
                            : () => _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1FA7A6),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(ultimaPagina ? 'Começar' : 'Próximo'),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
