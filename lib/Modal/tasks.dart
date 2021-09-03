class Task {
  // final int id;
  final String name;
  bool isDone;
  Task({required this.name, this.isDone = false});
  void toggleDone() {
    isDone = !isDone;
  }

}

