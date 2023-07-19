import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:part1/constants.dart';
import 'package:part1/widgets/button.dart';
import 'package:part1/widgets/textfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isVisible = false;
  bool? isChecked = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/images/signup_topbar.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 28,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome!",
                  style: TextStyle(
                    fontFamily: GoogleFonts.epilogue().fontFamily,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Create an account",
                  style: TextStyle(
                    color: greyTextColor,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 28),
                const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                primaryTextField(
                  hint: "Enter Email",
                  prefix: const Icon(Icons.email_outlined),
                  textInputType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                const SizedBox(height: 12),
                const Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                primaryTextField(
                  hint: "Enter Password",
                  prefix: const Icon(Icons.lock_outlined),
                  textInputType: TextInputType.visiblePassword,
                  controller: passwordController,
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    icon: isVisible
                        ? const Icon(Icons.visibility_outlined)
                        : const Icon(Icons.visibility_off_outlined),
                  ),
                ),
                const SizedBox(height: 28),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value;
                        });
                      },
                      checkColor: primaryColor,
                      activeColor: Colors.white,
                      visualDensity: VisualDensity.compact,
                      side: const BorderSide(color: primaryColor, width: 1),
                    ),
                    const Text("I agree with"),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Terms and Conditions",
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ],
                ),
                primaryButton(double.infinity,
                    callback: () {}, title: "Sign up"),
                const SizedBox(height: 40),
                const Center(
                  child: Text(
                    "OR SIGN UP WITH",
                    style: TextStyle(color: greyTextColor, fontSize: 12),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.apple,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Sign in",
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
