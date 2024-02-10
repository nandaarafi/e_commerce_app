import 'package:e_commerce_app/src/on_boarding/presentation/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/device/device_utility.dart';
import '../../../../core/utils/helpers/helper_functions.dart';

class onBoardingNextNavigation extends StatelessWidget {
  const onBoardingNextNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context){
    final dark = EcomHelperFunctions.isDarkMode(context);

    return Positioned(
      right: EcomSizes.defaultSpace,
      bottom: EcomDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? EcomColors.primary : EcomColors.black),
        child: const Icon(Iconsax.arrow_right_3),
      ),

    );
  }
}