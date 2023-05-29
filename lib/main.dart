import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playground_design/controller.bindings.dart';
import 'package:playground_design/view/auth/register.auth.view.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RegisterAuthView(),
      initialBinding: ControllerBindings(),
    ),
  );
}
