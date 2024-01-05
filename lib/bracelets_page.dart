import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:silvershop/api_connection/api_connection.dart';

class BraceletsPage extends StatefulWidget {
  @override
  _BraceletsPageState createState() => _BraceletsPageState();
}

class _BraceletsPageState extends State<BraceletsPage> {
  List<dynamic> bracelets = [];
  List<bool> checked = []; // List to keep track of checkbox state

  Future<void> fetchBracelets() async {
    final response = await http.get(Uri.parse(API.hostConnectBracelets)); // Replace with your API endpoint

    if (response.statusCode == 200) {
      setState(() {
        bracelets = json.decode(response.body);
        // Initialize checked list with false for each bracelet
        checked = List<bool>.filled(bracelets.length, false);
      });
    } else {
      throw Exception('Failed to load bracelets');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchBracelets();
  }

  Widget _buildImage(String imageUrl) {
    if (imageUrl.startsWith('http')) {
      return Image.network(imageUrl); // Load image from URL
    } else {
      return Image.asset('Images/Bracelets/$imageUrl'); // Load image from local assets
    }
  }

  void addToCart() async {
    List<int> selectedIndexes = [];
    for (int i = 0; i < checked.length; i++) {
      if (checked[i]) {
        selectedIndexes.add(i);
      }
    }

    // Prepare the data to send to the PHP script
    Map<String, dynamic> data = {
      'checkboxes': selectedIndexes.map((index) => bracelets[index]['sid']).toList(),
      'userid': 'your_user_id_here', // Replace with actual user ID
    };

    final response = await http.post(
      Uri.parse('http://your_domain.com/add_to_cart.php'), // Replace with your PHP script URL
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print('Items added to cart successfully!');
    } else {
      print('Failed to add items to cart');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bracelets'),
      ),
      body: ListView.builder(
        itemCount: bracelets.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(bracelets[index]['name']), // Replace 'name' with the actual field name in your 'silver' table
            subtitle: Text('Price: \$${bracelets[index]['price']}'), // Replace 'price' with the actual field name in your 'silver' table
            // Display other fields accordingly
            secondary: SizedBox(
              width: 50,
              height: 50,
              child: _buildImage(bracelets[index]['img']), // Replace 'img' with the actual field name for image URL
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
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: addToCart,
          child: Text('Add to Cart'),
        ),
      ),
    );
  }
}
