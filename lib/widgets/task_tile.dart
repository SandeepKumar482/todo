import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String title;
  final Function checkBoxCallback;
  final Function deleteCallback;
  TaskTile(
      this.title, this.isChecked, this.checkBoxCallback, this.deleteCallback);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        deleteCallback();
      },
      title: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.blueAccent,
        value: isChecked,
        onChanged: (bool? value) {
          checkBoxCallback(value);
        },
      ),
    );
  }
}
