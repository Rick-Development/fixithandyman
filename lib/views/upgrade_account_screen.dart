import 'package:flutter/material.dart';

class UpgradeAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Upgrade Account'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UpgradeCard(
                price: '10000/1mth',
                benefits: [
                  'Get Paid Faster',
                  'Get more contracts job from 500,000 above',
                  'Get more jobs daily',
                  'Unlimited Job Application',
                  'Get tools box and fix it branded working shirt',
                  'Enjoy a lot of bonus'
                ],
              ),
              SizedBox(height: 16),
              UpgradeCard(
                price: '50000/6mths',
                benefits: [
                  'Get Paid Faster',
                  'Get more contracts job from 500,000 above',
                  'Get more jobs daily',
                  'Unlimited Job Application',
                  'Get tools box and fix it branded working shirt',
                  'Enjoy a lot of bonus'
                ],
              ),
              SizedBox(height: 16),
              UpgradeCard(
                price: '100k/1Year',
                benefits: [
                  'Get Paid Faster',
                  'Get more contracts job from 500,000 above',
                  'Get more jobs daily',
                  'Unlimited Job Application',
                  'Get tools box and fix it branded working shirt',
                  'Enjoy a lot of bonus'
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpgradeCard extends StatelessWidget {
  final String price;
  final List<String> benefits;

  UpgradeCard({required this.price, required this.benefits});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.layers,
                    size: 40,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Premium Plan',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Column(
              children: benefits.map((benefit) {
                return Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        benefit,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle upgrade action
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                ),
                child: Text('Upgrade'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

