import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nityahealth/common/custom_button.dart';
import 'package:nityahealth/common/custom_text_field.dart';
import 'package:nityahealth/common/ratings.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/user/ui/user_profile_details.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

class DoctorAppointment extends StatefulWidget {
  const DoctorAppointment({super.key});

  @override
  State<DoctorAppointment> createState() => _DoctorAppointmentState();
}

class _DoctorAppointmentState extends State<DoctorAppointment> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var ageController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        foregroundColor: accent2Color,
        shadowColor: Colors.transparent,
        backgroundColor: primaryColor,
        title: Text(
          "Appointment",
          style: GoogleFonts.comfortaa(
            fontSize: 18,
            color: accent2Color,
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => UserProfileDetails());
              },
              child: const Icon(
                Icons.account_circle,
                size: 25,
                color: accent2Color,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textF16W700("Appointment"),
            const SizedBox(height: 10),
            const DoctorsOverview(
              name: "Dr. Balestra",
              info: "Dental Surgeon",
              imageurl: "assets/images/doctors/balestra.png",
              routeName: "",
              rating: 4.5,
              rate: 28.29,
            ),
            const SizedBox(height: 16),
            textF16W700("Appointment Form"),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Patient's Name",
              message: "name required",
              controller: nameController,
            ),
            const SizedBox(height: 8),
            CustomTextField(
              hintText: "Contact Number",
              controller: phoneController,
              message: "phone required",
            ),
            const SizedBox(height: 8),
            CustomTextField(
              hintText: "Age",
              controller: ageController,
              message: "age required",
            ),
            const SizedBox(height: 8),
            const GenderDropdown(),
            const SizedBox(height: 8),
            // DatePicker(),
            CustomTextField(
              hintText: "Date",
              controller: dateController,
              message: "date required",
            ),
            const SizedBox(height: 8),
            CustomTextField(
              hintText: "Time",
              controller: timeController,
              message: "time required",
            ),
            const SizedBox(height: 8),
            CustomTextField(
              hintText: "Address",
              controller: addressController,
              message: "address required",
            ),
            const SizedBox(height: 16),
            appointmentConfirmedDialog(context),
          ],
        ),
      ),
    );
  }
}

//doctors Overview
class DoctorsOverview extends StatefulWidget {
  final String name;
  final String info;
  final String imageurl;
  final String routeName;
  final double rating;
  final double rate;

  const DoctorsOverview({
    Key? key,
    required this.name,
    required this.info,
    required this.imageurl,
    required this.routeName,
    required this.rating,
    required this.rate,
  }) : super(key: key);

  @override
  State<DoctorsOverview> createState() => _DoctorsOverviewState();
}

class _DoctorsOverviewState extends State<DoctorsOverview> {
  bool _isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
      } else {
        _isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, widget.routeName);
      },
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: accent2Color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: accent5Color,
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 90,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(
                    widget.imageurl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textF16W700(widget.name),
                      IconButton(
                        onPressed: _toggleFavorite,
                        icon: (_isFavorite
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 18,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                size: 18,
                                color: accent3Color,
                              )),
                      )
                    ],
                  ),
                  Text(
                    widget.info,
                    style: GoogleFonts.comfortaa(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ratings(widget.rating),
                      Text(
                        "\$ ${widget.rate} /hr",
                        style: GoogleFonts.comfortaa(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget appointmentConfirmedDialog(BuildContext context) {
  return GestureDetector(
    onTap: () => showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: SizedBox(
          height: MediaQuery.of(context).size.height / 3.5,
          child: Column(
            children: [
              Image.asset(
                "assets/images/common/like.png",
                height: 120,
              ),
              const SizedBox(height: 10),
              Text(
                "Thank You",
                style: GoogleFonts.comfortaa(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Your Appointment is Successful",
                style: GoogleFonts.comfortaa(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: accent3Color,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "You have an appointment with Dr. Pediatrician Purpieson on February 21, at 02:00 PM",
                style: GoogleFonts.comfortaa(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: accent3Color,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          customButton1("Done", "dashboard", context),
        ],
      ),
    ),
    child: Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: primaryColor,
        border: Border.all(
          color: primaryColor,
        ),
      ),
      child: Text(
        "Next",
        style: GoogleFonts.comfortaa(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}

class GenderDropdown extends StatefulWidget {
  const GenderDropdown({super.key});

  @override
  State<GenderDropdown> createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  List<String> items = [
    'Gender',
    'Male',
    'Female',
    'Others',
  ];
  String? selectedItem = "Gender";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: primaryColor,
              width: 1,
            ),
          ),
        ),
        value: selectedItem,
        items: items
            .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: GoogleFonts.comfortaa(
                    color: accent3Color,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                )))
            .toList(),
        onChanged: (String? item) {
          setState(() => selectedItem = item);
        },
      ),
    );
  }
}

//date picker overflow error

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextFormField(
        controller: _date,
        decoration: const InputDecoration(
          label: Text("Date"),
          icon: Icon(Icons.arrow_downward),
        ),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
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
      ),
    );
  }
}
