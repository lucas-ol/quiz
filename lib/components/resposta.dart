import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  const Resposta(this._texto, this._quandoSelecionado, {super.key});
  final String _texto;
  final void Function() _quandoSelecionado;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _quandoSelecionado,
        child: Text(
          _texto,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
