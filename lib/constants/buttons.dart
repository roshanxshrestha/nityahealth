//button 1
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/constants/app_constants.dart';

//custom button 1
Widget customButton1(String title, String routeName, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, routeName);
    },
    child: Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 1.1,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: primaryColor,
        border: Border.all(
          color: primaryColor,
        ),
      ),
      child: Text(
        title,
        style: GoogleFonts.comfortaa(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}

//skip widget with dialog
class Skip extends StatelessWidget {
  const Skip({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            'Are you sure you want to skip login?',
            style: GoogleFonts.comfortaa(
              fontSize: 18,
              color: accent1Color,
              fontWeight: FontWeight.w700,
            ),
          ),
          content: Text(
            'Sign in to get the most out of us.',
            style: GoogleFonts.comfortaa(
              fontSize: 14,
              color: accent1Color,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Text(
                'Cancel',
                style: GoogleFonts.comfortaa(
                  fontSize: 18,
                  color: primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, 'guest_page'),
              child: Text(
                'Continue',
                style: GoogleFonts.comfortaa(
                  fontSize: 18,
                  color: primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
      child: Text(
        'Skip',
        style: GoogleFonts.comfortaa(
          color: primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

//input email field
Widget emailField() {
  return TextField(
    keyboardType: TextInputType.emailAddress,
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      label: const Padding(
        padding: EdgeInsets.only(top: 0),
        child: Icon(Icons.email),
      ),
      fillColor: Colors.white,
      filled: true,
      hintText: 'someone@example.com',
      hintStyle: const TextStyle(
        color: primaryColor,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}

//password field box
Widget passwordField(String hintText) {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      fillColor: Colors.white,
      filled: true,
      hintText: hintText,
      hintStyle: const TextStyle(
        color: primaryColor,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      label: const Padding(
        padding: EdgeInsets.only(top: 0),
        child: Icon(Icons.lock),
      ),
    ),
    obscureText: true,
  );
}

//name fields
Widget nameField(String hintText) {
  return TextFormField(
    keyboardType: TextInputType.name,
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      fillColor: Colors.white,
      filled: true,
      hintText: hintText,
      hintStyle: const TextStyle(
        color: primaryColor,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}

//contact number /phone  field box
Widget phoneField() {
  return TextFormField(
    inputFormatters: [
      LengthLimitingTextInputFormatter(10),
      FilteringTextInputFormatter.digitsOnly,
    ],
    keyboardType: TextInputType.phone,
    decoration: InputDecoration(
      fillColor: Colors.white,
      filled: true,
      hintText: 'Enter mobile number',
      hintStyle: const TextStyle(
        color: primaryColor,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      label: const Padding(
        padding: EdgeInsets.only(top: 0),
        child: Icon(Icons.phone),
      ),
    ),
  );
}
