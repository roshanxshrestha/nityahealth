import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nityahealth/common/custom_appbar.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/user/controller/user_profile_controller.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import 'package:nityahealth/common/profile_setting_buttons.dart';
import 'package:nityahealth/modules/drawer/ui/menu_drawer.dart';

class UserProfileDetails extends StatelessWidget {
  UserProfileDetails({super.key});

  final _controller = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: const CustomAppBar(title: "My Profile"),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Obx(
            () => ListView(
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
                button2(
                    "Name",
                    Icons.drive_file_rename_outline,
                    _controller.userprofile.value.user?.name ?? "",
                    "",
                    context),
                button2(
                    "Gender",
                    MdiIcons.genderMaleFemale,
                    _controller.userprofile.value.user?.gender ?? "",
                    "",
                    context),
                button2(
                    "Address",
                    Icons.location_city,
                    _controller.userprofile.value.user?.address ?? "",
                    "",
                    context),
                button2(
                    "Contact",
                    Icons.phone,
                    _controller.userprofile.value.user?.phone ?? "",
                    "",
                    context),
                button2(
                    "Email",
                    Icons.mail,
                    _controller.userprofile.value.user?.email ?? "",
                    "",
                    context),
                const SizedBox(height: 30),
                textF16W700("Health Details"),
                const SizedBox(height: 10),
                button2("Age", MdiIcons.ruler,
                    _controller.userprofile.value.user?.age ?? "", "", context),
                button2(
                    "Height",
                    MdiIcons.ruler,
                    _controller.userprofile.value.user?.height ?? "",
                    "",
                    context),
                button2(
                    "Weight",
                    Icons.monitor_weight,
                    _controller.userprofile.value.user?.weight ?? "",
                    "",
                    context),
                button2("Blood Group", Icons.bloodtype,
                    "section not available in api", "", context),
                button2(
                    "Food Type",
                    Icons.restaurant,
                    _controller.userprofile.value.user?.meals ?? "",
                    "",
                    context),
                const SizedBox(height: 30),
                textF16W700("Medical Condition"),
                const SizedBox(height: 10),
                button2("Disease", (MdiIcons.virus), "Migraine", "", context),
                button2("Type", (Icons.category), "Headache", "", context),
                button2("Cured?", (MdiIcons.virus), "No", "", context),
                button2(
                    "Medicine Name", (MdiIcons.pill), "Bruffin", "", context),
                button2("Medicine Duration", (MdiIcons.timerAlert), "2 Weeks",
                    "", context),
                button2("Other Medicines?", (MdiIcons.pill), "No", "", context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
