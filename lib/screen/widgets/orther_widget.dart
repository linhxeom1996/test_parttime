import 'package:flutter/material.dart';

import '../../constant/contant_ex.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Expanded(
            child: Divider(
                color: ColorApp.black0C0,
                height: Dimens.size1,
                thickness: Dimens.size1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.size16),
          child: Text("or",
              style: TextStyleApp().urban_regular(
                  color: ColorApp.black999, size: Dimens.size16)),
        ),
        const Expanded(
            child: Divider(
                color: ColorApp.black0C0,
                height: Dimens.size1,
                thickness: Dimens.size1)),
      ],
    );
  }
}
