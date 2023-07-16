import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_application_1/widgets.dart/camera_body.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraScreen({required this.cameras});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  bool _flashOn = false;
  bool _imageVisible = true;
  bool _showIcons = false;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.cameras[0], ResolutionPreset.max);
    _controller.initialize().then((_) {
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
        _imageVisible = false;
        _showIcons = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleFlash() async {
    try {
      if (_flashOn) {
        await _controller.setFlashMode(FlashMode.off);
      } else {
        await _controller.setFlashMode(FlashMode.torch);
      }
      setState(() {
        _flashOn = !_flashOn;
      });
    } catch (e) {
      print('Failed to toggle flash: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: _toggleFlash,
          icon: Icon(
            _flashOn ? Icons.flash_on : Icons.flash_off,
            size: 35,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Handle trailing image tap
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                iconSize: 35,
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: CameraBody(
        controller: _controller,
        imageVisible: _imageVisible,
        toggleFlash: _toggleFlash,
        handleTrailingImageTap: () {
          // Handle trailing image tap
        },
        showIcons: _showIcons,
      ),
    );
  }
}
