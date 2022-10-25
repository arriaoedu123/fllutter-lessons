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

  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();

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
                  Container(
                    width: 300,
                    child: TextFormField(
                      controller: nomeController,
                      textAlign: TextAlign.center,
                      validator: ((value) =>
                          value!.isEmpty ? "Informe o nome" : null),
                      decoration: const InputDecoration(
                        labelText: 'Informe o nome',
                        labelStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    child: TextFormField(
                      controller: idadeController,
                      textAlign: TextAlign.center,
                      validator: ((value) =>
                          value!.isEmpty ? "Informe a idade" : null),
                      decoration: const InputDecoration(
                          labelText: 'Informe a idade',
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
