import 'package:fixithandyman/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Consumer<ChatController>(
        builder: (context, chatController, child) {
          return ListView.builder(
            itemCount: chatController.messages.length,
            itemBuilder: (context, index) {
              final message = chatController.messages[index];
              return ListTile(
                title: Text(message.text),
                subtitle: Text(message.sender),
              );
            },
          );
        },
      ),
    );
  }
}
