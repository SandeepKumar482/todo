import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todo/Modal/tasks.dart';

import 'tasks.dart';

class TasKData extends ChangeNotifier {
  static List<Task> _tasks = [];

  UnmodifiableListView get task {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle, isDone: false);
    _tasks.add(task);
    notifyListeners();
  }

  void updateStatus(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
