import 'package:fixithandyman/controllers/message_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Messages')),
      body: Consumer<MessageController>(
        builder: (context, messageController, child) {
          return ListView.builder(
            itemCount: messageController.messages.length,
            itemBuilder: (context, index) {
              final message = messageController.messages[index];
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
