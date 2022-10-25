import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite/helper.dart';

class Excluir extends StatelessWidget {
  Excluir({super.key});

  // lógica para excluir um registro no banco de dados
  final dbHelper = DatabaseHelper.instance;

  void _excluir() async {
    await dbHelper.delete(1);
    print('Registro excluído com sucesso');
  }

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
          onPressed: () {
            _excluir();
          },
          child: const Text('Excluir', style: TextStyle(fontSize: 30)),
        ),
      ],
    ));
  }
}
