import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/modules/user_medical/medicalrec.dart';
import 'package:nityahealth/modules/user_medical/medicine_rec.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

import '../../common/text_style.dart';

class UserMedicalRecords extends StatefulWidget {
  const UserMedicalRecords({super.key});

  @override
  State<UserMedicalRecords> createState() => _UserMedicalRecordsState();
}

class _UserMedicalRecordsState extends State<UserMedicalRecords> {
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
        backgroundColor: AppColor.primaryColor,
        title: Text(
          "Medical Records",
          style: GoogleFonts.comfortaa(
            fontSize: 18,
            color: accent2Color,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: Column(
        children: [
          DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: TabBar(
                    isScrollable: true,
                    labelColor: AppColor.accent2Color,
                    unselectedLabelColor: AppColor.accent3Color,
                    indicator: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: AppColor.primaryColor,
                    ),
                    tabs: [
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Tab(
                          child: textF16W700(
                            "Medical Condition",
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Tab(
                          child: textF16W700(
                            "Medicine Record",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: const TabBarView(
                    children: [
                      MedicalRecord(),
                      MedicineRecord(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
