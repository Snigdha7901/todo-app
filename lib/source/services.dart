import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';
import 'package:todoo/source/task_data.dart';
import 'package:todoo/widgets/tasks.dart';
import'package:provider/provider.dart';
import 'dart:convert' ;
import 'dart:io';
import 'package:http/http.dart' as http;

class TaskServices{
  TaskData taskData=new TaskData();
  var uuid = Uuid();
  final String baseurl = 'https://harsh-todo-api.herokuapp.com';
  final String bearertoken='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwYjcyMzJjMmFkMDRkMDAxNzA5MGNiOSIsIm5hbWUiOiJTbmlnZGhhIiwiZW1haWwiOiJUeWFnaXNuaWdkaGExMjEyQGdtYWlsLmNvbSIsImlhdCI6MTYyMjk4NzE5MywiZXhwIjoxNjIzMDA1MTkzfQ.DFLH4n-svJ95-xfW32OoLFouf0SexRfo-BdpTjff-p4';
  Future getUser( BuildContext context) async {
    http.Response response = await http.get(
      Uri.parse(baseurl+'/me'),
      headers: {HttpHeaders.authorizationHeader:'Bearer $bearertoken'},


    );

    if (response.statusCode == 200) {
      var data = response.body;
      var content= await getTasks(context);
      print(content['data']);

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }}


 Future login() async {
   http.Response response = await http.post(
     Uri.parse(baseurl+'/login'),
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
  Future getTasks( BuildContext context) async {
    http.Response response = await http.get(
      Uri.parse(baseurl+'/todo/getUserTodos'),
      headers: {HttpHeaders.authorizationHeader:'Bearer $bearertoken'},


    );

    if (response.statusCode == 200) {
      List<Task> tasks = [];
      dynamic body = jsonDecode(response.body);
       body.forEach((value){ (tasks.add(Task.fromMap(value)));});

      Provider.of<TaskData>(context,listen: false).gettasks(tasks);
    } else {
      print(response.statusCode);
    }
  }
  Future addTask(Map<String,dynamic>task, BuildContext context)
async{
  try{final response = await http.post(
    Uri.parse(baseurl+'/todo/addTodo'),
    headers: {
      HttpHeaders.authorizationHeader:'Bearer $bearertoken',
      "Content-Type": "application/json"
    },
    body: task//jsonEncode(<String, String>{
      /*
      'title': task['name'],

      'description':task['desc'],
      'priority':task['priority']*/

      //'priority': prior,}),
  );
  if (response.statusCode == 201) {
    Provider.of<TaskData>(context,listen: false).addTask(Task.fromMap(task));
    print('task created');
    return jsonDecode(response.body);}
  else{
    print(response.statusCode);
  }
  }

  catch(e){
    print(e);
  }


  //task.addAll({
  //'id':response["data"]["_id"],
  //'isdone': false,});

}
 Future updateTask(Task task,Map<String,dynamic>updated, BuildContext context)
  async{Map<String,dynamic>map= {
    'id': task.id,
    'name': updated['name'] ?? task.name,
    'desc': updated['desc'] ?? task.desc,
    'isdone': task.isdone,
  };

    try{final response = await http.put(
      Uri.parse(baseurl+'/todo/${task.id}'),
      headers: {
        HttpHeaders.authorizationHeader:'Bearer $bearertoken',
        "Content-Type": "application/json"
      },
      body: map
      /*jsonEncode(<String, String>{
        'title': task.name,
        'description':task.desc,
        'priority':"min",

      }*/
    );
    if (response.statusCode == 201) {
      //return Album.fromJson();
      print('task updated');
     }
    else{
      print(response.statusCode);
    }
    }

    catch(e){
      print(e);
    }



  print('check 1');
  Provider.of<TaskData>(context,listen: false).updateTask(Task.fromMap(map));}


  Future deletetask(var todoid, BuildContext context ) async {
    try {
      http.Response response = await http.delete(
        Uri.parse(baseurl+'//todo/$todoid'),
        headers: {HttpHeaders.authorizationHeader:'Bearer $bearertoken'},


      );

      if (response.statusCode == 200) {
        Provider.of<TaskData>(context,listen: false).deleteTask(todoid);}
       else {
        print(response.statusCode);
      }
    }  catch (e) {
      throw(e);
    }
  }
}

