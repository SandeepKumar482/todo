class Task {
  final int? id;
  final String name;
  bool isDone;
  Task({this.id, required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isChecked': (isDone) ? 1 : 0,
    };
  }
}
