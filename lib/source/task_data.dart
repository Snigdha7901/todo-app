import 'package:flutter/foundation.dart';



import 'dart:collection';

import 'package:todoo/widgets/tasks.dart';


class TaskData extends ChangeNotifier {
  bool _isloading=false;
  bool get isloading=>_isloading;
  set isloading(bool val){
    _isloading=val;
    notifyListeners();
  }
  bool _isAdding=false;
  bool get isAdding=>_isAdding;
  set isAdding(bool val){
    _isAdding=val;
    notifyListeners();
  }

  List<Task> _tasks=[];

  set tasks(List<Task>tasks){
    _tasks=tasks;
    notifyListeners();
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




  void doneTask(Task task) {
    task.toggledone();
    notifyListeners();
  }

  void deleteTask(var id) {

    _tasks.removeWhere((v) => v.id==id);

    notifyListeners();
  }
}
