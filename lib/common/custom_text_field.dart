import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  String? name;
  String? address;
  String? hintText;
  bool? isNumber;
  bool? isPassword;
  IconData? icon;
  TextEditingController? controller;
  String? message;

  CustomTextField(
      {super.key,
      this.name,
      this.address,
      this.hintText,
      this.isNumber,
      this.icon,
      this.isPassword,
      this.controller,
      this.message});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText ?? "",
        hintStyle: GoogleFonts.comfortaa(
          color: accent1Color,
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: accent1Color,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1,
          ),
        ),
      ),
      obscureText: isPassword ?? false,
      validator: ((value) {
        if (value?.isEmpty == true) {
          return message;
        } else {
          return null;
        }
      }),
    );
  }
}
