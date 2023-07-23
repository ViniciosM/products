import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Modular.to.pushReplacementNamed('/product');
    });

    return const Scaffold(
      body: SafeArea(
          child: Center(
        child: Text('PRODUTOS API'),
      )),
    );
  }
}
