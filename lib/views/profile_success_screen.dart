import 'package:fixithandyman/util/app_constant.dart';
import 'package:fixithandyman/views/home_screen.dart';
import 'package:fixithandyman/views/main_screen.dart';
import 'package:fixithandyman/views/signup_step4_screen.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
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
            Icon(Icons.check_circle, color: Colors.green, size: 100),
            SizedBox(height: 20),
            Text(
              'Congratulations!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Your profile has been successfully set up.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20), 
            ElevatedButton(
              onPressed: () {
                // Handle continue action
                Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => SignUpStep4Screen()),
              (Route<dynamic> route) => false,  // Remove all previous routes
            );
                // Navigator.pushReplacement(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => MainScreen()),
                //         );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppConstants.primaryColor,
                foregroundColor: Colors.white
                ),
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}