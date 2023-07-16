import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:part1/services/location.dart';

import 'package:part1/slidepart.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _cameras = await availableCameras();
  runApp(const CameraApp());
}

/// CameraApp is the Main Application.
class CameraApp extends StatefulWidget {
  /// Default Constructor
  const CameraApp({Key? key}) : super(key: key);

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();

    controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location
        .getCurrentLocation(context)
        .then((value) => {print(location.latitude), print(location.longitude)});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _screenWidth = MediaQuery.of(context).size.width;
    var _screenHeight = MediaQuery.of(context).size.height;
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(backgroundColor: Colors.transparent, actions: [
          TextButton.icon(
            onPressed: () => {},
            icon: const Column(
              children: [
                Icon(
                  Icons.comment,
                  color: Colors.blue,
                  size: 22,
                ),
                Text(
                  'Chatbot',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ],
            ),
            label: const Text(
              '',
              style: TextStyle(
                fontSize: 0.5,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ]),
        body: SlidingUpPanel(
          backdropEnabled: true,
          color: Colors.black,
          panel: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BarIndicator(),
              ],
            ),
          ),
          body: SizedBox(
            width: _screenWidth,
            height: _screenHeight,
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: CameraPreview(controller),
            ),
          ),
        ),
      ),
    );
  }
}
