import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nityahealth/common/bloodgroup_dropdown.dart';
import 'package:nityahealth/common/custom_button.dart';
import 'package:nityahealth/common/foodtype_dropdown.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/user/controller/user_update_controller.dart';
import 'package:nityahealth/modules/user/ui/user_profile_details.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

import '../../../common/custom_text_field.dart';
import '../../../common/gender_dropdown.dart';
import '../../../utils/constants/app_theme.dart';
import '../controller/user_profile_controller.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
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

  @override
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
    super.initState();
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
                      const GenderDropdown(),
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
                      NumberInputWithIncrementDecrement(
                        widgetContainerDecoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                        numberFieldDecoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintStyle: GoogleFonts.comfortaa(
                            color: accent1Color,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        textAlign: TextAlign.left,
                        min: 0,
                        max: 150,
                        incDecBgColor: Colors.white,
                        controller: TextEditingController(),
                        initialValue: int.parse(ageController.text),
                      ),
                      const SizedBox(height: 20),
                      customText("Height (ft)", 14, FontWeight.w400),
                      const SizedBox(height: 5),
                      NumberInputWithIncrementDecrement(
                        widgetContainerDecoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                        numberFieldDecoration: InputDecoration(
                          // border: InputBorder.none,
                          fillColor: Colors.white,
                          filled: true,
                          hintStyle: GoogleFonts.comfortaa(
                            color: accent1Color,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        isInt: false,
                        incDecFactor: 0.1,
                        textAlign: TextAlign.left,
                        min: 0,
                        max: 300,
                        incDecBgColor: Colors.white,
                        controller: heightController,
                        initialValue: double.parse(heightController.text),
                      ),
                      const SizedBox(height: 20),
                      customText("Weight (kg)", 14, FontWeight.w400),
                      const SizedBox(height: 5),
                      NumberInputWithIncrementDecrement(
                        widgetContainerDecoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                        numberFieldDecoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintStyle: GoogleFonts.comfortaa(
                            color: accent1Color,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        textAlign: TextAlign.left,
                        min: 0,
                        max: 300,
                        incDecBgColor: Colors.white,
                        initialValue: int.parse(weightController.text),
                        controller: weightController,
                      ),
                      const SizedBox(height: 20),
                      customText("Blood Group", 14, FontWeight.w400),
                      const SizedBox(height: 5),
                      const BloodGroupDropdown(),
                      const SizedBox(height: 20),
                      customText("Food Type", 14, FontWeight.w400),
                      const SizedBox(height: 5),
                      const FoodTypeDropdown(),
                      const SizedBox(height: 25),
                      customButton2(
                        "Save",
                        context,
                        () async {
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
                            var foodType = foodTypeController.text.trim();
                            var image = imageController.text.trim();
                            var gender = genderController.text.trim();
                            var phone = phoneController.text.trim();
                            var age = ageController.text.trim();
                            var height = heightController.text.trim();
                            var weight = weightController.text.trim();
                            var blood = bloodController.text.trim();

                            _controller
                                .updateProfile(
                                    name,
                                    address,
                                    email,
                                    foodType,
                                    image,
                                    gender,
                                    phone,
                                    age,
                                    height,
                                    weight,
                                    blood)
                                .then(
                              (value) {
                                if (value != null && value.success!) {
                                  Get.to(UserProfileDetails());
                                  // Get.snackbar(
                                  //     "Error", "Something went wrong!");
                                }
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
}
