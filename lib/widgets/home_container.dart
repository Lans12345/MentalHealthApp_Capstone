import 'package:flutter/material.dart';
import 'package:mental_health/widgets/text.dart';

import 'image.dart';

Widget homeContainer(
  String path,
  String title,
  Color c1,
  Color c2,
  Color c3,
) {
  return Container(
    height: 150,
    width: 300,
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [
        c1,
        c2,
        c3,
      ]),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textBold(title, 24, Colors.white),
        const SizedBox(
          width: 50,
        ),
        image('assets/images/' + path, 45, 45, EdgeInsets.zero),
      ],
    ),
  );
}
