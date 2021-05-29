import 'dart:convert' ;
import 'package:http/http.dart' as http;

class Apiservices {
  String baseurl = 'https://harsh-todo-api.herokuapp.com';

  Future createUser( String email, String  pass) async {
    try {
      final response = await http.post(
        Uri.parse(baseurl + '/todo/addUser'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': 'Snigdha',
          'email': email,
          'password': pass,
        }),
      );
      if (response.statusCode == 201) {
        print('user created :)');
      }
      else {
        print(response.statusCode);
      }
      return response.statusCode;
    }
    catch (e) {
      print(e);
    }
  }}



