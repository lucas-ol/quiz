import 'package:flutter/cupertino.dart';

class Questao extends StatelessWidget {
  const Questao(this._texto, {super.key});
  final String _texto;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      child: Text(
        _texto,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 28,
        ),
      ),
    );
  }
}
