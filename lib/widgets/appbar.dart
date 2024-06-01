

import 'package:flutter/material.dart';

class CustomAppbar extends AppBar{
String title2 = '';
bool useLogo = true;
bool showNotification = true;
  CustomAppbar( {
    required this.title2,
    required this.useLogo,
    required this.showNotification
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset('assets/images/logo-whit.png',
        width: 100.0,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              // Handle notification tap
            },
          ),
        ],
      );
  }
  
}