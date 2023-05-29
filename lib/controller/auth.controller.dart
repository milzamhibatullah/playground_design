import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final TextEditingController emailField = TextEditingController();
  final TextEditingController newPasswordField = TextEditingController();
  final TextEditingController confirmPasswordField = TextEditingController();
  RxDouble progressValue = 0.0.obs;
  RxBool newPassswVisibility = true.obs;
  RxBool confPasswVisibility = true.obs;

  @override
  void onReady() {
    // emailField.addListener(_onCheckPasswordCombination);
    // newPasswordField.addListener(_onCheckPasswordCombination);
    // confirmPasswordField.addListener(_onCheckPasswordCombination);
    super.onReady();
  }

  @override
  void onClose() {
    emailField.dispose();
    newPasswordField.dispose();
    confirmPasswordField.dispose();
    super.onClose();
  }

  ///if more than 6
  bool hasNumericAndMoreThan6() {
    final input = confirmPasswordField.text;
    final hasNumeric = RegExp(r'[0-9]').hasMatch(input);

    return hasNumeric && hasLength();
  }

  ///only check length
  bool hasLength() {
    final input = confirmPasswordField.text;
    return input.length > 6;
  }

  ///check if only has upper lower case and more than 6
  bool hasUppercaseLowercaseAndMoreThan6() {
    final input = confirmPasswordField.text;
    final hasUppercase = RegExp(r'[A-Z]').hasMatch(input);
    final hasLowercase = RegExp(r'[a-z]').hasMatch(input);

    return hasUppercase && hasLowercase && hasLength();
  }

  ///satisfied conditions is all required is done
  bool _satisfiesConditions() {
    return hasUppercaseLowercaseAndMoreThan6() && hasNumericAndMoreThan6();
  }

  void onCheckPasswordCombination() {
    ///check if not empty
    if (emailField.text.isNotEmpty &&
        newPasswordField.text.isNotEmpty &&
        confirmPasswordField.text.isNotEmpty) {
      ///check if new password and confirm password is match
      if(newPasswordField.text==confirmPasswordField.text){
        if (_satisfiesConditions()) {
          print('100%');
          progressValue.value = 1.0;
        } else if (hasNumericAndMoreThan6()) {
          print('66%');
          progressValue.value = .66;
        } else if (hasUppercaseLowercaseAndMoreThan6()) {
          print('66%');
          progressValue.value = .66;
        }else if (hasLength()) {
          print('33%');
          progressValue.value = .33;
        } else {
          progressValue.value = 0.0;
        }
      }else{
        progressValue.value=0.0;
      }
    } else {
      progressValue.value = 0.0;
    }
  }

  ///validate if textfield is obsecure
  bool validateObsecure(TextEditingController tController) {
    if (tController == emailField) {
      return false;
    } else {
      if (tController == newPasswordField) {
        return newPassswVisibility.value;
      } else if (tController == confirmPasswordField) {
        return confPasswVisibility.value;
      } else{
        return false;
      }
    }
  }

  ///validate visibilty off password
  void setVisibilityPassword(TextEditingController tController) {
    if (tController != emailField) {
      if (tController == newPasswordField) {
        newPassswVisibility.value
            ? newPassswVisibility.value = false
            : newPassswVisibility.value = true;
      } else if (tController == confirmPasswordField) {
        confPasswVisibility.value
            ? confPasswVisibility.value = false
            : confPasswVisibility.value = true;
      }
    }
  }
}
