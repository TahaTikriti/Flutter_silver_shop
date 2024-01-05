import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:silvershop/api_connection/api_connection.dart';

class NecklacesPage extends StatefulWidget {
  @override
  _NecklacesPageState createState() => _NecklacesPageState();
}

class _NecklacesPageState extends State<NecklacesPage> {
  List<dynamic> necklaces = [];
  List<bool> checked = []; // List to keep track of checkbox state

  Future<void> fetchNecklaces() async {
    final response = await http.get(Uri.parse(API.hostConnectNecklaces)); // Replace with your API endpoint

    if (response.statusCode == 200) {
      setState(() {
        necklaces = json.decode(response.body);
        // Initialize checked list with false for each necklace
        checked = List<bool>.filled(necklaces.length, false);
      });
    } else {
      throw Exception('Failed to load necklaces');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNecklaces();
  }

  Widget _buildImage(String imageUrl) {
    if (imageUrl.startsWith('http')) {
      return Image.network(imageUrl); // Load image from URL
    } else {
      return Image.asset('Images/Necklaces/$imageUrl'); // Load image from local assets
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Necklaces'),
      ),
      body: ListView.builder(
        itemCount: necklaces.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: SizedBox(
              width: 50,
              height: 50,
              child: _buildImage(necklaces[index]['img']), // Replace 'img' with the actual field name for image URL
            ),
            title: Text(necklaces[index]['name']), // Replace 'name' with the actual field name in your 'silver' table
            subtitle: Text('Price: \$${necklaces[index]['price']}'), // Replace 'price' with the actual field name in your 'silver' table
            trailing: Checkbox(
              value: checked[index],
              onChanged: (bool? value) {
                setState(() {
                  checked[index] = value!;
                  // Perform any other operations on checkbox state changes
                });
              },
            ),
            // Add more widgets or fields here according to your needs
          );
        },
      ),
    );
  }
}
