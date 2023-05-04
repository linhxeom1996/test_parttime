import 'package:flutter/material.dart';

import '../../constant/contant_ex.dart';

class TextFieldBase extends StatelessWidget {
  final String hintText;
  final bool? obscureText;
  final Color? cursorColor;
  final Widget? suffix;
  final Widget? prefix;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color? colorBorder;
  final TextEditingController? controller;
  final Color? backgroundColor;
  final Function(String) onChanged;
  final Function? onTab;
  final String? label;
  final Color? labelColor;
  final bool? isDense;
  final EdgeInsetsGeometry? contentPadding;
  const TextFieldBase(
      {super.key,
      this.controller,
      required this.hintText,
      this.suffix,
      this.obscureText = false,
      this.cursorColor,
      this.hintStyle,
      this.textStyle,
      this.colorBorder = ColorApp.transparent,
      this.backgroundColor,
      this.prefix,
      required this.onChanged,
      this.contentPadding,
      this.label,
      this.labelColor,
      this.isDense,
      this.onTab});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText!,
      cursorColor: cursorColor,
      style: textStyle ?? hintStyle,
      onChanged: (value) => onChanged(value),
      obscuringCharacter: '*',
      onTap: () => onTab,
      decoration: InputDecoration(
        isDense: isDense,
        hintText: hintText,
        hintStyle: hintStyle,
        suffixIcon: suffix,
        prefixIcon: prefix,
        labelText: label,
        labelStyle: TextStyleApp()
            .urban_regular(color: labelColor, size: Dimens.size18),
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
                vertical: Dimens.size8, horizontal: Dimens.size8),
        fillColor: backgroundColor,
        filled: true,
        focusedBorder: _border(colorBorder!),
        enabledBorder: _border(colorBorder!),
      ),
    );
  }

  InputBorder _border(Color color) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 1),
        borderRadius: BorderRadius.circular(Dimens.size8));
  }
}
