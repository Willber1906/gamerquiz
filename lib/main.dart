import 'package:flutter/material.dart';
import 'tela_inicial.dart';

void main() {
  runApp(const GamerQUIZ());
}

class GamerQUIZ extends StatelessWidget {
  const GamerQUIZ({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TelaInicial(),
      debugShowCheckedModeBanner: false,
    );
  }
}
