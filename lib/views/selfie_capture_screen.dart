import 'package:fixithandyman/views/task_upload_screen.dart';
import 'package:flutter/material.dart';

class SelfieCaptureScreen extends StatelessWidget {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TaskUploadScreen()),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: Text('Capture Selfie'),
            ),
          ],
        ),
      ),
    );
  }
}