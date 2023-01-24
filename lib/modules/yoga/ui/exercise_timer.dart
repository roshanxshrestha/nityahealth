import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/user/ui/user_profile_details.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

import '../../../common/custom_appbar.dart';

class ExerciseTimer extends StatefulWidget {
  const ExerciseTimer({super.key});

  @override
  State<ExerciseTimer> createState() => _ExerciseTimerState();
}

class _ExerciseTimerState extends State<ExerciseTimer> {
  static const maxSeconds = 10;
  int seconds = maxSeconds;
  Timer? timer;

  Widget timerButton() {
    final isRunning = timer == null ? false : timer!.isActive;
    return isRunning
        ? Row(
            children: [
              TimerButton(
                icon: Icons.pause,
                onClicked: () {
                  stopTimer();
                },
              ),
              const SizedBox(width: 20),
              TimerButton(
                icon: Icons.restart_alt,
                onClicked: () {
                  stopTimer();
                },
              ),
            ],
          )
        : TimerButton(
            icon: Icons.arrow_right,
            onClicked: () {
              startTimer();
            },
          );
  }

  void resetTimer() => setState(() => seconds == maxSeconds);

  void stopTimer({bool reset = true}) {
    if (reset) {
      resetTimer();
    }
    timer?.cancel();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        stopTimer(reset: false);
      }
    });
  }

  Widget buildTime() {
    return Text(
      "$seconds",
      style: GoogleFonts.comfortaa(
          fontSize: 64,
          fontWeight: FontWeight.w300,
          color: AppColor.primaryColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Exercise"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/fitness/coreyoga.png",
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        customText("Easy Pose", 24, FontWeight.w700),
                        const SizedBox(height: 28),
                        buildTime(),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.keyboard_arrow_left,
                              size: 54,
                              color: AppColor.primaryColor,
                            ),
                            const SizedBox(width: 50),
                            timerButton(),
                            const SizedBox(width: 50),
                            const Icon(
                              Icons.keyboard_arrow_right,
                              size: 54,
                              color: AppColor.primaryColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimerButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onClicked;

  const TimerButton({super.key, required this.onClicked, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        shape: const CircleBorder(),
        backgroundColor: AppColor.primaryColor,
      ),
      child: Icon(
        icon,
        size: 50,
        color: AppColor.accent2Color,
      ),
    );
  }
}
