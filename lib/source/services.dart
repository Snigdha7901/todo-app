import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';
import 'package:todoo/source/task_data.dart';
import 'package:todoo/widgets/tasks.dart';
import'package:provider/provider.dart';

class TaskServices{
  TaskData taskData=new TaskData();
  var uuid = Uuid();
  addTask(Map<String,dynamic>task, BuildContext context)
{
task.addAll({
  'id':uuid.v1(),
  'isdone': false,

});
Provider.of<TaskData>(context,listen: false).addTask(Task.fromMap(task));

}
  updateTask(Task task,Map<String,dynamic>updated, BuildContext context)
  {Map<String,dynamic>map={
    'id':task.id,
    'name':updated['name']??task.name,
    'desc':updated['desc']??task.desc,
    'isdone':task.isdone,


  };
  print('check 1');
  Provider.of<TaskData>(context,listen: false).updateTask(Task.fromMap(map));}
}
