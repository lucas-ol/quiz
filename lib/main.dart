import 'package:flutter/material.dart';
import 'package:quiz/components/resposta.dart';
import 'package:quiz/components/resultado.dart';

import 'components/questao.dart';
import 'components/questionario.dart';

void main(List<String> args) {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = [
    {
      "texto": 'Qual sua cor preferida?',
      "respostas": [
        {
          'texto': 'Preto',
          'nota': 10,
        },
        {
          'texto': 'Vermelho',
          'nota': 5,
        },
        {
          'texto': 'Azul',
          'nota': 8,
        },
      ]
    },
    {
      "texto": 'Qual seu animal preferido?',
      "respostas": [
        {
          'texto': 'Coelho',
          'nota': -30,
        },
        {
          'texto': 'Cachorro',
          'nota': 10,
        },
        {
          'texto': 'Gato',
          'nota': 10,
        },
      ]
    },
    {
      "texto": 'Qual é seu instrutor favorito?',
      "respostas": [
        {
          'texto': 'Maria',
          'nota': -10,
        },
        {
          'texto': 'Lucas',
          'nota': 10,
        },
      ]
    }
  ];
  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuiz() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>>? respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]["respostas"]
            as List<Map<String, Object>>
        : null;

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text("Perguntas")),
      body: temPerguntaSelecionada
          ? Questionario(
              responder: _responder,
              respostas: respostas!,
              textoPergunta:
                  _perguntas[_perguntaSelecionada]['texto'].toString(),
            )
          : Resultado("Respondido nota", _pontuacaoTotal, _reiniciarQuiz),
    ));
  }
}
