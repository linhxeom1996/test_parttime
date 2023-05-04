import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../constant/contant_ex.dart';

class ButtonBase extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Function onPressed;
  final Color? backgroundColor;

  const ButtonBase(
      {super.key,
      required this.text,
      required this.onPressed,
      this.backgroundColor,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: backgroundColor,
            foregroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.size25),
            )),
        child: Text(text, style: textStyle),
      ),
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      onLongPress: () {
        Get.back();
      },
      child: Container(
        width: Dimens.size32,
        height: Dimens.size32,
        decoration: BoxDecoration(
            color: ColorApp.pink881.withOpacity(0.08), shape: BoxShape.circle),
        child: const Icon(Icons.arrow_back, color: ColorApp.black616),
      ),
    );
  }
}
