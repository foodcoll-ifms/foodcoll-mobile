import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _decidirRota();
  }

  Future<void> _decidirRota() async {
    final prefs = await SharedPreferences.getInstance();
    final onboardingCompleto = prefs.getBool('onboarding_completo') ?? false;

    if (!mounted) return;

    Navigator.pushReplacementNamed(
      context,
      onboardingCompleto ? '/home' : '/onboarding',
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}