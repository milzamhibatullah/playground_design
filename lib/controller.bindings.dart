
import 'package:get/get.dart';
import 'package:playground_design/controller/auth.controller.dart';
///we create global bindings of controller
class ControllerBindings implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut<AuthController>(() => AuthController());
  }

}