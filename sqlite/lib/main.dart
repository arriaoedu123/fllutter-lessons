import 'package:flutter/material.dart';

import 'crud/incluir.dart';
import 'crud/listar.dart';
import 'crud/atualizar.dart';
import 'crud/excluir.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD SQLite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4, // número de abas
        // criação das abas
        child: Scaffold(
            appBar: AppBar(
                title: const Text('CRUD SQLite'),
                bottom: const TabBar(tabs: [
                  Tab(
                    icon: Icon(Icons.add),
                    text: 'Adicionar',
                  ),
                  Tab(
                    icon: Icon(Icons.list),
                    text: 'Listar',
                  ),
                  Tab(
                    icon: Icon(Icons.edit),
                    text: 'Editar',
                  ),
                  Tab(
                    icon: Icon(Icons.delete),
                    text: 'Deletar',
                  ),
                ])),
            body: TabBarView(children: [
              // conteúdo das abas
              Incluir(),
              Listar(),
              Atualizar(),
              Excluir(),
            ])),
      ),
    );
  }
}
