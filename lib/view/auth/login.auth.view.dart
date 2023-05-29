import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:playground_design/themes/app.theme.color.dart';

import '../../controller/login.controller.dart';

class LoginAuthView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppThemeColor.backgroundColor, Colors.black],

            ///set start background gradient color(background Color)
            begin: FractionalOffset(0.0, 0.0),

            ///set end color(black color)
            end: FractionalOffset(0.0, 1.0),
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [

              ],
            ),
          ),
        ),
      ),
    );
  }
}
