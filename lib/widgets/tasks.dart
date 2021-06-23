import 'package:flutter/cupertino.dart';
import 'package:todoo/utilities/enum_utilities.dart';

import '../priority.dart';

class Task {
  String name;
  String desc;
  TaskPriority prior;
  var id;
  bool isdone;

  Task(
      {@required this.name, @required this.desc,  @required this.id, this.isdone});

  void toggledone() {
    isdone = !isdone;
  }

  Task.fromMap(Map<String, dynamic>map)
  {
    this.name = map['name'];
    this.desc = map['desc'];
    this.id = map['id'];
    this.isdone = false;
    this.prior=enumValuefromString<TaskPriority>(map['priority'].toString(),TaskPriority.values );

  }
}