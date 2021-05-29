
import 'package:flutter/material.dart';

import 'package:todoo/source/services.dart';
import 'package:todoo/widgets/tasks.dart';



  class Addtaskscreen extends StatelessWidget {
    @override

    TaskServices service= new TaskServices();
    TextEditingController newtask=new TextEditingController();
    TextEditingController taskdesc=new TextEditingController();
     Task task;
     Addtaskscreen(this.task);

@override
    Widget build(BuildContext context) {

  task=ModalRoute.of(context).settings.arguments;
   if(task!=null)
{   newtask.text=task.name;
   print(newtask.text);
taskdesc.text=task.desc;}

      return Container(
        color: Colors.grey,
        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0)
            ,topRight: Radius.circular(20.0)),
          ),
         
            child: Column(
              children: <Widget>[
                Text(task!=null?'Update Task':'Add Task',style: TextStyle(fontSize: 40,color:Colors.red[900], fontWeight: FontWeight.bold),),


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      TextFormField(autofocus: true,
                        textAlign: TextAlign.center,
                        controller: newtask,
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        autofocus: true,
                        textAlign: TextAlign.center,
                        controller: taskdesc,
                      ),
                    ],
                  ),

            SizedBox(
              height: 40,
            ),

                FlatButton(
                    onPressed: () {task!=null?_updatetask(context):_addtask(context); }  ,
                    child:Container(
                      width: double.infinity,
                      color: Colors.red[900],
                      padding: EdgeInsets.all(5),
                      child: Center(child: Text(task!=null?'Update':'Add',style: TextStyle(fontSize: 25, color: Colors.white),)),
                    ),

                  ),

              ],
            ),
          ),
        
      );
    }

    _addtask(context){
      Map<String,dynamic>map={
        'name': newtask.text,
        'desc':taskdesc.text,
      };
      service.addTask(map,context);


      Navigator.pop(context);
    }
    _updatetask(context){
      Map<String,dynamic>updated={};
      if(newtask.text !=task.name)
        updated['name']=newtask.text;

      if(newtask.text !=task.name)
        updated['desc']=taskdesc.text;
      print('checking');
      service.updateTask(task,updated, context);


      Navigator.pop(context);
    }
  }
