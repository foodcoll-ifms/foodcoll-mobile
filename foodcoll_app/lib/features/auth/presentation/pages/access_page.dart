import 'package:flutter/material.dart';

class AccessPage extends StatelessWidget {
  const AccessPage({super.key});

  void _entrarAnonimo(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors:
                isDark
                    ? [const Color(0xFF121212), const Color(0xFF10312F)]
                    : [Colors.white, const Color(0xFFA8D5D4)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/logotipo-foodcoll.png',
                          height: 80,
                        ),
                        // const SizedBox(height: 32),
                        // const Text(
                        //   'FoodColl',
                        //   style: TextStyle(
                        //     fontFamily: 'Poppins',
                        //     fontSize: 26,
                        //     fontWeight: FontWeight.w600,
                        //     color: Color(0xFF1FA7A6),
                        //   ),
                        // ),
                        const SizedBox(height: 8),
                        const Text(
                          'Colocações da Ciência e Tecnologia\n de Alimentos',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 24,
                            color: Color(0xFF4A4F55),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () => _entrarAnonimo(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1FA7A6),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Entrar como convidado'),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Login com conta em breve',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}