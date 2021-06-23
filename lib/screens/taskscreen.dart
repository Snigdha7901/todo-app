import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todoo/locator.dart';
import 'package:todoo/source/services.dart';
import 'package:todoo/source/task_data.dart';
import 'package:todoo/widgets/tasks_list.dart';


import 'addtaskscreen.dart';

class Taskscreen  extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Taskscreen>

{  @override
TaskServices _taskService=locator<TaskServices>();
void initState()  {

  super.initState();
  data();
}
void data()async{
  var userid= await _taskService.getuser();
  print(userid['data']['name']);

}
Widget build(BuildContext context) {

  return Scaffold(
      backgroundColor: Colors.red[900],
      body:Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 60,left: 30, right: 30, bottom: 20),
            color: Colors.red[900],
            child: Column(
              children: <Widget>[

                CircleAvatar(child:Icon(
                  Icons.list,
                  color: Colors.red[900],
                  size: 60.0,
                ),
                  backgroundColor: Colors.white,
                  radius: 30,),
                SizedBox(
                  height: 10.0,
                ),
                Text('Todoo!',style: TextStyle(fontSize: 40, color: Colors.white, fontWeight:FontWeight.bold),),
                Text('${Provider.of<TaskData>(context).taskCount} Tasks remain',style: TextStyle(fontSize: 15, color: Colors.white, ),),



              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.white,),


              child:TasksList(),
            ),
          ),
        ],
      ),
      floatingActionButton:FloatingActionButton(
        backgroundColor: Colors.red[800],
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                  child:Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Addtaskscreen(),
                  )
              )
          );
        } ,
      ));
}

}

