import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Modal/task_data.dart';

import 'task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
              Provider.of<TasKData>(context, listen: true).task[index].name,
              Provider.of<TasKData>(context, listen: true).task[index].isDone,
              (checkBoxState) {
            Provider.of<TasKData>(context, listen: false).updateStatus(
                Provider.of<TasKData>(context, listen: false).task[index]);
          }, () {
            Provider.of<TasKData>(context, listen: false).deleteTask(
                Provider.of<TasKData>(context, listen: false).task[index]);
          });
        },
        itemCount: Provider.of<TasKData>(context, listen: true).task.length);
  }
}
