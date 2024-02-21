import 'package:delivery_app/core/constants.dart';
import 'package:delivery_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';


class CustomBottn extends StatelessWidget {
  const CustomBottn({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
          height: 50,
          color: kPrimeryColor,
          disabledColor: kPrimeryColor,
          onPressed: onTap,
          child: Text(
            text,
            style: AppStyles.styleSemiBold20,
          )),
    );
  }
}
