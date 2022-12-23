import 'package:flutter/material.dart';
import 'package:nityahealth/common/grid_container.dart';

class Fitness extends StatefulWidget {
  const Fitness({super.key});

  @override
  State<Fitness> createState() => _FitnessState();
}

class _FitnessState extends State<Fitness> {
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
            imagepath: "assets/images/fitness/exercise.png",
            title: "Exercise",
            routeName: "",
          ),
          GridItems(
            imagepath: "assets/images/fitness/yoga.png",
            title: "Yoga",
            routeName: "trainers",
          ),
          GridItems(
            imagepath: "assets/images/fitness/gym.png",
            title: "Gym",
            routeName: "",
          ),
          GridItems(
            imagepath: "assets/images/fitness/meditation.png",
            title: "Meditation",
            routeName: "",
          ),
        ],
      ),
    );
  }
}
