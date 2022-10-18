import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite/helper.dart';

class Listar extends StatelessWidget {
  Listar({super.key});

  // lógica para mostrar os dados do banco de dados e exibir na tela
  final dbHelper = DatabaseHelper.instance;

  void _query() async {
    final allRows = await dbHelper.queryAllCrescente();
    print('query all rows:');
    allRows.forEach((row) => print(row));
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
          onPressed: () {},
          child: const Text('Listar', style: TextStyle(fontSize: 30)),
        ),
      ],
    ));
  }
}
