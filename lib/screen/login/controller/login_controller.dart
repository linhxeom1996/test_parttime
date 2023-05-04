// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/models/email_model.dart';
import 'package:test_project/models/pass_model.dart';
import 'package:test_project/repository/validation.dart';

class LoginController extends GetxController {
  final LoginValidate _loginValidate = LoginValidate();

  late TextEditingController emailController;
  late TextEditingController passController;
  var emailError = ''.obs;
  var onPhone = false.obs;
  var passError = ''.obs;

  @override
  void onInit() {
    emailController = TextEditingController();
    passController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passController.dispose();
    super.onClose();
  }

  void checkEmailOrPhone(String value) {
    if (value.isEmpty) {
      onPhone.value = false;
      emailError.value = EmailInfo.empty.info;
    } else {
      if (int.tryParse(value) != null) {
        onPhone.value = true;
        var phone = _loginValidate.phoneValid(value);
        if (phone) {
          emailError.value = EmailInfo.valid.info;
        } else {
          emailError.value = EmailInfo.invalid.info;
        }
      } else {
        onPhone.value = false;
        var email = _loginValidate.emailValid(value);
        if (email) {
          emailError.value = EmailInfo.valid.info;
        } else {
          emailError.value = EmailInfo.invalid.info;
        }
      }
    }
  }

  void checkPass(String password) {
    if (password.isEmpty) {
      passError.value = PassInfo.empty.info;
    } else {
      var result = _loginValidate.passValid(password);
      if (result) {
        passError.value = PassInfo.valid.info;
      } else {
        passError.value = PassInfo.invalid.info;
      }
    }
  }
}
