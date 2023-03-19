import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:nityahealth/common/bloodgroup_dropdown.dart';
import 'package:nityahealth/common/custom_button.dart';
import 'package:nityahealth/common/foodtype_dropdown.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/user/controller/user_update_controller.dart';
import 'package:nityahealth/modules/user/ui/user_profile_details.dart';

import '../../../common/custom_text_field.dart';
import '../../../common/gender_dropdown.dart';
import '../../../utils/constants/app_theme.dart';
import '../controller/user_profile_controller.dart';

class UpdateProfile extends StatefulWidget {
  UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  ImageUpdateController imageUpdateController =
      Get.put(ImageUpdateController());

  File? pickedFile;

  ImagePicker imagePicker = ImagePicker();

  final _controller = Get.put(UserUpdateController());

  final _updateController = Get.put(UserProfileController());

  var nameController = TextEditingController();

  var genderController = TextEditingController();

  var emailController = TextEditingController();

  var addressController = TextEditingController();

  var phoneController = TextEditingController();

  var ageController = TextEditingController();

  var heightController = TextEditingController();

  var weightController = TextEditingController();

  var bloodController = TextEditingController();

  var foodTypeController = TextEditingController();

  var imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  get message => null;

  void initState() {
    nameController.text = _updateController.userprofile.value.user?.name ?? "";
    genderController.text =
        _updateController.userprofile.value.user?.gender ?? "";
    emailController.text =
        _updateController.userprofile.value.user?.email ?? "";
    addressController.text =
        _updateController.userprofile.value.user?.address ?? "";
    phoneController.text =
        _updateController.userprofile.value.user?.phone ?? "";
    ageController.text = _updateController.userprofile.value.user?.age ?? "";
    heightController.text =
        _updateController.userprofile.value.user?.height ?? "";
    weightController.text =
        _updateController.userprofile.value.user?.weight ?? "";
    bloodController.text =
        _updateController.userprofile.value.user?.bloodGrp ?? "";
    foodTypeController.text =
        _updateController.userprofile.value.user?.meals ?? "";
    // super.initState();
  }

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
          "Edit Personal Details",
          style: GoogleFonts.comfortaa(
            fontSize: 18,
            color: accent2Color,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            Obx(
                              () => CircleAvatar(
                                radius: 83,
                                backgroundColor: AppColor.primaryColor,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: imageUpdateController
                                              .isProfileImgPathSet.value ==
                                          true
                                      ? FileImage(File(imageUpdateController
                                          .profileImgPath
                                          .value)) as ImageProvider
                                      : NetworkImage(_controller
                                              .userprofile.value.user?.image ??
                                          "assets/images/profile/user/profile.jpeg"),
                                  radius: 80,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 105,
                              child: InkWell(
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 3,
                                    ),
                                    color: AppColor.primaryColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const Icon(
                                    MdiIcons.cameraPlus,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return bottomSheet(context);
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      customText("Name", 14, FontWeight.w400),
                      const SizedBox(height: 5),
                      CustomTextField(
                        message: "name required",
                        hintText: "Full name",
                        controller: nameController,
                      ),
                      const SizedBox(height: 20),
                      customText("Gender", 14, FontWeight.w400),
                      const SizedBox(height: 5),
                      GenderDropdown(
                          _updateController.userprofile.value.user?.gender ??
                              ""),
                      const SizedBox(height: 20),
                      customText("Address", 14, FontWeight.w400),
                      const SizedBox(height: 5),
                      CustomTextField(
                        message: "address required",
                        hintText: "address",
                        controller: addressController,
                      ),
                      const SizedBox(height: 20),
                      customText("Contact", 14, FontWeight.w400),
                      const SizedBox(height: 5),
                      CustomTextField(
                        isPhone: true,
                        message: "phone required",
                        hintText: "10 digits phone number",
                        controller: phoneController,
                      ),
                      const SizedBox(height: 20),
                      customText("Email", 14, FontWeight.w400),
                      const SizedBox(height: 5),
                      CustomTextField(
                        message: "email required",
                        hintText: "email",
                        isEmail: true,
                        controller: emailController,
                      ),
                      const SizedBox(height: 20),
                      customText("Age", 14, FontWeight.w400),
                      const SizedBox(height: 5),
                      CustomTextField(
                        message: "age required",
                        hintText: "age",
                        controller: ageController,
                      ),
                      const SizedBox(height: 20),
                      customText("Height (ft)", 14, FontWeight.w400),
                      const SizedBox(height: 5),
                      CustomTextField(
                        message: "height required",
                        hintText: "height",
                        controller: heightController,
                      ),
                      const SizedBox(height: 20),
                      customText("Weight (kg)", 14, FontWeight.w400),
                      const SizedBox(height: 5),
                      CustomTextField(
                        message: "weight required",
                        hintText: "weight",
                        controller: weightController,
                      ),
                      const SizedBox(height: 20),
                      customText("Blood Group", 14, FontWeight.w400),
                      const SizedBox(height: 5),
                      BloodGroupDropdown(
                          selectedValue: _updateController
                                  .userprofile.value.user?.bloodGrp ??
                              ""),
                      const SizedBox(height: 20),
                      customText("Food Type", 14, FontWeight.w400),
                      const SizedBox(height: 5),
                      FoodTypeDropdown(
                          selectedValue:
                              _updateController.userprofile.value.user?.meals ??
                                  ""),
                      const SizedBox(height: 25),
                      customButton2("image", context, uploadImage),
                      const SizedBox(height: 25),
                      customButton2(
                        "Save",
                        context,
                        () async {
                          uploadImage();
                          // showDialog(
                          //   context: context,
                          //   builder: (context) {
                          //     return const Center(
                          //       child: CircularProgressIndicator(
                          //         color: AppColor.primaryColor,
                          //       ),
                          //     );
                          //   },
                          // );
                          if (_formKey.currentState?.validate() == true) {
                            _formKey.currentState?.save();
                            var name = nameController.text.trim();
                            var address = addressController.text.trim();
                            var email = emailController.text.trim();
                            var image = imageController.text.trim();
                            var phone = phoneController.text.trim();
                            var age = ageController.text.trim();
                            var height = heightController.text.trim();
                            var weight = weightController.text.trim();

                            Map<String, String> map = {};
                            map["name"] = name;
                            map["image"] = image;
                            map["address"] = address;
                            map["email"] = email;
                            map["meals"] = _controller.selectedFoodType.value;
                            map["gender"] =
                                _controller.selectedGender.value.toLowerCase();
                            map["phone"] = phone;
                            map["age"] = age;
                            map["height"] = height;
                            map["weight"] = weight;
                            map["blood"] = _controller.selectedBloodGroup.value
                                .toUpperCase();

                            _controller.updateProfile(map).then(
                              (value) {
                                Get.offAll(() => UserProfileDetails());
                              },
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height / 5,
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            "Choose profile image",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  takePhoto(ImageSource.gallery);
                },
                child: Column(
                  children: const [
                    Icon(
                      Icons.image,
                      size: 30,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Gallery",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 80),
              InkWell(
                onTap: () {
                  takePhoto(ImageSource.camera);
                },
                child: Column(
                  children: const [
                    Icon(
                      Icons.camera_alt_outlined,
                      size: 30,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Camera",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);

    pickedFile = File(pickedImage!.path);
    imageUpdateController.setProfileImagePath(pickedFile!.path);

    Get.back();
  }

  Future<void> uploadImage() async {
    var stream = http.ByteStream(pickedFile!.openRead());
    stream.cast();

    var length = await pickedFile!.length();
    var uri = Uri.parse("http://health.sajiloweb.com/api/update/user/profile");
    var request = http.MultipartRequest("POST", uri);
    request.fields["image"] = "Static Profile Image";
    var multipart = http.MultipartFile("image", stream, length);
    request.files.add(multipart);
    var response = await request.send();
    if (response.statusCode == 200) {
      log("image uploaded");
    } else {
      log("Failed");
    }
  }
}
