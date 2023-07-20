import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_application_1/screens/chat_screen.dart';
import 'package:flutter_application_1/screens/filter_screen.dart';

class CameraBody extends StatefulWidget {
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
  _CameraBodyState createState() => _CameraBodyState();
}

class _CameraBodyState extends State<CameraBody> {
  bool isFilterVisible = false;
  bool areIconsVisible = true;
  bool isChatVisible = false;

  void toggleFilterVisibility() {
    setState(() {
      isFilterVisible = !isFilterVisible;
      areIconsVisible = !areIconsVisible;
    });
  }

  void toggleChatVisibility() {
    setState(() {
      isChatVisible = !isChatVisible;
      areIconsVisible = !areIconsVisible;
    });
  }

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
            aspectRatio: widget.controller.value.aspectRatio,
            child: CameraPreview(widget.controller),
          ),
        ),
        Visibility(
          visible: widget.imageVisible,
          child: AnimatedOpacity(
            opacity: widget.imageVisible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            onEnd: () {
              widget.handleTrailingImageTap();
            },
            child: Center(
              child: Image.asset('assets/phone.png'),
            ),
          ),
        ),
        if (areIconsVisible && widget.showIcons)
          Positioned(
            bottom: screenHeight / 5,
            left: 2,
            right: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: IconButton(
                    iconSize: 35,
                    color: Colors.white,
                    icon: const Icon(Icons.chat_bubble_outline),
                    onPressed: () {
                      toggleChatVisibility();
                    },
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    iconSize: 35,
                    color: Colors.white,
                    icon: const Icon(Icons.filter_alt_outlined),
                    onPressed: () {
                      toggleFilterVisibility();
                    },
                  ),
                ),
              ],
            ),
          ),
        if (isChatVisible) chat(screenHeight),
        if (isFilterVisible) filter(screenHeight),
      ],
    );
  }
}
