import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget ratings(double rating) {
  return RatingBarIndicator(
    rating: rating,
    itemBuilder: (context, index) => const Icon(
      Icons.star,
      color: Colors.amber,
    ),
    itemCount: 5,
    itemSize: 16.0,
    direction: Axis.horizontal,
  );
}
