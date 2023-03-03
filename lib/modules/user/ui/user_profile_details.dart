import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nityahealth/common/custom_button.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/user/controller/user_profile_controller.dart';
import 'package:nityahealth/modules/user/ui/user_update_screen.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import 'package:nityahealth/common/profile_setting_buttons.dart';

class UserProfileDetails extends StatelessWidget with ChangeNotifier {
  final _controller = Get.put(UserProfileController());
  UserProfileDetails({super.key});

  final picker = ImagePicker();

  XFile? _image;
  XFile? get image => _image;

  void pickImage(ImageSource source) async {
    final pickedFile =
        await picker.pickImage(source: source, imageQuality: 100);
    _image = XFile(pickedFile!.path);
    notifyListeners();
  }

  void pickerImage(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 120,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    pickImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.camera_alt_outlined,
                    color: AppColor.accent1Color,
                  ),
                  title: textF14W300("Camera"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    pickImage(ImageSource.gallery);
                  },
                  leading: const Icon(
                    Icons.photo,
                    color: AppColor.accent1Color,
                  ),
                  title: textF14W300("Gallery"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        progressIndicator:
            const CircularProgressIndicator(color: AppColor.primaryColor),
        isLoading: _controller.isLoading.value,
        opacity: 0.2,
        child: Scaffold(
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
                    Get.to(() => const UpdateProfile());
                  },
                  child: const Icon(
                    Icons.edit,
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
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: //image == null ?
                                  Image(
                                fit: BoxFit.cover,
                                image: image == null
                                    ? NetworkImage(_controller
                                            .userprofile.value.user?.image ??
                                        "assets/images/profile/user/profile.jpeg")
                                    : Image.file(
                                        File(image!.path),
                                      ) as ImageProvider,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: GestureDetector(
                              onTap: () {
                                pickerImage(context);
                              },
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
                                  MdiIcons.cameraPlus,
                                  color: accent2Color,
                                  size: 18,
                                ),
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
                        "Age",
                        MdiIcons.ruler,
                        _controller.userprofile.value.user?.age ?? "",
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
                    button2(
                        "Blood Group",
                        Icons.bloodtype,
                        _controller.userprofile.value.user?.bloodGrp ??
                            "section not available in api",
                        "",
                        context),
                    button2(
                        "Food Type",
                        Icons.restaurant,
                        _controller.userprofile.value.user?.meals ?? "",
                        "",
                        context),
                    const SizedBox(height: 30),
                    // textF16W700("Medical Condition"),
                    // const SizedBox(height: 10),
                    customButton1(
                        "See Medical Records", "usermedicalrecords", context),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
