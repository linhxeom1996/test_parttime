import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:test_project/screen/login/controller/login_controller.dart';
import 'package:test_project/models/email_model.dart';
import 'package:test_project/screen/routers/app_pages.dart';
import 'package:test_project/screen/widgets/button_base.dart';
import 'package:test_project/screen/widgets/image_widget.dart';
import 'package:test_project/screen/widgets/text_field_base.dart';
import '../../../../constant/contant_ex.dart';
import '../../widgets/orther_widget.dart';

class UserNamePage extends GetView<LoginController> {
  const UserNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorApp.white,
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.size25, vertical: Dimens.size30),
              child: Obx(() {
                var error = controller.emailError.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(bottom: Dimens.size30),
                      child: BackButtonWidget(),
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        "Sign in",
                        style: TextStyleApp().urban_semibold(
                            color: ColorApp.black, size: Dimens.size18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: Dimens.size25, bottom: Dimens.size16),
                      child: Text(
                        error == EmailInfo.empty.info
                            ? "Welcome to wiHelper!"
                            : "Welcome to !",
                        style: TextStyleApp().urban_medium(
                            color: ColorApp.black424, size: Dimens.size16),
                      ),
                    ),
                    Stack(
                      children: [
                        TextFieldBase(
                          controller: controller.emailController,
                          hintText: "Enter email or mobile number",
                          hintStyle: TextStyleApp().urban_light(
                              color: ColorApp.black999, size: Dimens.size16),
                          onChanged: (value) {
                            controller.checkEmailOrPhone(value);
                          },
                          colorBorder: error == EmailInfo.empty.info ||
                                  error == EmailInfo.valid.info
                              ? ColorApp.transparent
                              : ColorApp.red000,
                          cursorColor: ColorApp.black999,
                          suffix: error == EmailInfo.invalid.info
                              ? Container(
                                  margin: const EdgeInsets.only(
                                      right: Dimens.size16),
                                  padding: const EdgeInsets.all(Dimens.size14),
                                  child: const ImageWidget(
                                    asset: IconApp.ic_warning,
                                    height: Dimens.size18,
                                    width: Dimens.size20,
                                  ),
                                )
                              : null,
                          prefix: Padding(
                            padding: const EdgeInsets.only(
                                left: Dimens.size16,
                                top: Dimens.size8,
                                bottom: Dimens.size8,
                                right: Dimens.size4),
                            child: SizedBox(
                              width: Dimens.size48,
                              child: Row(
                                children: <Widget>[
                                  controller.onPhone.value == false
                                      ? const ImageWidget(
                                          asset: IconApp.ic_email,
                                          width: Dimens.size24,
                                          height: Dimens.size16)
                                      : const SizedBox(
                                          width: Dimens.size24,
                                          height: Dimens.size16),
                                  const Icon(Icons.arrow_drop_down,
                                      color: ColorApp.black999)
                                ],
                              ),
                            ),
                          ),
                          backgroundColor: ColorApp.black0F0,
                        ),
                        controller.onPhone.value == true
                            ? const Align(
                                alignment: Alignment.centerLeft,
                                child: CountryCodePicker(
                                  initialSelection: 'VN',
                                  flagWidth: Dimens.size26,
                                  showDropDownButton: false,
                                  hideMainText: true,
                                ),
                              )
                            : Container()
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: Dimens.size20, bottom: Dimens.size16),
                      child: ButtonBase(
                        text: 'Next',
                        onPressed: () {
                          if (error == EmailInfo.valid.info) {
                            Get.toNamed(ArchRoutes.password);
                          }
                        },
                        textStyle: TextStyleApp().urban_semibold(
                            color: error == EmailInfo.invalid.info ||
                                    error == EmailInfo.valid.info
                                ? ColorApp.white
                                : ColorApp.black999,
                            size: Dimens.size16),
                        backgroundColor: error == EmailInfo.valid.info
                            ? ColorApp.purple08D
                            : error == EmailInfo.invalid.info
                                ? ColorApp.red000
                                : ColorApp.black0F0,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'New to the app? ',
                              style: TextStyleApp().urban_medium(
                                  color: ColorApp.black999,
                                  size: Dimens.size16)),
                          TextSpan(
                              text: 'Create an account',
                              style: TextStyleApp().urban_medium(
                                  color: ColorApp.blue4B3, size: Dimens.size16))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: Dimens.size8, bottom: Dimens.size4),
                      child: Text(
                        'By creating an account, you agree to wiHelper\'s Terms of Use and Privacy Policy. ',
                        style: TextStyleApp().urban_medium(
                            color: ColorApp.black999, size: Dimens.size14),
                      ),
                    ),
                    Row(
                      children: List.generate(
                          2,
                          (index) => Padding(
                                padding:
                                    const EdgeInsets.only(right: Dimens.size16),
                                child: Row(
                                  children: <Widget>[
                                    const ImageWidget(
                                      asset: IconApp.ic_goto_document,
                                      width: Dimens.size14,
                                      height: Dimens.size14,
                                    ),
                                    const SizedBox(width: Dimens.size6),
                                    Text(
                                        index == 0
                                            ? 'Terms of Use'
                                            : 'Privacy Policy',
                                        style: TextStyleApp().urban_medium(
                                            color: ColorApp.blue4B3,
                                            size: Dimens.size14))
                                  ],
                                ),
                              )),
                    ),
                    const SizedBox(height: Dimens.size20),
                    const OrDivider()
                  ],
                );
              })),
        ),
      ),
    );
  }
}
