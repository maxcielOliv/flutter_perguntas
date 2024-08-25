import 'package:flutter/material.dart';
import 'questionario.dart';
import 'resultado.dart';

main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  int perguntaSelecionada = 0;
  int pontuacaoTotal = 0;
  final perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 7},
        {'texto': 'Branco', 'pontuacao': 8}
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 7},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 6},
        {'texto': 'Leão', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual é a sua comida favorita?',
      'respostas': [
        {'texto': 'Lasanha', 'pontuacao': 3},
        {'texto': 'Pizza', 'pontuacao': 7},
        {'texto': 'Feiojada', 'pontuacao': 9},
        {'texto': 'Hambúrguer', 'pontuacao': 5},
      ]
    },
    {
      'texto': 'Qual é a sua matéria favorita?',
      'respostas': [
        {'texto': 'Português', 'pontuacao': 1},
        {'texto': 'Matemática', 'pontuacao': 9},
        {'texto': 'Geografia', 'pontuacao': 6},
        {'texto': 'História', 'pontuacao': 5},
      ]
    }
  ];

  final separador = const SizedBox(height: 10);

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      perguntaSelecionada = 0;
      pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Perguntas',
          ),
          centerTitle: true,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: perguntas,
                perguntaSelecionada: perguntaSelecionada,
                responder: _responder)
            : Resultado(
                pontuacao: pontuacaoTotal,
                quandoReiniciarQuestionario: _reiniciarQuestionario,
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
