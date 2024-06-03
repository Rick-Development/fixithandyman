import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  double _minSalary = 20000;
  double _maxSalary = 100000;
  List<String> _selectedTools = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Filter',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () {
              // Close the filter screen
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery Time',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            RadioListTile(
              title: Text('Up to 3 days'),
              value: 'Up to 3 days',
              groupValue: _selectedDeliveryTime,
              onChanged: (value) {
                setState(() {
                  _selectedDeliveryTime = value;
                });
              },
            ),
            RadioListTile(
              title: Text('Express 24H'),
              value: 'Express 24H',
              groupValue: _selectedDeliveryTime,
              onChanged: (value) {
                setState(() {
                  _selectedDeliveryTime = value;
                });
              },
            ),
            RadioListTile(
              title: Text('Up to 7 days'),
              value: 'Up to 7 days',
              groupValue: _selectedDeliveryTime,
              onChanged: (value) {
                setState(() {
                  _selectedDeliveryTime = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Salary',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Minimum',
                      prefixText: 'N',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _minSalary = double.tryParse(value) ?? 20000;
                      });
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Maximum',
                      prefixText: 'N',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _maxSalary = double.tryParse(value) ?? 100000;
                      });
                    },
                  ),
                ),
              ],
            ),
            RangeSlider(
              values: RangeValues(_minSalary, _maxSalary),
              min: 20000,
              max: 100000,
              onChanged: (RangeValues values) {
                setState(() {
                  _minSalary = values.start;
                  _maxSalary = values.end;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Software Tool',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text('Adobe Photoshop'),
              value: _selectedTools.contains('Adobe Photoshop'),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedTools.add('Adobe Photoshop');
                  } else {
                    _selectedTools.remove('Adobe Photoshop');
                  }
                });
              },
            ),
            CheckboxListTile(
              title: Text('Figma'),
              value: _selectedTools.contains('Figma'),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedTools.add('Figma');
                  } else {
                    _selectedTools.remove('Figma');
                  }
                });
              },
            ),
            CheckboxListTile(
              title: Text('AdobeXD'),
              value: _selectedTools.contains('AdobeXD'),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedTools.add('AdobeXD');
                  } else {
                    _selectedTools.remove('AdobeXD');
                  }
                });
              },
            ),
            CheckboxListTile(
              title: Text('Sketch'),
              value: _selectedTools.contains('Sketch'),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedTools.add('Sketch');
                  } else {
                    _selectedTools.remove('Sketch');
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  String? _selectedDeliveryTime;
}