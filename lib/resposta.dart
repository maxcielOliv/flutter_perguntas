import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelecao;
  const Resposta({super.key, required this.texto, required this.onSelecao});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSelecao,
        child: Text(texto),
      ),
    );
  }
}
