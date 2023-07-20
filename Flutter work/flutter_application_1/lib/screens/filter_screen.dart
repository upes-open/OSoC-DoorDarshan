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
                  constraints: BoxConstraints(maxWidth: 200, maxHeight: 40),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      hintText: 'Search',
                      hintStyle: TextStyle(fontSize: 20),
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
                    onPressed: () {},
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                    text: 'Cafes',
                    onPressed: () {},
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                    text: 'Parks',
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Offices',
                    onPressed: () {},
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                    text: 'Airports',
                    onPressed: () {},
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                    text: 'Hospitals',
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Libraries',
                    onPressed: () {},
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                    text: 'ATMs',
                    onPressed: () {},
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                    text: 'Museums',
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Pharmacy',
                    onPressed: () {},
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                    text: 'Churches',
                    onPressed: () {},
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                    text: 'Police',
                    onPressed: () {},
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
