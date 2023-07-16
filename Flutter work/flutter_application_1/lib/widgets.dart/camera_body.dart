import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraBody extends StatelessWidget {
  final CameraController controller;
  final bool imageVisible;
  final Function toggleFlash;
  final Function handleTrailingImageTap;
  final bool showIcons;

  const CameraBody({
    required this.controller,
    required this.imageVisible,
    required this.toggleFlash,
    required this.handleTrailingImageTap,
    required this.showIcons,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Stack(
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
              handleTrailingImageTap();
            },
            child: Center(
              child: Image.asset('assets/phone.png'),
            ),
          ),
        ),
        if (showIcons)
          Positioned(
            bottom: screenHeight / 5,
            left: 2,
            right: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image(
                    color: Colors.white,
                    image: AssetImage('assets/chat.png'),
                    height: 35,
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    iconSize: 35,
                    color: Colors.white,
                    icon: const Icon(Icons.filter_alt_outlined),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
