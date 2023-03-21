import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../utils/constants/app_theme.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  static const maxSeconds = 60;
  int seconds = maxSeconds;
  Timer? timer;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 100,
                      backgroundColor: AppColor.primaryColor,
                      progressColor: AppColor.secondaryColor,
                      percent: seconds / maxSeconds,
                      center: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: timeDisplay(),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // const Icon(
                        //   Icons.keyboard_arrow_left,
                        //   size: 54,
                        //   color: AppColor.primaryColor,
                        // ),
                        // const SizedBox(width: 50),
                        timerButton(),
                        // const SizedBox(width: 50),
                        // const Icon(
                        //   Icons.keyboard_arrow_right,
                        //   size: 54,
                        //   color: AppColor.primaryColor,
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

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
            ],
          )
        : Container(
            child: seconds != 0
                ? Row(
                    children: [
                      TimerButton(
                        icon: MdiIcons.play,
                        onClicked: () {
                          startTimer();
                        },
                      ),
                      const SizedBox(width: 20),
                      TimerButton(
                        icon: Icons.restart_alt,
                        onClicked: () {
                          resetTimer();
                        },
                      ),
                    ],
                  )
                : Row(
                    children: [
                      TimerButton(
                        icon: Icons.restart_alt,
                        onClicked: () {
                          resetTimer();
                        },
                      ),
                    ],
                  ),
          );
  }

  void resetTimer() {
    setState(() {
      seconds = maxSeconds;
    });
  }

  void stopTimer() {
    timer?.cancel();

    setState(() {
      TimerButton(
        icon: MdiIcons.play,
        onClicked: () {
          startTimer();
        },
      );
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        stopTimer();
      }
    });
  }

  Widget timeDisplay() {
    return seconds != 0
        ? SizedBox(
            height: 100,
            child: Text(
              "$seconds",
              style: GoogleFonts.comfortaa(
                  fontSize: 64,
                  fontWeight: FontWeight.w300,
                  color: AppColor.primaryColor),
            ),
          )
        : SizedBox(
            height: 80,
            child: Text("Completed!",
                style: GoogleFonts.comfortaa(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    color: AppColor.primaryColor)),
          );
  }
}

//for buttons
class TimerButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onClicked;

  const TimerButton({super.key, required this.onClicked, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ElevatedButton(
        onPressed: onClicked,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: AppColor.primaryColor,
        ),
        child: Icon(
          icon,
          size: 30,
          color: AppColor.accent2Color,
        ),
      ),
    );
  }
}
