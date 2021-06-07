import 'package:flutter/cupertino.dart';

class Task {
  String name;
  String desc;
  String prior;
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
    this.prior=map['priority'];

  }
}