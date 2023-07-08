import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _cameras = await availableCameras();
  runApp(const CameraApp());
}

class CameraApp extends StatefulWidget {
  const CameraApp({Key? key}) : super(key: key);

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;
  bool flashOn = false;
  bool imageVisible = true;
  bool showIcons = false;

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
            break;
          default:
            break;
        }
      }
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        imageVisible = false;
        showIcons = true;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void toggleFlash() async {
    try {
      if (flashOn) {
        await controller.setFlashMode(FlashMode.off);
      } else {
        await controller.setFlashMode(FlashMode.torch);
      }
      setState(() {
        flashOn = !flashOn;
      });
    } catch (e) {
      print('Failed to toggle flash: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: toggleFlash,
            child: Image.asset(
              flashOn ? 'assets/on_flash.png' : 'assets/off_flash.png',
              width: 100,
              height: 100,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                // Handle trailing image tap
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Image.asset('assets/Menu 1.png'),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: CameraPreview(controller),
              ),
            ),
            Visibility(
              visible: imageVisible,
              child: AnimatedOpacity(
                opacity: imageVisible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                onEnd: () {
                  setState(() {
                    imageVisible = false;
                    showIcons = true;
                  });
                },
                child: Center(
                  child: Image.asset('assets/phone.png'),
                ),
              ),
            ),
            if (showIcons)
              Positioned(
                bottom: 90,
                left: 5,
                right: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    Icon(Icons.sort_sharp, color: Colors.white),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
