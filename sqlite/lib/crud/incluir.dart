import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite/helper.dart';

class Incluir extends StatelessWidget {
  Incluir({super.key});

  // lógica de inclusão
  final dbHelper = DatabaseHelper.instance;

  void _inserir() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnNome: 'Maria',
      DatabaseHelper.columnIdade: 25
    };

    final id = await dbHelper.insert(row);
    print('Registro inserido com sucesso: $id');
  }

  TextEditingController incluirControler = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: incluirControler,
                      textAlign: TextAlign.center,
                      validator: ((value) =>
                          value!.isEmpty ? "Informe o valor a incluir" : null),
                      decoration: const InputDecoration(
                          labelText: 'Informe o valor a incluir',
                          labelStyle: TextStyle(fontSize: 18)),
                    ),
                  )
                ],
              )),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.black),
            onPressed: () {
              _inserir();
            },
            child: const Text(
              "Incluir",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
