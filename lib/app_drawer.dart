import 'package:flutter/material.dart';
import 'login_page.dart';
import 'profile_page.dart';
import 'about_page.dart';
import 'rings_page.dart';
import 'bracelets_page.dart';
import 'earrings_page.dart';
import 'necklaces_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Login'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginWidget()),
              );
            },
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
          ),
          ListTile(
            title: Text('About'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => About()),
              );
            },
          ),
          ListTile(
            title: Text('Rings Page'), // Navigates to RingsPage
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RingsPage()),
              );
            },
          ),
          ListTile(
            title: Text('Bracelets Page'), // Navigates to BraceletsPage
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BraceletsPage()),
              );
            },
          ),
          ListTile(
            title: Text('Necklaces Page'), // Navigates to NecklacesPage
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NecklacesPage()),
              );
            },
          ),
          ListTile(
            title: Text('Earrings Page'), // Navigates to EarringsPage
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EarringsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
