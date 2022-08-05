import 'package:flutter/material.dart';
import 'package:mental_health/widgets/text.dart';

PreferredSizeWidget appbar(String title) {
  return AppBar(
    title: textBold(title, 24, Colors.white),
    centerTitle: true,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue[400]!,
          Colors.pink[300]!,
          Colors.purple[400]!,
        ]),
      ),
    ),
  );
}
