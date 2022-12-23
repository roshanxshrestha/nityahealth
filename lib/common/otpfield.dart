import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//otp field
Widget otpField(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          offset: Offset(0, 0),
          blurRadius: 5,
          spreadRadius: 1,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.only(bottom: 6.0, left: 7, right: 7),
      child: Form(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            otpContainer(context, 1),
            otpContainer(context, 2),
            otpContainer(context, 3),
            otpContainer(context, 4),
            otpContainer(context, 5),
            otpContainer(context, 6),
          ],
        ),
      ),
    ),
  );
}

//otp container
Widget otpContainer(BuildContext context, int boxValue) {
  return Container(
    height: 50,
    width: 42,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.transparent,
    ),
    child: TextFormField(
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
      },
      onSaved: (boxValue) {},
      // decoration: const InputDecoration(hintText: "."),
      style: Theme.of(context).textTheme.headlineSmall,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
      obscureText: false,
    ),
  );
}
