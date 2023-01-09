import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../modules/user/ui/user_profile_details.dart';
import '../utils/constants/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      foregroundColor: accent2Color,
      shadowColor: Colors.transparent,
      backgroundColor: primaryColor,
      title: Text(
        title,
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
              Get.off(() => UserProfileDetails());
            },
            child: const Icon(
              Icons.account_circle,
              size: 25,
              color: accent2Color,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
