// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:test_project/constant/fonts.dart';

class TextStyleApp {
  TextStyle urban_semibold({Color? color, double? size, FontWeight? weight}) {
    return TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
        fontFamily: FontApp.urban_semibold.font);
  }

  TextStyle urban_medium({Color? color, double? size, FontWeight? weight}) {
    return TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
        fontFamily: FontApp.urban_medium.font);
  }

  TextStyle urban_light({Color? color, double? size, FontWeight? weight}) {
    return TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
        fontFamily: FontApp.urban_light.font);
  }

  TextStyle urban_regular({Color? color, double? size, FontWeight? weight}) {
    return TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
        fontFamily: FontApp.urban_regular.font);
  }
}
