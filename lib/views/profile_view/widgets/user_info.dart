import 'package:delivery_app/controllers/profile_controller.dart';
import 'package:delivery_app/core/constants.dart';
import 'package:delivery_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class UserInfo extends GetView<ProfileController> {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Delivey (${controller.deliveryId})',
          style: AppStyles.styleExtraBold24.copyWith(color: kTextColor),
        ),
        const Gap(5),
        Text(
          '${controller.deliveryEmail}',
          style: AppStyles.styleSemiBold14,
        ),
        const Gap(10),
      ],
    );
  }
}
