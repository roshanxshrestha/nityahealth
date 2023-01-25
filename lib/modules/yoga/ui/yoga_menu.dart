import 'package:flutter/material.dart';
import 'package:nityahealth/common/fitness_container.dart';
import 'package:nityahealth/common/text_style.dart';
import '../../../common/custom_appbar.dart';

class YogaMenu extends StatelessWidget {
  const YogaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Yoga"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText("Your Classes", 18, FontWeight.w700),
              const SizedBox(height: 16),
              SizedBox(
                height: 230,
                child: ListView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  children: [
                    fitnessContainer(
                      "Core Yoga",
                      "assets/images/fitness/yoga1.png",
                      "05:30 minutes",
                      "13 exercises",
                    ),
                    fitnessContainer(
                      "Dynamic Yoga",
                      "assets/images/fitness/yoga2.png",
                      "05:30 minutes",
                      "11 exercises",
                    ),
                    fitnessContainer(
                      "Gentle Yoga",
                      "assets/images/fitness/yoga1.png",
                      "05:30 minutes",
                      "11 exercises",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              customText("Recommended", 18, FontWeight.w700),
              const SizedBox(height: 16),
              SizedBox(
                height: 230,
                child: ListView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  children: [
                    fitnessContainer(
                      "Gym Workout",
                      "assets/images/fitness/yoga1.png",
                      "1.5 hours",
                      "13 exercises",
                    ),
                    fitnessContainer(
                      "Weight Lifting",
                      "assets/images/fitness/yoga2.png",
                      "30 minutes",
                      "11 exercises",
                    ),
                    fitnessContainer(
                      "Running",
                      "assets/images/fitness/yoga1.png",
                      "1 hour",
                      "11 exercises",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              customText("Most Popular", 18, FontWeight.w700),
              const SizedBox(height: 16),
              SizedBox(
                height: 230,
                child: ListView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  children: [
                    fitnessContainer(
                      "Gym Workout",
                      "assets/images/fitness/yoga1.png",
                      "1.5 hours",
                      "13 exercises",
                    ),
                    fitnessContainer(
                      "Weight Lifting",
                      "assets/images/fitness/yoga2.png",
                      "30 minutes",
                      "11 exercises",
                    ),
                    fitnessContainer(
                      "Running",
                      "assets/images/fitness/yoga1.png",
                      "1 hour",
                      "11 exercises",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
