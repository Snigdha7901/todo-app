import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:todoo/screens/taskscreen.dart';

import 'package:todoo/source/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(

    create: (BuildContext context)=>TaskData(),

    child: MaterialApp(
    home: Taskscreen(),


    ),);


  }
}

