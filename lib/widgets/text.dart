import 'package:flutter/material.dart';

textReg(String txt, double size, Color color) {
  return Text(
    txt,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontFamily: 'QRegular',
    ),
  );
}

textBold(String txt, double size, Color color) {
  return Text(
    txt,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontFamily: 'QBold',
    ),
  );
}
