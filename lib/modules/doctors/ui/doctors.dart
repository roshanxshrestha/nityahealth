import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/custom_appbar.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/doctors/controller/doctors_controller.dart';
import 'package:nityahealth/modules/doctors/model/doctors_model.dart';
import 'package:nityahealth/modules/doctors/ui/dotor_profile.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import 'package:nityahealth/modules/drawer/ui/menu_drawer.dart';

class FindDoctors extends StatelessWidget {
  final _controller = Get.put(DoctorsController());

  FindDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: const CustomAppBar(title: "Doctors"),
      body: Obx(
        () {
          print("count = ${_controller.doctorModel.value.doctors?.length}");
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textF16W700("Find your desired doctor"),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: const Icon(Icons.search),
                      hintText: 'Search Doctors',
                    ),
                  ),
                  const SizedBox(height: 16),
                  textF16W700("Categories"),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 137,
                    child: Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          doctorCategories("Eye Specialist",
                              "assets/images/doctors/eye.png", "", context),
                          const SizedBox(width: 16),
                          doctorCategories(
                              "Dental Surgeon",
                              "assets/images/doctors/dental.png",
                              "dentaldoctors",
                              context),
                          const SizedBox(width: 16),
                          doctorCategories("Heart Surgeon",
                              "assets/images/doctors/heart.png", "", context),
                          const SizedBox(width: 16),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textF16W700("Top Doctors"),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "View all",
                          style: GoogleFonts.comfortaa(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: accent3Color,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 450,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _controller.doctorModel.value.doctors ==
                                    null
                                ? 0
                                : _controller.doctorModel.value.doctors?.length,
                            itemBuilder: (BuildContext context, int index) {
                              Doctors? doctor =
                                  _controller.doctorModel.value.doctors?[index];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => const DoctorProfile());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 23, right: 23),
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: accent2Color,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: accent5Color,
                                            blurRadius: 5,
                                            spreadRadius: 2),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 65,
                                          width: 65,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image(
                                              image: NetworkImage(
                                                  doctor?.image ?? ""),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            textF16W700(
                                                doctor!.name.toString()),
                                            const SizedBox(height: 10),
                                            Text(
                                              doctor.speciality.toString(),
                                              style: GoogleFonts.comfortaa(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

//categories
Widget doctorCategories(
    String title, String imageurl, String routeName, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, routeName);
    },
    child: Container(
      // width: MediaQuery.of(context).size.width / 3,
      width: 108,
      decoration: BoxDecoration(
        color: accent2Color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: accent5Color, blurRadius: 5, spreadRadius: 2),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageurl),
            const SizedBox(height: 5),
            textF16W700(title),
          ],
        ),
      ),
    ),
  );
}

//top doctors list
Widget topDoctorsList(String name, String info, String imageurl) {
  return GestureDetector(
    onTap: () {
      Get.to(() => const DoctorProfile());
    },
    child: Container(
      padding: const EdgeInsets.only(left: 23, right: 23),
      height: 87,
      decoration: BoxDecoration(
        color: accent2Color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: accent5Color, blurRadius: 5, spreadRadius: 2),
        ],
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.space,
        children: [
          Image.asset(imageurl),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textF16W700(name),
              const SizedBox(height: 10),
              Text(
                info,
                style: GoogleFonts.comfortaa(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
