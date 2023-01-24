import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/custom_button.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/user/controller/user_update_controller.dart';
import 'package:nityahealth/modules/user/ui/user_profile_details.dart';

import '../../../common/custom_text_field.dart';
import '../../../utils/constants/app_theme.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final _controller = Get.put(UserUpdateController());
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
            floating: true,
            foregroundColor: AppColor.accent2Color,
            shadowColor: Colors.transparent,
            backgroundColor: AppColor.primaryColor,
            title: Text(
              "Edit Profile",
              style: GoogleFonts.comfortaa(
                fontSize: 18,
                color: AppColor.accent2Color,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: SizedBox(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
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
                          CustomTextField(
                            message: "required",
                            hintText: "gender",
                            controller: genderController,
                          ),
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
                            hintText: "phone number",
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
                            hintText: "in years",
                            controller: ageController,
                          ),
                          const SizedBox(height: 20),
                          customText("Height", 14, FontWeight.w400),
                          const SizedBox(height: 5),
                          CustomTextField(
                            message: "height required",
                            hintText: "in cm",
                            controller: heightController,
                          ),
                          const SizedBox(height: 20),
                          customText("Weight", 14, FontWeight.w400),
                          const SizedBox(height: 5),
                          CustomTextField(
                            message: "weight required",
                            hintText: "in kgs",
                            controller: weightController,
                          ),
                          const SizedBox(height: 20),
                          customText("Blood Group", 14, FontWeight.w400),
                          const SizedBox(height: 5),
                          CustomTextField(
                            message: "required",
                            hintText: "blood group",
                            controller: bloodController,
                          ),
                          const SizedBox(height: 20),
                          customText("Food Type", 14, FontWeight.w400),
                          const SizedBox(height: 5),
                          CustomTextField(
                            message: "food type required",
                            hintText: "veg/non-veg",
                            controller: foodTypeController,
                          ),
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
                                    .then((value) {
                                  if (value == null) {
                                    // Get.snackbar(
                                    //     "Error", "Something went wrong!");
                                  } else {
                                    if (value.success!) {
                                      Get.to(UserProfileDetails());
                                    }
                                  }
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
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
