import 'package:flutter/material.dart';

import '../../themes/app.theme.color.dart';

///this progress bar is custom not use linear progress indicator
///we need value and color
///
class CustomProgressBar extends StatelessWidget {
  final double value;
  final Color valueColor;
  final Color backgroundColor;
  final Color borderColor;
  double? height;

  CustomProgressBar(
      {Key? key,
      required this.value,
      required this.valueColor,
      this.height,
      required this.borderColor,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 14.0),
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 1.25),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),

      ///we need fractionallysizedbox to creatd rounded on right value color
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,

        ///width factor as value the percentage
        ///to max value set width factor 1 ex : 1 means 100%, .66 means 66%
        widthFactor: value,
        child: Container(
          decoration: BoxDecoration(
            color: valueColor,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
      ),
    );
  }
}
