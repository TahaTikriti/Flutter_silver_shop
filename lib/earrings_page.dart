import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:silvershop/api_connection/api_connection.dart';

class EarringsPage extends StatefulWidget {
  @override
  _EarringsPageState createState() => _EarringsPageState();
}

class _EarringsPageState extends State<EarringsPage> {
  List<dynamic> earrings = [];
  List<bool> checked = []; // List to keep track of checkbox state

  Future<void> fetchEarrings() async {
    final response = await http.get(Uri.parse(API.hostConnectEarrings)); // Replace with your API endpoint

    if (response.statusCode == 200) {
      setState(() {
        earrings = json.decode(response.body);
        // Initialize checked list with false for each earring
        checked = List<bool>.filled(earrings.length, false);
      });
    } else {
      throw Exception('Failed to load earrings');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchEarrings();
  }

  Widget _buildImage(String imageUrl) {
    if (imageUrl.startsWith('http')) {
      return Image.network(imageUrl); // Load image from URL
    } else {
      return Image.asset('Images/Earrings/$imageUrl'); // Load image from local assets
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Earrings'),
      ),
      body: ListView.builder(
        itemCount: earrings.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(earrings[index]['name']), // Replace 'name' with the actual field name in your 'silver' table
            subtitle: Text('Price: \$${earrings[index]['price']}'), // Replace 'price' with the actual field name in your 'silver' table
            // Display other fields accordingly
            secondary: SizedBox(
              width: 50,
              height: 50,
              child: _buildImage(earrings[index]['img']), // Replace 'img' with the actual field name for image URL
            ),
            value: checked[index],
            onChanged: (bool? value) {
              setState(() {
                checked[index] = value!;
                // Perform any other operations on checkbox state changes
              });
            },
          );
        },
      ),
    );
  }
}
