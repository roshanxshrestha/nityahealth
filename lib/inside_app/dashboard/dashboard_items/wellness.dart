import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/constants/app_constants.dart';
import 'package:nityahealth/inside_app/dashboard/container_widgets.dart/list_tile.dart';

class Wellness extends StatefulWidget {
  const Wellness({super.key});

  @override
  State<Wellness> createState() => _WellnessState();
}

class _WellnessState extends State<Wellness> {
  final List tileItems = [
    [
      "Fitness",
      true,
    ],
    [
      "Food",
      false,
    ],
    [
      "Personal Care",
      false,
    ],
    [
      "Health Topics",
      false,
    ],
  ];
  void wellnessTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < tileItems.length; i++) {
        tileItems[i][1] = false;
      }
      tileItems[index][1] = true;
    });
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
          "Wellness",
          style: GoogleFonts.comfortaa(
            fontSize: 18,
            color: accent2Color,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tileItems.length,
            itemBuilder: (context, index) {
              return TileItems(
                tileTitle: tileItems[index][0],
                isSelected: tileItems[index][1],
                onTap: () {
                  wellnessTypeSelected(index);
                },
              );
            },
          ),
          // child: ListView(
          //   scrollDirection: Axis.horizontal,
          //   children: [
          //     TileItems(
          //       title: "Fitness",
          //       isSelected: true,
          //       onTap: wellnessTypeSelected,
          //     ),
          //     TileItems(
          //       title: "Food",
          //       isSelected: false,
          //       onTap: () {},
          //     ),
          //     TileItems(
          //       title: "Personal Care",
          //       isSelected: false,
          //       onTap: () {},
          //     ),
          //     TileItems(
          //       title: "Health Topics",
          //       isSelected: false,
          //       onTap: () {},
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
