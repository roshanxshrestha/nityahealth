import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  String? name;
  String? address;
  String? hintText;
  bool? isPassword;
  bool? isEmail = false;
  bool? isPhone = false;
  IconData? icon;
  TextEditingController? controller;
  String? message;

  CustomTextField({
    super.key,
    this.name,
    this.address,
    this.hintText,
    this.isEmail,
    this.icon,
    this.isPassword,
    this.isPhone,
    this.controller,
    this.message,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: "hello");
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      controller: widget.controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: widget.hintText ?? "",
        hintStyle: GoogleFonts.comfortaa(
          color: accent1Color,
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        //   borderSide: const BorderSide(
        //     color: accent1Color,
        //     width: 1,
        //   ),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        //   borderSide: const BorderSide(
        //     color: Colors.blue,
        //     width: 1,
        //   ),
        // ),
      ),
      obscureText: widget.isPassword ?? false,
      validator: ((value) {
        if (value?.isEmpty == false) {
          if (widget.isEmail == true &&
              !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                  .hasMatch(value.toString())) {
            return "enter valid email";
          } else if (widget.isPhone == true) {
            if (value?.length != 10) {
              return "enter 10 digits mobile number";
            }
          }
          return null;
        } else {
          return widget.message;
        }
      }),
    );
  }
}
