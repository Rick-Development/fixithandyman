import 'package:fixithandyman/util/app_constant.dart';
import 'package:fixithandyman/views/profile_setup_intro_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Setting', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              // Handle notification tap
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile_image.png'),
              ),
              SizedBox(height: 16),
              Text(
                'Marybeth Walker',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'marybethwalkergmail.com',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '0 Ongoing Jobs  0 Complete Jobs',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  // Handle upgrade to premium
                },
                child: Text('Upgrade to premium'),
                style: TextButton.styleFrom(
                  foregroundColor: AppConstants.primaryColor,
                ),
              ),
              Divider(height: 40),
              _buildProfileOption(
                icon: Icons.person_outline,
                text: 'My Profile',
                onTap: () {
                  // Handle My Profile tap
                },
              ),
              _buildProfileOption(
                icon: Icons.history,
                text: 'Transaction history',
                onTap: () {
                  // Handle Transaction history tap
                },
              ),
              _buildProfileOption(
                icon: Icons.assignment,
                text: 'Accepted jobs',
                onTap: () {
                  // Handle Accepted jobs tap
                },
              ),
              _buildProfileOption(
                icon: Icons.settings_outlined,
                text: 'Account Settings',
                onTap: () {
                  Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context)  => ProfileSetupIntroScreen()));
                  // Handle Account Settings tap
                },
              ),
              _buildProfileOption(
                icon: Icons.help_outline,
                text: 'Help and support',
                onTap: () {
                  // Handle Help and support tap
                },
              ),
              _buildProfileOption(
                icon: Icons.logout,
                text: 'Sign Out',
                textColor: Colors.red,
                onTap: () {
                  // Handle Sign Out tap
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // Set the current index to match the profile tab
        onTap: (index) {
          // Handle tab change
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
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

  Widget _buildProfileOption({required IconData icon, required String text, Color? textColor, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: textColor ?? Colors.black),
      title: Text(
        text,
        style: TextStyle(color: textColor ?? Colors.black),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
