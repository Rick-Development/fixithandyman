import 'package:fixithandyman/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatController with ChangeNotifier {
  List<Message> _messages = [];

  List<Message> get messages => _messages;

  Future<void> fetchMessages() async {
    final response = await http.get(Uri.parse('https://yourapi.com/messages'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _messages = data.map((item) => Message.fromJson(item)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load messages');
    }
  }
}
