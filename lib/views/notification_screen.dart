import 'package:fixithandyman/util/app_constant.dart';
import 'package:flutter/material.dart';



class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back navigation
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tab bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'General',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Requests',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ),
            // Notifications
            NotificationItem(
              profileUrl: 'Icon 04.png',
              title: 'Application Rejected',
              subtitle:
                  'Unfortunately, Brandon Breyer cannot accept your services.',
              time: '12:00 PM',
              buttonText: 'Application details',
            ),
            NotificationItem(
              profileUrl: 'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA4L2pvYjEwMzQtZWxlbWVudC0wNy00MDMucG5n.png',
              title: 'Application Sent',
              subtitle:
                  'Your application was sent to Brandon Breyer and is being reviewed',
              time: '11:00 AM',
              buttonText: 'Application details',
            ),
            NotificationItem(
              profileUrl: 'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA4L2pvYjEwMzQtZWxlbWVudC0wNy00MDMucG5n.png',
              title: 'Check It Out!',
              subtitle:
                  'Jacob Mertens is looking for a UI UX Designer! Check it out!',
              time: '08:00 AM',
              buttonText: 'See Job',
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Yesterday',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            NotificationItem(
              profileUrl: 'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA4L2pvYjEwMzQtZWxlbWVudC0wNy00MDMucG5n.png',
              title: 'Check It Out!',
              subtitle:
                  'Jacob Mertens is looking for a UI UX Designer! Check it out!',
              time: '20:00 PM',
              buttonText: 'See Job',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String profileUrl;
  final String title;
  final String subtitle;
  final String time;
  final String buttonText;

  NotificationItem({
    required this.profileUrl,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(profileUrl),
            radius: 24,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      time,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppConstants.primaryColor,
                  ),
                  child: Text(buttonText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}