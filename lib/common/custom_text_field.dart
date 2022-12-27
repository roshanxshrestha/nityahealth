import 'package:flutter/material.dart';
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

  CustomTextField({
    super.key,
    this.name,
    this.address,
    this.hintText,
    this.isNumber,
    this.icon,
    this.isPassword,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText ?? "",
        hintStyle: const TextStyle(
          color: accent1Color,
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
            color: primaryColor,
            width: 1,
          ),
        ),
      ),
      obscureText: isPassword ?? false,
    );
  }
}
