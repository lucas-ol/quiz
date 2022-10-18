import 'package:flutter/material.dart';
import 'package:quiz/components/questao.dart';
import 'package:quiz/components/resposta.dart';

class Questionario extends StatelessWidget {
  const Questionario(
      {super.key,
      required this.textoPergunta,
      required this.responder,
      required this.respostas});
  final String textoPergunta;
  final void Function(int pontuacao) responder;
  final List<Map<String, Object>> respostas;

  @override
  Widget build(BuildContext context) {
    List<Widget>? widgets = respostas
        .map((e) =>
            Resposta(e["texto"].toString(), () => responder(e["nota"] as int)))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Questao(textoPergunta), ...widgets],
    );
  }
}
