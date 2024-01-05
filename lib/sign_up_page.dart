import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'api_connection/api_connection.dart';



class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isUsernameAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 36, horizontal: 10),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {},
                    child: TextFormField(
                      controller: _fullNameController,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {},
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (_) => _validateUserName(),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {},
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _signUp();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                    ),
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() {
    String fullName = _fullNameController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (fullName.isEmpty || username.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all fields");
      return;
    }

    if (!_isUsernameAvailable) {
      Fluttertoast.showToast(msg: "Username is already used. Try another.");
      return;
    }

    registerUser(fullName, username, password);
  }

  Future<void> _validateUserName() async {
    String username = _usernameController.text.trim();
    if (username.isNotEmpty) {
      try {
        var res = await http.post(
          Uri.parse(API.hostConnectValidateUserName),
          body: {'user_name': username},
        );

        if (res.statusCode == 200) {
          var resBodyOfValidateUserName = jsonDecode(res.body);
          if (resBodyOfValidateUserName['usernameFound']) {
            setState(() {
              _isUsernameAvailable = false;
            });
          } else {
            setState(() {
              _isUsernameAvailable = true;
            });
          }
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  void registerUser(String fullName, String username, String password) async {
    try {
      var userModel = {
        'user_name': username,
        'password': password,
        // Other user details...
      };

      var res = await http.post(
        Uri.parse(API.hostConnectSignup),
        body: userModel,
      );

      if (res.statusCode == 200) {
        var resBodyOfSignUp = jsonDecode(res.body);
        if (resBodyOfSignUp['success']) {
          Fluttertoast.showToast(msg: "Registration successful!");
        } else {
          Fluttertoast.showToast(msg: "Registration failed. Please try again.");
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: SignUpWidget(),
  ));
}
