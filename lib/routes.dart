import 'dart:js';

import 'package:flutter/material.dart';
import 'package:todoo/screens/addtaskscreen.dart';
import 'package:todoo/screens/taskscreen.dart';

Map<String, WidgetBuilder>getRoutes={
  '/':(context)=> Taskscreen(),
  '/addTaskScreen':(context)=>Addtaskscreen(),
};