import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Modal/task_data.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);
  static late String newTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w600,
                  fontSize: 30.0),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: TextField(
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.words,
                // autofocus: true,
                onChanged: (newValue) {
                  print(newValue);
                  newTitle = newValue;
                  print("new tille $newTitle");
                },
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RawMaterialButton(
              elevation: 05,
              onPressed: () {
                print("new tti $newTitle");
                Provider.of<TasKData>(context, listen: false).addTask(newTitle);
                Navigator.pop(context);
              },
              fillColor: Colors.blueAccent,
              child: Center(
                child: Text(
                  'Add',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w200),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
