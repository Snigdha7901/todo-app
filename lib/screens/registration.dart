import 'package:todoo/source/routes.dart';
import 'package:flutter/material.dart';
import 'package:todoo/source/apidata.dart';
import 'package:todoo/widgets/designconstants.dart';
import 'package:todoo/widgets/user.dart';
class RegistrationScreen extends StatefulWidget {

@override
_RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var email, password;
  Apiservices ob;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    decoration:buildTextField('enter password',Colors.red[900]),
    style: TextStyle(color: Colors.black) ,
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
    onPressed: ()
    {
    ob.createUser(email,password);
      Navigator.pushNamed(context, Routes.login_screen);},//async {setState(() {});

      child: Text(
      'Register',
      style: TextStyle(color: Colors.black)
      )
      ,
      ),

     ),
   ],
    ),
    ), );
    }


  }

