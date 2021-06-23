
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoo/locator.dart';
import 'package:todoo/priority.dart';
import 'package:todoo/source/services.dart';
import 'package:todoo/source/task_data.dart';
import 'package:todoo/utilities/enum_utilities.dart';
import 'package:todoo/widgets/tasks.dart';








class Addtaskscreen  extends StatefulWidget {
  final Task task;
  Addtaskscreen({this.task});
  @override
  _State createState() => _State();
}

class _State extends State<Addtaskscreen> {


  @override

  TaskServices _taskService=locator<TaskServices>();

  TextEditingController newtask=new TextEditingController();
  TextEditingController taskdesc=new TextEditingController();
  Task task;
  TaskPriority priority=TaskPriority.min;
  void initState(){
    WidgetsBinding.instance.addPostFrameCallback((_) { task=ModalRoute.of(context).settings.arguments;
    if(task!=null){
      newtask.text=task.name;
      taskdesc.text=task.desc;
      setState(() {
        priority=task.prior;
      });}
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {


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
                SizedBox(height: 10,),
                Text('priority'),
                ExpansionTile(title: Text(enumValuetoString(priority).toUpperCase()),
                  backgroundColor: Colors.red[900],
                  children:<Widget> [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          priority=TaskPriority.min;
                        });
                      },
                      child: Text('min',  style: TextStyle(color: Colors.white),),
                    ),
                    SizedBox(height: 5,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          priority=TaskPriority.mid;
                        });
                      },
                      child: Text('mid',style: TextStyle(color: Colors.white),),
                    ),

                    SizedBox(height: 5,),GestureDetector(
                      onTap: (){
                        setState(() {
                          priority=TaskPriority.max;
                        });
                      },
                      child: Text('max',style: TextStyle(color: Colors.white),),
                    )
                  ],)
              ],
            ),

            SizedBox(
              height: 40,
            ),

            Consumer<TaskData>(
                builder: (context,provider,child){
                  return FlatButton(
                    onPressed: () {task!=null?_updatetask():_addtask(); }  ,
                    child:Container(
                      width: double.infinity,
                      color: Colors.red[900],
                      padding: EdgeInsets.all(5),
                      child: Center(child: provider.isAdding? CupertinoActivityIndicator():Text(task!=null?'Update':'Add',style: TextStyle(fontSize: 25, color: Colors.white),)),
                    ),

                  );}
            ),

          ],
        ),
      ),

    );

  }

  _addtask() {
    //if(((newtask.text)==null)||((taskdesc.text)==null))
 print('working');
    Map<String,String>map={
      "name": newtask.text,
      "desc":taskdesc.text,
      "priority":"min",

    };
    _taskService.addTask(map);//.then((value) => {}).catchError((e){});

 Navigator.pop(context);
  }
  _updatetask(){
    Map<String,dynamic>updated={};
    if(newtask.text !=task.name)
      updated.addAll({'name':newtask.text});

    if(newtask.text !=task.name)
      updated.addAll({'desc':taskdesc.text});
    updated.addAll({'priority':task.prior});
    print('checking');

    updated.addAll({'priority':task.prior});
    _taskService.updateTask(task,updated).then((value) => { Navigator.pop(context)}).catchError((e){});

    Navigator.pop(context);
  }

}
