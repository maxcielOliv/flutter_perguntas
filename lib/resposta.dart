import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelecao;
  const Resposta({super.key, required this.texto, required this.onSelecao});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 40,
          child: ElevatedButton(
            onPressed: onSelecao,
            child: SizedBox(
              child: Text(texto),
              height: 20,
            ),
          ),
        ),
      ],
    );
  }
}
