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

  CustomTextField({
    super.key,
    this.name,
    this.address,
    this.hintText,
    this.isNumber,
    this.icon,
    this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText ?? "",
        hintStyle: const TextStyle(
          color: accent1Color,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      obscureText: isPassword ?? false,
    );
  }
}
