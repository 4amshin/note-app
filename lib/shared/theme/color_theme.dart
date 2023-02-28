import 'package:flutter/material.dart';

Color nBlue = const Color(0xff7ecbff);
Color nOrange = const Color(0xffffa447);
Color nOrange2 = const Color.fromARGB(255, 240, 155, 70);
Color nCyan = const Color(0xff1eccc3);
Color nPink = const Color(0xffffa6c4);
Color nPink2 = const Color(0xffffa3a3);

Map<Color, String> colorNames = {
  nBlue: 'nBlue',
  nOrange: 'nOrange',
  nOrange2: 'nOrange2',
  nCyan: 'nCyan',
  nPink: 'nPink',
  nPink2: 'nPink2',
};

Color getColorFromColorString(String colorString) {
  Color color = nBlue; // Default color if colorString is invalid
  switch (colorString) {
    case "nBlue":
      color = nBlue;
      break;
    case "nOrange":
      color = nOrange;
      break;
    case "nCyan":
      color = nCyan;
      break;
    case "nPink":
      color = nPink;
      break;
    case "nPink2":
      color = nPink2;
      break;
  }
  return color;
}
