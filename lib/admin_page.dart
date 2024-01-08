import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:silvershop/api_connection/api_connection.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        backgroundColor: Colors.deepPurple[800],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Insert Product'),
              onPressed: () => _showInsertDialog(context),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Delete Product'),
              onPressed: () => _showDeleteDialog(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showInsertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Insert Product'),
          content: InsertProductForm(),
        );
      },
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String productName = '';
        return AlertDialog(
          title: Text('Delete Product'),
          content: TextField(
            onChanged: (value) => productName = value,
            decoration: InputDecoration(hintText: "Enter product name"),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Delete'),
              onPressed: () {
                _deleteProduct(productName, context);
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteProduct(String productName, BuildContext context) async {
    var url = Uri.parse(API.hostConnectDeleteProduct); // Replace with your server URL

    try {
      var response = await http.post(
        url,
        body: {'productName': productName},
      );

      if (response.statusCode == 200) {
        // Handle the response from the server
        print('Response from server: ${response.body}');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  Future<void> _insertProduct(String name, String price, String category, String imageUrl) async {
    var url = Uri.parse('http://yourserver.com/insert_product.php'); // Replace with your server URL

    try {
      var response = await http.post(
        url,
        body: {
          'productName': name,
          'productPrice': price,
          'productCategory': category,
          'imageUrl': imageUrl,
        },
      );

      if (response.statusCode == 200) {
        // Handle the response from the server
        print('Response from server: ${response.body}');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}

class InsertProductForm extends StatefulWidget {
  @override
  _InsertProductFormState createState() => _InsertProductFormState();
}

class _InsertProductFormState extends State<InsertProductForm> {
  final _formKey = GlobalKey<FormState>();
  String productName = '';
  String productPrice = '';
  String productCategory = '';
  String imageUrl = ''; // Variable for image URL

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(hintText: 'Product Name'),
            validator: (value) => value == null || value.isEmpty ? 'Please enter product name' : null,
            onChanged: (value) => productName = value,
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Product Price'),
            keyboardType: TextInputType.number,
            validator: (value) => value == null || value.isEmpty ? 'Please enter product price' : null,
            onChanged: (value) => productPrice = value,
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Product Category'),
            validator: (value) => value == null || value.isEmpty ? 'Please enter product category' : null,
            onChanged: (value) => productCategory = value,
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Image URL'),
            validator: (value) => value == null || value.isEmpty ? 'Please enter image URL' : null,
            onChanged: (value) => imageUrl = value,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                _insertProduct(productName, productPrice, productCategory, imageUrl);
                Navigator.of(context).pop();
              }
            },
            child: Text('Add Product'),
          ),
        ],
      ),
    );

  }
  Future<void> _insertProduct(String name, String price, String category, String imageUrl) async {
    var url = Uri.parse(API.hostConnectAddProduct); // Replace with your server URL

    try {
      var response = await http.post(
        url,
        body: {
          'productName': name,
          'productPrice': price,
          'productCategory': category,
          'imageUrl': imageUrl,
        },
      );

      if (response.statusCode == 200) {
        // Handle the response from the server
        print('Response from server: ${response.body}');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}

