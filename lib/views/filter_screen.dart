import 'package:fixithandyman/controllers/filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filter')),
      body: Consumer<FilterController>(
        builder: (context, filterController, child) {
          return Column(
            children: [
              DropdownButton<String>(
                value: filterController.selectedCategory,
                items: <String>['All', 'Category 1', 'Category 2'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  filterController.setSelectedCategory(newValue!);
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10, // Replace with the actual count of filtered items
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Filtered Item $index'), // Replace with actual item data
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
