import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Modal/task_data.dart';
import 'package:todo/database/tasks_databse.dart';

import 'task_tile.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  late TaskDatabase helper;
  @override
  void initState() {
    helper = TaskDatabase.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          print("Connection set Successfully");
          if (snapshot.hasError) {
            print('Error---------------------------$snapshot.error');
          }
          if (snapshot.hasData) {
            print("SnapShot has its Data");
          }
        }
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return TaskTile(snapshot.data[index].id, snapshot.data[index].name,
                snapshot.data[index].isDone, (checkBoxState) {
              Provider.of<TasKData>(context, listen: false)
                  .updateStatus(snapshot.data[index]);
            }, () async {
              TaskDatabase helper = TaskDatabase.init();
              await helper.deleteTask(snapshot.data[index].id);
              setState(() {});
            });
          },
        );
      },
      future: helper.getTasks(),
    );
  }
}
