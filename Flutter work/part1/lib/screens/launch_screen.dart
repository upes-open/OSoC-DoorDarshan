import 'package:flutter/material.dart';
import 'package:part1/constants.dart';
import 'package:part1/widgets/button.dart';
import 'package:google_fonts/google_fonts.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              Center(
                child: Text(
                  "दूरDarshan",
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: GoogleFonts.epilogue().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image.asset("assets/images/logo.png"),
              const SizedBox(height: 12),
              const Text(
                'Lens for explorers',
                style: TextStyle(
                  fontSize: 12,
                  color: greyTextColor,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              primaryButton(double.infinity, callback: () {}, title: "Log in"),
              const SizedBox(height: 10),
              secondaryButton(double.infinity,
                  callback: () {}, title: "Sign up"),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
