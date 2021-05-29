import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoo/screens/addtaskscreen.dart';
import 'package:todoo/source/apidata.dart';
import 'package:todoo/source/services.dart';
import 'package:todoo/source/task_data.dart';
import 'package:todoo/widgets/tasks.dart';
import 'package:todoo/widgets/tasks_tile.dart';
class TasksList extends StatelessWidget {
  Apiservices apicall=Apiservices();
  @override
  Widget build(BuildContext context) {

    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return Listitem(
              name: task.name,
              desc: task.desc,
              isChecked: task.isdone,
              changestate: (checkboxState) {
                taskData.doneTask(task);
              },
              longPressCallback: () {
                {taskData.deleteTask(task);}

                /*return AlertDialog(
                 title: Text('Are you sure you want to delete the task?'),
                 actions([ FlatButton(onPressed: ()
                     child:
                 Container(
                   color: Colors.red[900],
                   child: Text('YES'),
                 )),

                ] )

               );

               */
              },
              onTapCallback: (){

                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SingleChildScrollView(
                        child:Container(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Addtaskscreen(task),)
            )
            );
            } ,

            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }

}