import 'package:fixithandyman/views/additional_details_screen.dart';
import 'package:flutter/material.dart';

class TaskUploadScreen extends StatelessWidget {
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
              decoration: InputDecoration(labelText: 'Upload your Tasks'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdditionalDetailsScreen()),
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