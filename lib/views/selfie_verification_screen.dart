import 'package:fixithandyman/views/selfie_capture_screen.dart';
import 'package:flutter/material.dart';

class SelfieVerificationIntroScreen extends StatelessWidget {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Take a Selfie to verify your identity',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelfieCaptureScreen()),
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