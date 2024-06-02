import 'package:fixithandyman/views/location_birthdate_details_screen.dart';
import 'package:flutter/material.dart';

class ProfileDetailsFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Set up'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Welcome, let\'s set up your Profile',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LocationBirthDetailsScreen()),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}