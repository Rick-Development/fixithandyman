import 'package:fixithandyman/util/app_constant.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.png'),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kristin Watson', style: TextStyle(color: Colors.black)),
                Text('Online', style: TextStyle(color: Colors.green, fontSize: 12)),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.call, color: Colors.black),
            onPressed: () {
              // Handle call action
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Handle more action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                _buildChatBubble('Hi Emily, any progress on the project? We need a link for standup.', true),
                _buildChatBubble('Hi Kristin! Yes, I just finished developing the "Chat".', false),
                _buildChatBubble('Hi Emily, any progress on the project? We need a link for standup.', true),
                _buildChatBubble('Hi Kristin! Yes, I just finished developing the "Chat".', false),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: () {
                    // Handle send action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatBubble(String text, bool isSender) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSender ? AppConstants.primaryColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(color: isSender ? Colors.white : Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              '12:05 pm',
              style: TextStyle(color: isSender ? Colors.white : Colors.black, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
