import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:silvershop/bracelets_page.dart';
import 'package:silvershop/earrings_page.dart';
import 'package:silvershop/necklaces_page.dart';
import 'package:silvershop/rings_page.dart';
import 'login_page.dart';
import 'main_page.dart';
import 'profile_page.dart';
import 'about_page.dart'; // Import the About widget or where you define the about page
import 'package:http/http.dart' as http;


void main() {
  runApp(MaterialApp(
    home: MainPage(),
    debugShowCheckedModeBanner: false,
    routes: {
      '/earrings': (context) => EarringsPage(),
      '/rings': (context) => RingsPage(),
      '/bracelets': (context) => BraceletsPage(),
      '/necklaces': (context) => NecklacesPage(),
      // Define other routes as needed
    },
  )
  );
}


