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
  int _selectedIndex = 0; // Index to track selected item in bottom navigation bar


  Future<void> fetchNecklaces() async {
    final response = await http.get(Uri.parse(API.hostConnectNecklaces));

    if (response.statusCode == 200) {
      setState(() {
        necklaces = json.decode(response.body);
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
      return Image.network(imageUrl);
    } else {
      return Image.asset('Images/Necklaces/$imageUrl');
    }
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/earrings');
        break;
      case 1:
        Navigator.pushNamed(context, '/rings');
        break;
      case 2:
        Navigator.pushNamed(context, '/bracelets');
        break;
      case 3:
        Navigator.pushNamed(context, '/necklaces');
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Necklaces'),
        backgroundColor: Colors.deepPurple[800], // Dark purple color for AppBar
      ),
      body: ListView.builder(
        itemCount: necklaces.length,
        itemBuilder: (context, index) {
          return Card( // Wrapping each item in a Card
            child: CheckboxListTile(
              title: Text(
                necklaces[index]['name'],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Price: \$${necklaces[index]['price']}',
                style: TextStyle(color: Colors.grey[600]),
              ),
              secondary: SizedBox(
                width: 50,
                height: 50,
                child: _buildImage(necklaces[index]['img']),
              ),
              value: checked[index],
              onChanged: (bool? value) {
                setState(() {
                  checked[index] = value!;
                });
              },
              activeColor: Colors.deepPurple[800], // Dark purple color for checkbox
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.deepPurple), // Set icon color
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ring_volume, color: Colors.deepPurple), // Set icon color
            label: 'Rings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit, color: Colors.deepPurple), // Set icon color
            label: 'Bracelets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm, color: Colors.deepPurple), // Set icon color
            label: 'Necklaces',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white, // Explicitly set selected item color
        unselectedItemColor: Colors.grey, // Explicitly set unselected item color
        backgroundColor: Colors.deepPurple[800], // Background color
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add to cart functionality goes here
        },
        tooltip: 'Add to Cart',
        child: Icon(Icons.add_shopping_cart),
        backgroundColor: Colors.deepPurple[800],
      ),// Light purple background for contrast
      backgroundColor: Colors.deepPurple[50], // Light purple background for contrast
    );
  }
}
