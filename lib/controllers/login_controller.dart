import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController {
  Future<bool> login(String username, String password) async {
    // Replace with your API endpoint
    const url = 'https://your-api-endpoint.com/login';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Handle successful login
        return true;
      } else {
        // Handle unsuccessful login
        return false;
      }
    } catch (error) {
      print('Error: $error');
      return false;
    }
  }
}
