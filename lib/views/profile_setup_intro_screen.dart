import 'package:fixithandyman/util/app_constant.dart';
import 'package:flutter/material.dart';
import 'profile_details_form_screen.dart'; // Adjust the import based on your file structure

   class ProfileSetupIntroScreen extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(
           title: Text('Profile Set up'),
           leading: IconButton(
             icon: Icon(Icons.arrow_back),
             onPressed: () {
               // Handle back navigation
               Navigator.pop(context);
             },
           ),
         ),
         body: Padding(
           padding: const EdgeInsets.all(16.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset('assets/images/Wall post-pana 1.png'),
               SizedBox(height: 20),
               Text(
                 'Setting up your Profile',
                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
               ),
               SizedBox(height: 10),
               Text(
                 'There are two stages to successfully set up your profile',
                 textAlign: TextAlign.center,
                 style: TextStyle(fontSize: 16),
               ),
               SizedBox(height: 20),
               Row(
                 children: [
                   Expanded(
                     child: ListTile(
                       leading: CircleAvatar(
                         backgroundColor: AppConstants.primaryColor,
                         child: Text('1', style: TextStyle(color: Colors.white)),
                       ),
                       title: Text('Identification upload'),
                       trailing: Icon(Icons.check_circle, color: AppConstants.primaryColor),
                     ),
                   ),
                 ],
               ),
               Row(
                 children: [
                   Expanded(
                     child: ListTile(
                       leading: CircleAvatar(
                         backgroundColor: AppConstants.primaryColor,
                         child: Text('2', style: TextStyle(color: Colors.white)),
                       ),
                       title: Text('Verifying photo'),
                       trailing: Icon(Icons.check_circle, color: AppConstants.primaryColor),
                     ),
                   ),
                 ],
               ),
               Row(
                 children: [
                   Expanded(
                     child: ListTile(
                       leading: CircleAvatar(
                         backgroundColor: Colors.grey,
                         child: Text('3', style: TextStyle(color: Colors.white)),
                       ),
                       title: Text('Document Upload'),
                       trailing: Icon(Icons.check_circle, color: Colors.grey),
                     ),
                   ),
                 ],
               ),
               SizedBox(height: 20),
               ElevatedButton(
                 onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => ProfileDetailsFormScreen(),
                     ),
                   );
                 },
                 style: ElevatedButton.styleFrom(backgroundColor: AppConstants.primaryColor, 
                 foregroundColor: Colors.white
                 ),
                 child: Text('Next'),
               ),
             ],
           ),
         ),
       );
     }
   }
