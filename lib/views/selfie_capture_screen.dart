import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:fixithandyman/views/task_upload_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class SelfieCaptureScreen extends StatefulWidget {
  @override
  _SelfieCaptureScreenState createState() => _SelfieCaptureScreenState();
}

class _SelfieCaptureScreenState extends State<SelfieCaptureScreen> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  CameraDescription? selectedCamera;
  bool isCameraInitialized = false;
  bool isFlashOn = false;

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      initializeCamera();
    } else {
      // Handle the scenario when permission is not granted
    }
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    selectedCamera = cameras!.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    _controller = CameraController(selectedCamera!, ResolutionPreset.high);
    await _controller!.initialize();
    setState(() {
      isCameraInitialized = true;
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> captureSelfie(BuildContext context) async {
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/selfies';
    await Directory(dirPath).create(recursive: true);
    final String filePath =
        '$dirPath/${DateTime.now().millisecondsSinceEpoch}.jpg';

    if (!_controller!.value.isInitialized) {
      return;
    }

    try {
      XFile file = await _controller!.takePicture();
      File savedFile = File(file.path);
      await savedFile.copy(filePath);
      await verifySelfie(savedFile, context);
    } catch (e) {
      print(e);
    }
  }

  Future<void> verifySelfie(File file, BuildContext context) async {
    try{
final url = Uri.parse('https://your-api-endpoint.com/verify');
    final request = http.MultipartRequest('POST', url)
      ..files.add(await http.MultipartFile.fromPath('selfie', file.path));
    final response = await request.send();

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TaskUploadScreen()),
      );
    } else {
      // Handle the error
       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TaskUploadScreen()),
      );
    }
    }catch(e){
       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TaskUploadScreen()),
      );
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: isCameraInitialized
          ? Stack(
              children: [
                CameraPreview(_controller!),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: Icon(
                                isFlashOn ? Icons.flash_on : Icons.flash_off,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  isFlashOn = !isFlashOn;
                                  _controller!.setFlashMode(
                                    isFlashOn
                                        ? FlashMode.torch
                                        : FlashMode.off,
                                  );
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 60,
                              ),
                              onPressed: () => captureSelfie(context),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.switch_camera,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedCamera = selectedCamera ==
                                          cameras!.first
                                      ? cameras!.last
                                      : cameras!.first;
                                  _controller = CameraController(
                                      selectedCamera!, ResolutionPreset.high);
                                  _controller!.initialize().then((_) {
                                    setState(() {});
                                  });
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                      // SizedBox(height: 20),
                      // Text(
                      //   'Take your photo at arms length, make sure your whole face is visible',
                      //   style: TextStyle(color: Colors.white, fontSize: 16),
                      //   textAlign: TextAlign.center,
                      // ),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
