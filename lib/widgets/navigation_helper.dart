

import 'package:fixithandyman/util/app_constant.dart';
import 'package:fixithandyman/views/home_screen.dart';
import 'package:fixithandyman/views/message_screen.dart';
import 'package:fixithandyman/views/profile_screen.dart';
import 'package:fixithandyman/views/search_screen.dart';
import 'package:fixithandyman/views/taskscreen.dart';
import 'package:fixithandyman/widgets/footer.dart';
import 'package:flutter/material.dart';

class NavigationHelper extends StatefulWidget {
  int cur_index = 0;
  NavigationHelper({required this.cur_index});
  @override
  _NavigationHelperState createState() => 
  _NavigationHelperState(selectedIndex: this.cur_index);
}

class _NavigationHelperState extends State<NavigationHelper> {
  int selectedIndex = 0 ;
  _NavigationHelperState( {required this.selectedIndex});
  static final List<Widget> _pages = <Widget>[
    HomeScreen(),
    MessageScreen(),
    SearchScreen(),
    TaskScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      if (index < _pages.length) {
        selectedIndex = index;
        
      }
    });
    if(index == 3 ){
       Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaskScreen()),
    );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: Footer(
        selectedIndex: selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          _onItemTapped(2)
        },
        backgroundColor: AppConstants.primaryColor,
        child: Icon(Icons.search, color: Colors.white),
        shape: CircleBorder(
          side: BorderSide(
            color: Colors.white,
            width: 4.0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}