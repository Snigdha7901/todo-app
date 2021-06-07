import 'package:flutter/foundation.dart';


import 'package:todoo/widgets/tasks.dart';
import 'dart:collection';
class TaskData extends ChangeNotifier {


  List<Task> _tasks=[];
  void gettasks(List<Task>tasks){
    _tasks=tasks;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;

  }


  Future addTask(Task task) async{
    _tasks.add(task);
    notifyListeners();
    }



  Future updateTask(Task task)
  { int index=_tasks.indexWhere((t) => t.id==task.id);
  _tasks.replaceRange(index, index+1, [task]);
  print('check 2');
  notifyListeners();
  }
   /**/



  void doneTask(Task task) {
    task.toggledone();
    notifyListeners();
  }

  void deleteTask(Task task) {

    _tasks.remove(task);

    notifyListeners();
  }
}
