import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Bookmark', style: TextStyle(color: Colors.black)),
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
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.purple,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          isScrollable: true,
          tabs: [
            Tab(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('Applied 12+', style: TextStyle(fontSize: 12)),
              ),
            ),
            Tab(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('Ongoing 12+', style: TextStyle(fontSize: 12)),
              ),
            ),
            Tab(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('Done 12+', style: TextStyle(fontSize: 12)),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTaskList(),
          _buildTaskList(),
          _buildTaskList(),
          _buildTaskList(),
          _buildTaskList(),
          _buildTaskList(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Set the current index to match the tasks tab
        onTap: (index) {
          // Handle tab change
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
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

  Widget _buildTaskList() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: 2, // Adjust the count based on your data
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.only(bottom: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/Rectangle 5678.png'), // Ensure the asset path is correct
                SizedBox(height: 16),
                Text(
                  'Looking For a rockstar Interior Designer to join our freelance team!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Design & Creative',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Posted 16 minutes ago · Intermediate',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Hello! My name is Marybeth, but I go by, Beth, and I\'m a UI UX designer. I\'ve been designing user interfaces for about...',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 8),
                Wrap(
                  spacing: 8.0,
                  children: [
                    _buildTag('Graphic Design'),
                    _buildTag('Logo Design'),
                    _buildTag('Branding'),
                    _buildTag('Landscapes'),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Budget: N5000 - N700000',
                      style: TextStyle(color: Colors.green),
                    ),
                    Spacer(),
                    Text(
                      'Remote',
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle applied action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Text('Applied'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTag(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey[200],
    );
  }
}
