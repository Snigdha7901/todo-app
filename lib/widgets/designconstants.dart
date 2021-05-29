import 'package:flutter/material.dart';

dynamic buildTextField(String hint, Color colour){
  return InputDecoration(
    hintStyle: TextStyle(color: Colors.grey),
    hintText: hint,
    contentPadding:
    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide:
      BorderSide(color: colour, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
      BorderSide(color: Colors.red[900], width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );}