import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/secondchatscreen.dart';

Positioned chat(double screenHeight, BuildContext context,
    {required Function onCloseClicked}) {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              height: screenHeight / 2,
              color: Colors.white.withOpacity(0.5),
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/chatbot.png"),
                  ),
                  SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 16),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Type a message",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 10),
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.emoji_emotions),
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SecondChatScreen(cameras: []),
                                ),
                              );
                            },
                            icon: Icon(Icons.send),
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () {
                onCloseClicked();
              },
            ),
          ),
        ],
      ),
    ),
  );
}
