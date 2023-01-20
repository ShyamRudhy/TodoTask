import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projects/models/todo_model.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper{

  DatabaseHelper._privateConstructor();

  static final  DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database??= await _initDatabase();

  Future<Database> _initDatabase() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path  = join(documentsDirectory.path,'todo.db');
    return await openDatabase(path,version: 1,onCreate: _onCreate,);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE todo(
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    lead_id INTEGER NOT NULL,
    last_date TEXT NOT NULL,
    next_date TEXT NOT NULL,
    email TEXT NOT NULL,
    time_stamp DATETIME
    )
    ''');
  }

  Future<List<TodoModel>> getTodoList() async {
    Database db = await instance.database;
    var todo = await db.query('todo', orderBy: 'id');
    List<TodoModel> toDoList = todo.isNotEmpty
        ? todo.map((c) => TodoModel.fromMap(c)).toList()
        : [];
    return toDoList;
  }

  Future<int> add(TodoModel todoModel) async{
    Database db = await instance.database;
    return await db.insert('todo', todoModel.toMap());
  }


}