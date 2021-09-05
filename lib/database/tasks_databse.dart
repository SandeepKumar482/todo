import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/Modal/tasks.dart';

class TaskDatabase {
  // static final TaskDatabase instance = TaskDatabase.instance;

  static Database? _database;

  TaskDatabase.init();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDB('tasks.db');
    return database;
  }

  Future<Database?> _initDB(String file) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, file);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  FutureOr<void> _createDB(Database db, int version) async {
    return db.execute(
      'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, isChecked INTEGER)',
    );
  }

  Future<void> newInsert(Task task) async {
    final db = await database;
    await db!.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    //throw 'INSERTION Failed!!';
  }

  Future<void> updateTask(Task task) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db!.update(
      'tasks',
      task.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [task.id],
    );
  }

  Future<void> deleteTask(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db!.delete(
      'tasks',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<List<Task>> getTasks() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Task.
    final List<Map<String, dynamic>> maps = await db!.query('tasks');

    // Convert the List<Map<String, dynamic> into a List<Task>.
    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]['id'],
        name: maps[i]['name'],
        isDone: (maps[i]['isChecked'] == 1) ? true : false,
      );
    });
  }

  Future<int?> getCount() async {
    final db = await database;
    final result = await db!.rawQuery('SELECT COUNT(*) FROM tasks');
    final count = Sqflite.firstIntValue(result);
    return count;
  }

  Future<void> close() async {
    final db = await database;
    db!.close();
  }
}
