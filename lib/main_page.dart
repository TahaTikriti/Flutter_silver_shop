import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Import your existing page files here
import 'api_connection/api_connection.dart';
import 'app_drawer.dart';
import 'rings_page.dart';
import 'bracelets_page.dart';
import 'earrings_page.dart';
import 'necklaces_page.dart';
import 'login_page.dart';
import 'profile_page.dart';
import 'about_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List list = [];
  Future<void> getData() async {
    var url = API.hostConnectGetData;
    try {
      var res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        setState(() {
          list.addAll(data);
        });
        print(data);
      } else {
        print('HTTP Error: ${res.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome To Our SilverShop'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        // Changed to a Container with a Text widget for demonstration purposes
        child: Container(
          child: Text('Main Page'),
        ),
      ),
    );
  }
}
