import 'dart:convert';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'main_page.dart';
import 'profile_page.dart';
import 'about_page.dart'; // Import the About widget or where you define the about page
import 'package:http/http.dart' as http;


void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}


