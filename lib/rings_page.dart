import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:silvershop/api_connection/api_connection.dart';

class RingsPage extends StatefulWidget {
  @override
  _RingsPageState createState() => _RingsPageState();
}

class _RingsPageState extends State<RingsPage> {
  List<dynamic> rings = [];
  List<bool> checked = []; // List to keep track of checkbox state

  Future<void> fetchRings() async {
    final response = await http.get(Uri.parse(API.hostConnectRings)); // Replace with your API endpoint

    if (response.statusCode == 200) {
      setState(() {
        rings = json.decode(response.body);
        // Initialize checked list with false for each ring
        checked = List<bool>.filled(rings.length, false);
      });
    } else {
      throw Exception('Failed to load rings');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchRings();
  }

  Widget _buildImage(String imageUrl) {
    if (imageUrl.startsWith('http')) {
      return Image.network(imageUrl); // Load image from URL
    } else {
      return Image.asset('Images/Rings/$imageUrl'); // Load image from local assets
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rings'),
      ),
      body: ListView.builder(
        itemCount: rings.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(rings[index]['name']), // Replace 'name' with the actual field name in your 'silver' table
            subtitle: Text('Price: \$${rings[index]['price']}'), // Replace 'price' with the actual field name in your 'silver' table
            // Display other fields accordingly
            secondary: SizedBox(
              width: 50,
              height: 50,
              child: _buildImage(rings[index]['img']), // Replace 'img' with the actual field name for image URL
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
