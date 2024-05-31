import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  Footer({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Container(
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: selectedIndex == 0 ? Colors.purple : Colors.grey,
              ),
              onPressed: () => onItemTapped(0),
            ),
            IconButton(
              icon: Icon(
                Icons.mail,
                color: selectedIndex == 1 ? Colors.purple : Colors.grey,
              ),
              onPressed: () => onItemTapped(1),
            ),
            SizedBox(width: 24), // Space for the floating action button
            IconButton(
              icon: Icon(
                Icons.assignment,
                color: selectedIndex == 3 ? Colors.purple : Colors.grey,
              ),
              onPressed: () => onItemTapped(3),
            ),
            GestureDetector(
              onTap: () => onItemTapped(4),
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://www.shareicon.net/data/512x512/2016/05/24/770137_man_512x512.png'), // Replace with actual image URL
              ),
            ),
          ],
        ),
      ),
    );
  }
}
