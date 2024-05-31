import 'package:fixithandyman/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:fixithandyman/util/app_constant.dart';

class SignUpStep4Screen extends StatelessWidget {
  const SignUpStep4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset('assets/images/welcome.png'),
            SizedBox(height: 32),
            Text(
              'Welcome to Fix it',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'To start getting jobs on the app and get paid, finish setting up your profile!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the next screen or home screen
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen() ,
                      ),
                    );
                },
                child: Text('Got it'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: AppConstants.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
