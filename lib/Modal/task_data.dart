import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todo/Modal/tasks.dart';
import 'package:todo/database/tasks_databse.dart';

import 'tasks.dart';

class TasKData extends ChangeNotifier {
  static List<Task> _tasks = [];

  UnmodifiableListView get task {
    return UnmodifiableListView(_tasks);
  }

  Future<int?> getCount() async {
    TaskDatabase helper = TaskDatabase.init();
    var count = await helper.getCount();
    // print("------------------------------$count");

    notifyListeners();
    return count;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle, isDone: false);
    _tasks.add(task);
    notifyListeners();
  }

  void updateStatus(Task task) async {
    TaskDatabase helper = TaskDatabase.init();

    task.toggleDone();
    helper.updateTask(task);
    notifyListeners();
  }

  void deleteTask(Task task) async {
    _tasks.remove(task);
    notifyListeners();
  }
}
