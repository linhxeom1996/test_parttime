// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:test_project/models/email_model.dart';
import 'package:test_project/models/pass_model.dart';
import 'package:test_project/screen/login/controller/login_controller.dart';
import 'package:test_project/screen/widgets/button_base.dart';
import 'package:test_project/screen/widgets/image_widget.dart';
import 'package:test_project/screen/widgets/text_field_base.dart';
import '../../../../constant/contant_ex.dart';
import '../../widgets/orther_widget.dart';

class PasswordPage extends StatelessWidget {
  PasswordPage({super.key});

  final LoginController _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorApp.white,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimens.size25, vertical: Dimens.size30),
            child: Obx(() {
              var error = _controller.passError.value;
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
                      "Enter password",
                      style: TextStyleApp().urban_semibold(
                          color: ColorApp.black, size: Dimens.size18),
                    ),
                  ),
                  _TextFieldPass(controller: _controller),
                  SizedBox(
                    width: double.infinity,
                    child: Text("Forgot your password?",
                        style: TextStyleApp().urban_medium(
                            color: ColorApp.blue4B3, size: Dimens.size16),
                        textAlign: TextAlign.right),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        top: Dimens.size30, bottom: Dimens.size20),
                    child: OrDivider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: Dimens.size20, bottom: Dimens.size12),
                    child: ButtonBase(
                        text: 'Get an OTP on your phone',
                        onPressed: () {},
                        textStyle: TextStyleApp().urban_medium(
                            color: ColorApp.black545, size: Dimens.size16),
                        backgroundColor: ColorApp.purple078.withOpacity(0.15)),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ImageWidget(
                          asset: IconApp.ic_info,
                          width: Dimens.size16,
                          height: Dimens.size16),
                      const SizedBox(width: Dimens.size4),
                      Expanded(
                        child: Text(
                          "We’’ call or text you to confirm your number. Standard message and data rates may apply.",
                          style: TextStyleApp().urban_medium(
                              color: ColorApp.black999, size: Dimens.size14),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: Dimens.size36, bottom: Dimens.size12),
                    child: ButtonBase(
                      text: 'Sign in',
                      onPressed: () {},
                      textStyle: TextStyleApp().urban_semibold(
                          color: error == PassInfo.invalid.info ||
                                  error == PassInfo.valid.info
                              ? ColorApp.white
                              : ColorApp.black999,
                          size: Dimens.size16),
                      backgroundColor: error == PassInfo.valid.info
                          ? ColorApp.purple08D
                          : error == PassInfo.invalid.info
                              ? ColorApp.red000
                              : ColorApp.black0F0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        2,
                        (index) => Padding(
                              padding:
                                  const EdgeInsets.only(right: Dimens.size12),
                              child: Text(
                                index == 0 ? "Get help?" : "Contact support",
                                style: TextStyleApp().urban_medium(
                                    color: ColorApp.blue4B3,
                                    size: Dimens.size16),
                              ),
                            )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: Dimens.size8),
                    child: Row(
                      children: <Widget>[
                        Container(
                          color: ColorApp.transparent,
                          child: Row(
                            children: <Widget>[
                              const ImageWidget(
                                asset: IconApp.ic_checkbox,
                                width: Dimens.size20,
                                height: Dimens.size20,
                              ),
                              const SizedBox(width: Dimens.size8),
                              Text(
                                "Keep me signed in.",
                                style: TextStyleApp().urban_medium(
                                    color: ColorApp.black545,
                                    size: Dimens.size14),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: Dimens.size8),
                        Text(
                          "Details?",
                          style: TextStyleApp().urban_medium(
                              color: ColorApp.blue4B3, size: Dimens.size14),
                        )
                      ],
                    ),
                  )
                ],
              );
            })),
      ),
    );
  }
}

class _TextFieldPass extends StatefulWidget {
  final LoginController controller;
  const _TextFieldPass({required this.controller});

  @override
  State<_TextFieldPass> createState() => _TextFieldPassState();
}

class _TextFieldPassState extends State<_TextFieldPass> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    var error = widget.controller.passError.value;
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.size30, bottom: Dimens.size8),
      child: Container(
        padding: EdgeInsets.only(
            top: error == PassInfo.empty.info ? 0 : Dimens.size16),
        decoration: BoxDecoration(
            color: error == PassInfo.empty.info
                ? ColorApp.black0F0
                : ColorApp.transparent,
            border: Border.all(
                color: error == PassInfo.empty.info
                    ? ColorApp.transparent
                    : error == PassInfo.invalid.info
                        ? ColorApp.red000
                        : ColorApp.black0C0),
            borderRadius: BorderRadius.circular(Dimens.size8)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: TextFieldBase(
                    controller: widget.controller.passController,
                    obscureText: _obscureText,
                    isDense: error == PassInfo.empty.info ? false : true,
                    hintText: "Enter password",
                    hintStyle: TextStyleApp().urban_light(
                        color: ColorApp.black999, size: Dimens.size16),
                    textStyle: TextStyleApp().urban_light(
                        color: ColorApp.black424, size: Dimens.size16),
                    label: error == PassInfo.empty.info ? null : "Password",
                    labelColor: error != PassInfo.invalid.info
                        ? ColorApp.purple078
                        : ColorApp.red000,
                    onChanged: (value) {
                      widget.controller.checkPass(value);
                    },
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: Dimens.size16, vertical: Dimens.size8),
                    colorBorder: ColorApp.transparent,
                    cursorColor: ColorApp.black999,
                    backgroundColor: ColorApp.transparent,
                    suffix: error == PassInfo.empty.info
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(Dimens.size24,
                                  Dimens.size12, 0, Dimens.size12),
                              child: ImageWidget(
                                  asset: _obscureText == true
                                      ? IconApp.ic_eye_close
                                      : IconApp.ic_eye_open,
                                  width: Dimens.size12,
                                  fit: BoxFit.fitWidth),
                            ),
                          )
                        : null)),
            Container(
              padding: const EdgeInsets.only(right: Dimens.size16),
              child: error == PassInfo.invalid.info
                  ? const ImageWidget(
                      asset: IconApp.ic_warning,
                      height: Dimens.size18,
                      width: Dimens.size20,
                    )
                  : error == PassInfo.valid.info
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: SizedBox(
                            width: Dimens.size24,
                            height: Dimens.size18,
                            child: ImageWidget(
                                fit: BoxFit.fitWidth,
                                asset: _obscureText == true
                                    ? IconApp.ic_eye_close
                                    : IconApp.ic_eye_open),
                          ),
                        )
                      : Container(),
            )
          ],
        ),
      ),
    );
  }
}
