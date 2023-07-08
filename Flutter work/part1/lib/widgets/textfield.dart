import 'package:flutter/material.dart';
import 'package:part1/constants.dart';

Widget primaryTextField(
    {bool? obscureText,
    TextEditingController? controller,
    required String hint,
    Widget? prefix,
    Widget? suffix,
    bool? readOnly,
    TextInputType? textInputType,
    Function()? onTap}) {
  return TextField(
    keyboardType: textInputType,
    readOnly: readOnly ?? false,
    controller: controller,
    style: const TextStyle(fontSize: 14),
    obscureText: obscureText ?? false,
    onTap: onTap,
    decoration: InputDecoration(
      suffixIcon: suffix,
      prefixIcon: prefix,
      isDense: true,
      filled: true,
      contentPadding: const EdgeInsets.all(12),
      hintText: hint,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(width: 0, color: textfieldColor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(width: 0, color: textfieldColor)),
    ),
  );
}
