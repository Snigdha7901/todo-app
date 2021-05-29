import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoo/screens/addtaskscreen.dart';
import 'package:todoo/screens/login.dart';
import 'package:todoo/screens/registration.dart';
import 'package:todoo/screens/taskscreen.dart';
import 'package:todoo/source/routes.dart';
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
    home: RegistrationScreen(),

      routes: {
      //  Routes.addTask_screen:(context)=> Addtaskscreen(),
        Routes.login_screen:(context)=> LoginScreen(),
        Routes.registration_screen:(context)=> RegistrationScreen(),
        Routes.task_screen:(context)=> Taskscreen(),
      },
    ),);


  }
}

