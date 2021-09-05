import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TaskTile extends StatelessWidget {
  final int id;
  final bool isChecked;
  final String title;
  final Function checkBoxCallback;
  final Function deleteCallback;
  TaskTile(this.id, this.title, this.isChecked, this.checkBoxCallback,
      this.deleteCallback);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Fluttertoast.showToast(
            msg: "LONG press To delete the Task ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.white,
            fontSize: 16.0);
      },
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
