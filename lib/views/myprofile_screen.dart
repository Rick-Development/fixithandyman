import 'package:fixithandyman/views/info_screen.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile setting'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Edit profile action
              Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyInfoScreen() ),
                        );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper-thumbnail.png'), // Replace with actual image URL
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: Colors.green,
                            size: 12,
                          ),
                        ),
                      ),
                      Text(
                        'Marybeth Walker',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'UI UX Designer',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(height: 5),
                     
                      Text(
                        '@pjotaparker • UI/UX Designing • N5000/hr',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: [
                Chip(
                  label: Text('UI/UX'),
                  backgroundColor: Colors.grey[200],
                ),
                Chip(
                  label: Text('Adobe'),
                  backgroundColor: Colors.grey[200],
                ),
                Chip(
                  label: Text('UI Design'),
                  backgroundColor: Colors.grey[200],
                ),
                Chip(
                  label: Text('Software Design'),
                  backgroundColor: Colors.grey[200],
                ),
                Chip(
                  label: Text('Software'),
                  backgroundColor: Colors.grey[200],
                ),
                Chip(
                  label: Text('Figma'),
                  backgroundColor: Colors.grey[200],
                ),
                Chip(
                  label: Text('3D modeling'),
                  backgroundColor: Colors.grey[200],
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Hello!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'My name is Marybeth, but I go by Beth, and I\'m a UI UX designer. I\'ve been designing user interfaces for about five years now, and I absolutely love it! In my experience, UI design is all about creating a compelling experience for the user.\n\nI strive to create interfaces that are easy to use and look beautiful while doing so.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            InfoRow(icon: Icons.location_on, text: 'Mbabane, Swaziland'),
            InfoRow(icon: Icons.language, text: 'English, Siswati'),
            InfoRow(icon: Icons.female, text: 'Female'),
            InfoRow(icon: Icons.link, text: 'food.com/recipe/jo-mama'),
            InfoRow(icon: Icons.link, text: 'dribbble.com/profile/ma...'),
            SizedBox(height: 16),
            SectionTitle(title: 'Education'),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('University of Cambridge'),
              subtitle: Text('Bachelor\'s Degree in Computer Science\n2008 - 2012'),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('University of Cambridge'),
              subtitle: Text('Higher Certification in Project Management\n2014 - 2014'),
            ),
            SizedBox(height: 16),
            SectionTitle(title: 'Work Experience'),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Google'),
              subtitle: Text('UI/UX Designer\n2015 - 2016'),
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Steam'),
              subtitle: Text('Front-end Developer\n2016 - 2019'),
            ),
            SizedBox(height: 16),
            SectionTitle(title: 'Reviews'),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/immages/Avatar.png'), // Replace with actual image URL
              ),
              title: Text('Alison Chen'),
              subtitle: Text(
                  'Beth is a highly skilled developer with a great attention to detail. She delivered the project on time and exceeded our expectations.'),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // View all reviews action
                },
                child: Text('View All'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 20),
          SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
