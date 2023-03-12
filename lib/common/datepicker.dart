import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../utils/constants/app_theme.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _date,
      decoration: InputDecoration(
        hintText: "Date",
        hintStyle: GoogleFonts.comfortaa(
          color: accent1Color,
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),

        prefixIcon: const Icon(Icons.calendar_today_outlined),
        // label: Text("Date"),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            builder: (context, child) {
              return Theme(
                  data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                          primary: AppColor.primaryColor)),
                  child: child!);
            },
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2029));
        if (pickedDate != null) {
          setState(() {
            _date.text = DateFormat("yyyy-MM-dd").format(pickedDate);
          });
        }
      },
    );
  }
}
