// importação dos arquivos
// ignore_for_file: unused_import

import 'dart:io'; // gravação de arquivos
import 'package:path/path.dart'; // manipulação de caminhos
import 'package:path_provider/path_provider.dart'; // provedor de caminhos
import 'package:sqflite/sqflite.dart'; // banco de dados

// classe principal da conexão com o banco de dados
class DatabaseHelper {
  // variáveis globais do banco de dados
  static const _databaseName = 'sqliteDB.db'; // nome do banco de dados
  static const _databaseVersion = 1; // versão do banco de dados

  // variável para a tabela
  static const table = 'contato'; // nome da tabela

  // variáveis para os campos da tabela
  static const columnId = '_id'; // nome do campo id
  static const columnNome = 'nome'; // nome do campo nome
  static const columnIdade = 'idade'; // nome do campo idade

  // design pattern para conexões no modo Singleton
  DatabaseHelper._privateConstructor();

  // criação de uma variável para a instância do banco de dados
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // referência única para o banco de dados
  // nesse ponto, verificamos se o banco existe físicamente
  // a ? diz que a variável aceita valores nulos
  static Database? _database;

  Future<Database?> get database async {
    // se o banco de dados não existir, ele será criado
    if (_database != null) return _database;
    // se o banco de dados existir, ele será retornado
    _database = await _initDatabase();
    return _database;
  }

  // método initDatabase()
  _initDatabase() async {
    // verificar o caminho físico do banco e se há permissão de abertura
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // método que cria um novo banco de dados e tabelas, caso não exista
  Future _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE $table (
          $columnId INTEGER PRIMARY KEY,
          $columnNome TEXT NOT NULL,
          $columnIdade INTEGER NOT NULL
        );
      ''');
  }

  // métodos do CRUD
  // método de inclusão de dados
  // insere uma linha na tabela existente no banco de dados, onde cada chave Map() é um nome de coluna e o valor é o conteúdo da variável
  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(table, row);
  }

  // método que retorna todas as linhas existentes no banco de dados (tabela)
  Future<List<Map<String, dynamic>>> queryAllCrescente() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }
}
