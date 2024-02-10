import 'package:flutter/material.dart';

import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/device/device_utility.dart';
import '../controller/onboarding_controller.dart';

class onBoardingSkip extends StatelessWidget {
  const onBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: EcomDeviceUtils.getAppBarHeight(),
      right: EcomSizes.defaultSpace,
      child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text('Skip')
      ),
    );
  }
}
