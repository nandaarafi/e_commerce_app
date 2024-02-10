import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/device/device_utility.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../controller/onboarding_controller.dart';

class onBoardingDotNavigation extends StatelessWidget {
  const onBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = EcomHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: EcomDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: EcomSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? EcomColors.light : EcomColors.dark,
            dotHeight: 6),
      ),
    );
  }
}