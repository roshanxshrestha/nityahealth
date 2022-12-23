import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import 'package:nityahealth/common/dash_widgets.dart';
import 'package:nityahealth/modules/drawer/ui/menu_drawer.dart';
import 'package:nityahealth/modules/profile/ui/user_profile_setting.dart';

class UserProfileDetails extends StatefulWidget {
  const UserProfileDetails({super.key});

  @override
  State<UserProfileDetails> createState() => _UserProfileDetailsState();
}

class _UserProfileDetailsState extends State<UserProfileDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
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
          "My Profile",
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
                Get.to(() => const UserProfileSetting());
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
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            padding: const EdgeInsets.only(top: 30),
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: primaryColor,
                        ),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/images/profile/user/profile.jpeg"),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: accent2Color,
                          ),
                          color: primaryColor,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: accent2Color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              textF16W700("Personal Details"),
              const SizedBox(height: 10),
              button2("Name", Icons.drive_file_rename_outline, "Falano", "",
                  context),
              button2("Gender", Icons.female, "Female", "", context),
              button2("Address", Icons.location_city, "Kathmandu", "", context),
              button2("Contact", Icons.phone, "9828211111", "", context),
              button2("Email", Icons.mail, "someone@example.com", "", context),
              const SizedBox(height: 30),
              textF16W700("Health Details"),
              const SizedBox(height: 10),
              button2("Height", MdiIcons.ruler, "5.9ft", "", context),
              button2("Weight", Icons.monitor_weight, "59 kg", "", context),
              button2("Blood Group", Icons.bloodtype, "O+", "", context),
              button2("Food Type", Icons.restaurant, "Vegan", "", context),
              const SizedBox(height: 30),
              textF16W700("Medical Condition"),
              const SizedBox(height: 10),
              button2("Disease", (MdiIcons.virus), "Migraine", "", context),
              button2("Type", (Icons.category), "Headache", "", context),
              button2("Cured?", (MdiIcons.virus), "No", "", context),
              button2("Medicine Name", (MdiIcons.pill), "Bruffin", "", context),
              button2("Medicine Duration", (MdiIcons.timerAlert), "2 Weeks", "",
                  context),
              button2("Other Medicines?", (MdiIcons.pill), "No", "", context),
            ],
          ),
        ),
      ),
    );
  }
}
