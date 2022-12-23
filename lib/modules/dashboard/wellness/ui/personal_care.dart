import 'package:flutter/material.dart';
import 'package:nityahealth/common/grid_container.dart';

class PersonalCare extends StatefulWidget {
  const PersonalCare({super.key});

  @override
  State<PersonalCare> createState() => _PersonalCareState();
}

class _PersonalCareState extends State<PersonalCare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 8, right: 8, top: 0),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: const [
          GridItems(
            imagepath: "assets/images/personalcare/sleep.png",
            title: "Sleep",
            routeName: "trainers",
          ),
          GridItems(
            imagepath: "assets/images/personalcare/skincare.png",
            title: "Skin Care",
            routeName: "trainers",
          ),
          GridItems(
            imagepath: "assets/images/personalcare/relationship.png",
            title: "Relationship",
            routeName: "",
          ),
          GridItems(
            imagepath: "assets/images/personalcare/emotional.png",
            title: "Emotional Wellness",
            routeName: "trainers",
          ),
          GridItems(
            imagepath: "assets/images/personalcare/stress.png",
            title: "Stress",
            routeName: "",
          ),
          GridItems(
            imagepath: "assets/images/personalcare/financial.png",
            title: "Financial Wellness",
            routeName: "",
          ),
          GridItems(
            imagepath: "assets/images/personalcare/resilience.png",
            title: "Resilience",
            routeName: "",
          ),
          GridItems(
            imagepath: "assets/images/personalcare/mental.png",
            title: "Mental Wellness",
            routeName: "",
          ),
        ],
      ),
    );
  }
}
