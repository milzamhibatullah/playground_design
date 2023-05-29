import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:playground_design/themes/app.text.theme.dart';
import 'package:playground_design/themes/app.theme.color.dart';
import 'package:playground_design/view/component/custom.progressbar.component.dart';

import '../../controller/auth.controller.dart';

class RegisterAuthView extends GetView<AuthController> {
  const RegisterAuthView({super.key});

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
            child: Obx(() => Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///display logo
                    Container(
                      margin: const EdgeInsets.only(top: 60.0, bottom: 42.0),
                      child: Center(
                        child: CircleAvatar(
                          radius: 75.0,
                          backgroundColor: const Color(0xFFEBEBEB),

                          ///use transform to set image bigger than parent
                          child: Transform.scale(
                            scale: 1.7,
                            child: Image.asset(
                              'assets/samurai.png',
                            ),
                          ),
                        ),
                      ),
                    ),

                    ///display field input email
                    _fieldInputTextWidget('Email', false,
                        TextInputType.emailAddress, controller.emailField),

                    ///display field input new password
                    _fieldInputTextWidget('New Password', true,
                        TextInputType.text, controller.newPasswordField),

                    ///display field input new password
                    _fieldInputTextWidget('Confirm Password', true,
                        TextInputType.text, controller.confirmPasswordField),

                    CustomProgressBar(
                        value: controller.progressValue.value,
                        height: 20.0,
                        valueColor: AppThemeColor.tertiaryColor,
                        borderColor: Colors.white,
                        backgroundColor: Colors.transparent),

                    ///text information password strength
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 2.0,
                      children: [
                        /// '\u2022 means bullet list'
                        appText.regular(
                          text: '\u2022 Use 6 to 10 characters Use',
                          color: controller.hasLength()
                              ? AppThemeColor.textPrimaryColor
                              : AppThemeColor.textSecondaryColor
                                  .withOpacity(.5),
                          size: 12.0,
                        ),
                        appText.regular(
                            text:
                                '\u2022 Use Combination uppercase and lowercase',
                            color:  controller.hasUppercaseLowercaseAndMoreThan6()
                                ? AppThemeColor.textPrimaryColor
                                : AppThemeColor.textSecondaryColor
                                    .withOpacity(.5),
                            size: 12.0),
                        appText.regular(
                          text: '\u2022 Use combination alphanumeric',
                          color: controller.hasNumericAndMoreThan6()
                              ? AppThemeColor.textPrimaryColor
                              : AppThemeColor.textSecondaryColor
                                  .withOpacity(.5),
                          size: 12.0,
                        ),
                      ],
                    ),

                    _registerBtn(),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  ///fieldInputText Widget
  Widget _fieldInputTextWidget(title, isObsecure, TextInputType inputType,
      TextEditingController tController) {
    return Container(
      margin: const EdgeInsets.only(top: 18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appText.regular(text: title),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: tController,
            style: appText.styles(
                color: AppThemeColor.textSecondaryColor, size: 16.0),
            obscureText: controller.validateObsecure(
              tController,
            ),
            maxLength: isObsecure ? 10 : null,
            onChanged: (value) => controller.onCheckPasswordCombination(),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14.0, vertical: 20.0),
                filled: true,
                fillColor: Colors.white.withOpacity(.2),
                suffixIcon: tController == controller.emailField
                    ? null
                    : IconButton(
                        onPressed: () {
                          controller.setVisibilityPassword(tController);
                        },
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: controller.validateObsecure(tController)
                              ? AppThemeColor.textSecondaryColor
                              : AppThemeColor.secondaryColor,
                        ),
                      ),
                hintText: 'Your $title ...',
                hintStyle: appText.styles(
                    color: AppThemeColor.textSecondaryColor, size: 16.0),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(120.0),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(120.0),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0))),
          )
        ],
      ),
    );
  }

  ///register button
  Widget _registerBtn() {
    return GestureDetector(
      onTap: controller.progressValue.value < 1 ? null : () {
        Get.rawSnackbar(message: 'Next To Register');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 28.0),
        height: 46.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(120.0),
            color: controller.progressValue.value < 1
                ? AppThemeColor.disableContainer
                : AppThemeColor.secondaryColor),
        child: Center(
          child:
              appText.regular(text: 'Register', size: 16, color: Colors.black),
        ),
      ),
    );
  }
}
