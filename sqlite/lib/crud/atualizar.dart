import 'package:flutter/material.dart';

class Atualizar extends StatelessWidget {
  const Atualizar({super.key});

  // lógica para coletar os dados e salvar no banco

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
          ),
          onPressed: () {},
          child: const Text('Atualizar', style: TextStyle(fontSize: 30)),
        ),
      ],
    ));
  }
}
