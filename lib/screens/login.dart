import 'package:flutter/material.dart';
import 'package:todoo/source/routes.dart';
import 'package:todoo/widgets/designconstants.dart';
class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var email, password;


  @override
  Widget build(BuildContext context) {return Scaffold(
      backgroundColor: Colors.white,
      body:Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[ SizedBox(
  height: 48.0,
  ),
  TextField(
  style: TextStyle(color: Colors.black) ,
  decoration:buildTextField('enter your email id',Colors.red[900]) ,
  onChanged:(value){
  email= value;
  },
  ),
  SizedBox(
  height: 8.0,
  ),
  TextField(
  style: TextStyle(color: Colors.black) ,
  decoration:buildTextField('enter password',Colors.red[900]),
  obscureText: true,
  onChanged:(value){
  password= value;
  },
  ),

  SizedBox(
  height: 24.0,
  ),
  Padding(
  padding: EdgeInsets.symmetric(vertical: 16.0),
  child: MaterialButton(
  onPressed: () {
    Navigator.pushNamed(context, Routes.task_screen);
  },
  child: Text(
  'Log In',
  ),
    ),
    ), ],
    ),
      ),
  );}}
