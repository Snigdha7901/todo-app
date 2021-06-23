import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoo/source/services.dart';
import 'package:todoo/source/task_data.dart';
import 'package:todoo/widgets/tasks_tile.dart';

import '../locator.dart';

class TasksList  extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<TasksList> {
  void initState()
  {locator<TaskServices>().fetchtask();
  super.initState();}
  @override
  Widget build(BuildContext context) {

    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return taskData.isloading? Center(child: CupertinoActivityIndicator()): Listitem(
              name: task.name,
              desc: task.desc,
              isChecked: task.isdone,
              changestate: (checkboxState) {
                taskData.doneTask(task);
              },
              longPressCallback: () {

                locator<TaskServices>().deleteTask(task.id);
                ;
              },
              onTapCallback: (){
                Navigator.pushNamed(context, '/addTaskScreen',arguments:task);
              } ,

            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }

}