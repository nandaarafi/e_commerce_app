import 'package:e_commerce_app/core/utils/constants/image_strings.dart';
import 'package:e_commerce_app/core/utils/constants/text_strings.dart';
import 'package:e_commerce_app/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_commerce_app/src/on_boarding/presentation/controller/onboarding_controller.dart';
import 'package:e_commerce_app/src/on_boarding/presentation/widgets/onboarding_dot_navigation.dart';
import 'package:e_commerce_app/src/on_boarding/presentation/widgets/onboarding_next.dart';
import 'package:e_commerce_app/src/on_boarding/presentation/widgets/onboarding_skip.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              onBoardingPage(
                  image: EcomImages.onBoardingImage1,
                  title: EcomTexts.onBoardingTitle1,
                  subTitle: EcomTexts.onBoardingSubTitle1
              ),
              onBoardingPage(
                  image: EcomImages.onBoardingImage2,
                  title: EcomTexts.onBoardingTitle2,
                  subTitle: EcomTexts.onBoardingSubTitle2
              ),
              onBoardingPage(
                  image: EcomImages.onBoardingImage3,
                  title: EcomTexts.onBoardingTitle3,
                  subTitle: EcomTexts.onBoardingSubTitle3
              ),
            ],
          ),
          // Skip button
          const onBoardingSkip(),

          // Dot Navigation SmoothPageIndicator
          const onBoardingDotNavigation(),

          // Circular Next Button
          const onBoardingNextNavigation(),
        ],
      ),
    );
  }
}



class onBoardingPage extends StatelessWidget {
  const onBoardingPage({super.key, 
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Image(
            width: EcomHelperFunctions.screenWidth() * 0.8,
            height: EcomHelperFunctions.screenHeight() * 0.6,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center
          ),
          const SizedBox(height: 16.0,),
          Text(
           subTitle,
           style: Theme.of(context).textTheme.bodyMedium,
           textAlign: TextAlign.center,
          )

        ],
      ),
    );
  }
}



