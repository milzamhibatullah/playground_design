import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playground_design/themes/app.theme.color.dart';
//// create class text and implement styles
class AppText{
  Widget title(
      {String? text = '',
        double size = 16.0,
        Color color = AppThemeColor.textPrimaryColor,
        bool italic = false}) =>
      Text(
        text!,
        style: GoogleFonts.poppins(
          fontSize: size,
          color: color,
          fontWeight: FontWeight.bold,
          height: 1.5,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal,
        ),
      );

  Widget regular(
      {String? text = '',
        double size = 14.0,
        Color color = AppThemeColor.textPrimaryColor,
        FontWeight weight = FontWeight.w400,
        double height=1.5,
        TextAlign align = TextAlign.start,
        bool italic = false}) =>
      Text(
        text!,
        textAlign: align,
        style: GoogleFonts.poppins(
          fontSize: size,
          color: color,
          height: height,
          fontWeight: weight,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal,
        ),
      );


  TextStyle styles({
    double size = 14.0,
    Color color = AppThemeColor.textPrimaryColor,
    bool italic = false,
    weight= FontWeight.w400,
  }) =>
      GoogleFonts.poppins(
        fontSize: size,
        color: color,
        fontWeight: weight,
        height: 1.5,
        fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      );

}
///initialize
///and use this as global ex: appText.title(...)
final appText = AppText();
