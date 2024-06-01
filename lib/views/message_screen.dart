import 'package:fixithandyman/views/chat_screen.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Chats', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildMessageItem(
            context,
            'assets/images/logo.png',
            'Nilza Katnip',
            'Yup, we can get started.',
            '09:00 AM',
          ),
          _buildMessageItem(
            context,
            'assets/images/logo.png',
            'Nilza Katnip',
            'Hi, Mary! Please ask away, I\'m willing to help.',
            '08:45 AM',
          ),
          _buildMessageItem(
            context,
            'assets/images/logo.png',
            'Nilza Katnip',
            'Yup, we can get started.',
            '08:30 AM',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Set the current index to match the messages tab
        onTap: (index) {
          // Handle tab change
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(
      BuildContext context, String imageUrl, String name, String message, String time) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imageUrl),
      ),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(message),
      trailing: Text(time, style: TextStyle(color: Colors.green)),
      onTap: () {
        // Navigate to chat screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
        );
      },
    );
  }
}
