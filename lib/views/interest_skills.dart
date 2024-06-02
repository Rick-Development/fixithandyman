import 'package:fixithandyman/util/app_constant.dart';
import 'package:fixithandyman/views/identification_screen.dart';
import 'package:flutter/material.dart';

class InterestSkills extends StatefulWidget {
  @override
  _InterestSkillsState createState() => _InterestSkillsState();
}

class _InterestSkillsState extends State<InterestSkills> {
  List<String> skills = [
    'UI/UX',
    'Technology',
    'Strategy',
    'Interfaces',
    'Programming',
    'Writing',
    'Web design',
    'Art & illustration'
  ];
  List<String> selectedSkills = ['UI/UX', 'Technology', 'Web design'];

  void toggleSelection(String skill) {
    setState(() {
      if (selectedSkills.contains(skill)) {
        selectedSkills.remove(skill);
      } else {
        selectedSkills.add(skill);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Set up'),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              'Interest & Skills',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Add skill and interest',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Type a skill..',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: skills.map((skill) {
                final isSelected = selectedSkills.contains(skill);
                return GestureDetector(
                  onTap: () => toggleSelection(skill),
                  child: Chip(
                    label: Text(skill),
                    backgroundColor:
                        isSelected ? AppConstants.primaryColor : Colors.grey[200],
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IdentificationScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppConstants.primaryColor,
                  foregroundColor:  Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ), 
                child: Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

