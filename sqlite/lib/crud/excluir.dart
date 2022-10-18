import 'package:flutter/material.dart';

class Excluir extends StatelessWidget {
  const Excluir({super.key});

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
          child: const Text('Excluir', style: TextStyle(fontSize: 30)),
        ),
      ],
    ));
  }
}
