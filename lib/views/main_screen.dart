import 'package:fixithandyman/util/app_constant.dart';
import 'package:fixithandyman/views/message_screen.dart';
import 'package:fixithandyman/views/taskscreen.dart';
import 'package:flutter/material.dart';
import 'package:fixithandyman/views/home_screen.dart';
import 'package:fixithandyman/views/search_screen.dart';
import 'package:fixithandyman/views/profile_screen.dart';
import '../widgets/footer.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

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
        _selectedIndex = index;
        
      }
    });
    // if(index == 2 ){
    //    Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => SearchScreen()),
    // );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Footer(
        selectedIndex: _selectedIndex,
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
