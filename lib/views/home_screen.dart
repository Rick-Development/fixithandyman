import 'dart:convert';

import 'package:fixithandyman/views/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:fixithandyman/util/app_constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOnline = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset('assets/images/logo-whit.png',
        width: 100.0,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              // Handle notification tap
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              SizedBox(height: 16),
              _buildTabs(),
              SizedBox(height: 16),
              _buildJobCard(),
              SizedBox(height: 16),
              _buildPopularServiceSection(),
              SizedBox(height: 16),
              _buildTrendingSection(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isOnline = !isOnline;
          });
        },
        backgroundColor: isOnline ? Colors.green : Colors.red,
        child: Text(isOnline ? 'Go Offline' : 'Go Online', textAlign: TextAlign.center),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildSearchBar() {
    return Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Cleaning Service',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchScreen()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.purple, // Change this to your desired color
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.tune,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
            // Add other widgets for your HomeScreen here
          
    // TextField(
    //   decoration: InputDecoration(
    //     hintText: 'Search Services',
    //     prefixIcon: Icon(Icons.search),
    //     border: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10.0),
    //       borderSide: BorderSide.none,
    //     ),
    //     filled: true,
    //     fillColor: Colors.white,
    //     contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
    //   ),
    // );
  }

  Widget _buildTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Recent', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text('Popular', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildJobCard() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/Rectangle 5678.png'), // Replace with your image path
          SizedBox(height: 8),
          Text(
            'Looking For a rockstar Interior Designer to join our freelance team!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Design & Creative', style: TextStyle(color: Colors.grey)),
          SizedBox(height: 4),
          Text('Posted 16 minutes ago · Intermediate', style: TextStyle(color: Colors.grey)),
          SizedBox(height: 16),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: [
              _buildTag('Graphic Design'),
              _buildTag('Logo Design'),
              _buildTag('Branding'),
              _buildTag('Landscapes'),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text('Budget: N5000 - N7000', style: TextStyle(color: Colors.grey)),
              Spacer(),
              Text('Remote', style: TextStyle(color: Colors.green)),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, 
              backgroundColor:AppConstants.primaryColor,
            ),
            onPressed: () {
              // Handle See Job button tap
            },
            child: Text('See Job'),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularServiceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Popular service'),
        SizedBox(height: 8),
        _buildServiceCard(),
        SizedBox(height: 8),
        _buildServiceCard(),
      ],
    );
  }

  Widget _buildTrendingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Trending'),
        SizedBox(height: 8),
        _buildServiceCard(),
        SizedBox(height: 8),
        _buildServiceCard(),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text('See all', style: TextStyle(fontSize: 14, color: Colors.blue)),
      ],
    );
  }

  Widget _buildServiceCard() {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset('assets/images/Rectangle 5674.png', width: 50, height: 50), // Replace with your image path
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Logo design', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('Aya Mohamed', style: TextStyle(color: Colors.grey)),
              Row(
                children: [
                  Text('N20,000', style: TextStyle(color: Colors.black)),
                  SizedBox(width: 4),
                  Icon(Icons.star, color: Colors.yellow, size: 16),
                  Text('5.0', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String tagName) {
    return Chip(
      label: Text(tagName),
      backgroundColor: Colors.grey[200],
    );
  }
}