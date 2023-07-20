import 'package:flutter/material.dart';
import 'package:flutter_application_1/custombutton.dart';

Positioned filter(double screenHeight) {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: screenHeight / 2,
          color: Colors.white.withOpacity(0.5),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: 200,
                      maxHeight: 40), // Adjust the width as needed
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      hintText: 'Search',
                      hintStyle:
                          TextStyle(fontSize: 20), // Increase the font size
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 40.0),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Resturants',
                    onPressed: () {
                      // Handle button 1 press
                    },
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                    text: 'Cafes',
                    onPressed: () {
                      // Handle button 2 press
                    },
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                    text: 'Parks',
                    onPressed: () {
                      // Handle button 3 press
                    },
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Offices',
                    onPressed: () {
                      // Handle button 4 press
                    },
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                    text: 'Airports',
                    onPressed: () {
                      // Handle button 5 press
                    },
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                    text: 'Hospitals',
                    onPressed: () {
                      // Handle button 6 press
                    },
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Libraries',
                    onPressed: () {
                      // Handle button 4 press
                    },
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                    text: 'ATMs',
                    onPressed: () {
                      // Handle button 5 press
                    },
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                    text: 'Museums',
                    onPressed: () {
                      // Handle button 6 press
                    },
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Pharmacy',
                    onPressed: () {
                      // Handle button 4 press
                    },
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                    text: 'Churches',
                    onPressed: () {
                      // Handle button 5 press
                    },
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                    text: 'Police',
                    onPressed: () {
                      // Handle button 6 press
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
