import 'package:fixithandyman/views/change_password_screen.dart';
import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatefulWidget {
  @override
  _AccountSettingsScreenState createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text('Notifications'),
              trailing: Switch(
                value: _notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Change Password'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                 Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context)  => ChangePasswordScreen()));
                // Navigate to change password screen
              },
            ),
            Divider(),
            ListTile(
              title: Text('Update Payment Information'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to update payment information screen
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
