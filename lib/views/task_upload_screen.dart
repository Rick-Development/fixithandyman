import 'package:dotted_border/dotted_border.dart';
import 'package:fixithandyman/util/app_constant.dart';
import 'package:fixithandyman/views/additional_details_screen.dart';
import 'package:fixithandyman/views/bank_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class TaskUploadScreen extends StatefulWidget {
  @override
  _TaskUploadScreenState createState() => _TaskUploadScreenState();
}

class _TaskUploadScreenState extends State<TaskUploadScreen> {
  List<PlatformFile> _files = [];

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'gif'],
    );

    if (result != null) {
      setState(() {
        _files = result.files;
      });
    }
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
          children: [
            LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.grey[300],
              color: AppConstants.primaryColor,
            ),
            SizedBox(height: 20),
            Text(
              'Upload your Tools',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Please upload any relevant certificate or document to help strengthen your portfolio.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: _pickFiles,
              child: DottedBorder(
                color: Colors.grey,
                strokeWidth: 1,
                borderType: BorderType.RRect,
                radius: Radius.circular(10),
                dashPattern: [6, 3],
                child: Container(
                  width: double.infinity,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.upload_file, size: 50, color: Colors.grey),
                      SizedBox(height: 10),
                      Text(
                        'Choose file or drag here',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text(
                        'High resolution images (png, jpg, gif)',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _files.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.insert_drive_file, color: Colors.green),
                    title: Text(_files[index].name),
                    subtitle: Text(
                      '${(_files[index].size / 1024).toStringAsFixed(2)} KB',
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the next screen
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BankDetailsScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppConstants.primaryColor,
                foregroundColor: AppConstants.whiteColor,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              ),
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

