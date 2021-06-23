import 'package:flutter/cupertino.dart';
import 'package:todoo/environment/app_env.dart';
import 'package:todoo/priority.dart';
import 'package:todoo/source/task_data.dart';
import 'package:todoo/utilities/enum_utilities.dart';
import 'package:todoo/widgets/tasks.dart';

import 'package:uuid/uuid.dart';
//import'package:provider/provider.dart';
import 'dart:convert' ;
import 'dart:io';
import 'package:http/http.dart' as http;

import '../locator.dart';

class TaskServices {
  String token='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwYjcyMzJjMmFkMDRkMDAxNzA5MGNiOSIsIm5hbWUiOiJTbmlnZGhhIiwiZW1haWwiOiJUeWFnaXNuaWdkaGExMjEyQGdtYWlsLmNvbSIsImlhdCI6MTYyNDQ3ODYxMywiZXhwIjoxNjI0NDk2NjEzfQ.zPIUeGUQ5SZtB77MzyebAng5E3uONyL3gKh01rl0YS4';
  String baseApiurl = AppEnvironment.baseApiurl;
  Future getuser() async {
    http.Response response = await http.get(
      Uri.parse(baseApiurl+'/me'),
      headers: {HttpHeaders.authorizationHeader:'Bearer $token',
        "Content-Type": "application/json"
      },
    );


    if (response.statusCode == 200) {
      var data = response.body;
      // var content= await getTasks();
      // _tasks=content["data"];
      return jsonDecode(data);
    } }
  Future login() async {
    http.Response response = await http.post(
      Uri.parse(baseApiurl+'/login'),
      headers: {//HttpHeaders.authorizationHeader:'Bearer $bearertoken'},
        "Content-Type": "application/json"
      },
      body: jsonEncode(<String, String>{

        "email": "Tyagisnigdha1212@gmail.com",
        "password":"Sectumsempra"
        //'priority': prior,
      }),

    );

    if (response.statusCode == 200) {
      var data = response.body;
      // var content= await getTasks();
      // _tasks=content["data"];
      return jsonDecode(data);
    } }

  Future fetchtask() async {
    _taskData.isloading=true;
    try{
      var response=await http.get(Uri.parse(baseApiurl+'/todo/getUserTodos'),
        headers: {HttpHeaders.authorizationHeader:'Bearer $token'},);
      if (response.statusCode == 200) {
        List<Task> _tasks = [];
        dynamic body = jsonDecode(response.body);
        body.forEach((value){ (_tasks.add(Task.fromMap(value)));});
        _taskData.tasks=_tasks;
        _taskData.isloading=false;
      }
      else{
        print(response.statusCode);
        _taskData.isloading=false;
      }}
    catch(e){
      _taskData.isloading=false;
    }
  }


  TaskData _taskData = locator<TaskData>();
  var uuid = new Uuid();

  Future addTask(Map<String, dynamic>task) async {
    print(enumValuetoString(task["priority"]));
    _taskData.isAdding=true;
    try{final response = await http.post(
        Uri.parse(baseApiurl+'/todo/addTodo'),
        headers: {
          HttpHeaders.authorizationHeader:'Bearer $token',
          "Content-Type": "application/json"
        },
        body:jsonEncode(<String, String> {
          "title": task["name"],
          "description": task["desc"],
          "priority": enumValuetoString(task["priority"]),
        })

    );



    if (response.statusCode == 201) {

      print('task created');
      dynamic body= jsonDecode(response.body);
      print(body);}
      //_taskData.addTask(Task.fromMap(body));}
    else{
      print(response.statusCode);
      _taskData.isAdding=false;
    }
    }

    catch(e){
      _taskData.isAdding=false;
      throw(e);
    }



    /* task.addAll({
      'id': uuid.v1,
      'isdone': false,
      'priority': enumValuetoString(TaskPriority.min),});*/


  }

  Future updateTask(Task task, Map<String, dynamic>updated,)async {
    try{final response = await http.put(
        Uri.parse(baseApiurl+'/todo/${task.id}'),
        headers: {
          HttpHeaders.authorizationHeader:'Bearer $token',
          "Content-Type": "application/json"
        },
        body: updated
    );
    if (response.statusCode == 200) {

      print('task updated');
      dynamic body= jsonDecode(response.body);
      _taskData.updateTask(Task.fromMap(body));}
    else{
      print(response.statusCode);
      _taskData.isAdding=false;
    }
    }

    catch(e){
      _taskData.isAdding=false;
      throw(e);
    }
    /*  Map<String, dynamic>map = {
      'id': task.id,
      'name': updated['name'] ?? task.name,
      'desc': updated['desc'] ?? task.desc,
      'isdone': task.isdone,
      'priority': enumValuetoString(TaskPriority.min)
    };*/

  }

  Future deleteTask(String id) async {
    _taskData.isAdding = true;
    print(id);
    try {
      var response = await http.delete(baseApiurl+'/todo/${id}');
      if (response.statusCode == 200) {
        _taskData.deleteTask(id);
        _taskData.isAdding = false;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        _taskData.isAdding = false;
      }
    } catch(e) {
      _taskData.isAdding = false;
      throw(e);
    }
  }
}
