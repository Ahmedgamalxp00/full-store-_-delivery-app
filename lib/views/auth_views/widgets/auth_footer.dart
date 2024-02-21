import 'package:delivery_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../core/constants.dart';


class AuthFooter extends StatelessWidget {
  const AuthFooter(
      {super.key, required this.text1, required this.text2, this.onPressed});
  final String text1;
  final String text2;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: AppStyles.styleSemiBold14
              .copyWith(color: const Color(0xFF676767)),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            text2,
            style: AppStyles.styleSemiBold14.copyWith(
                color: kPrimeryColor,
                decoration: TextDecoration.underline,
                decorationColor: kPrimeryColor),
          ),
        ),
      ],
    );
  }
}
