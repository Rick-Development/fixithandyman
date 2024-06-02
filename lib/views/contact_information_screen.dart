import 'package:fixithandyman/views/selfie_verification_screen.dart';
import 'package:flutter/material.dart';

class ContactInformationScreen extends StatelessWidget {
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
            TextField(
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Address'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelfieVerificationIntroScreen()),
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