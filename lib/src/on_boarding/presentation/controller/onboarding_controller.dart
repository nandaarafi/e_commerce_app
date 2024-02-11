
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../authentication/presentation/screen/sign_in.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when Page Scroll
void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected image
void dotNavigationClick(index) {
  currentPageIndex.value = index;
  pageController.jumpTo(index);
}
/// Update Current Index & Jump to next page
void nextPage() {
  if(currentPageIndex == 2) {
    Get.to(() => const SignInScreen());
    // Get.to(const SignInScreen());
  } else {
    int page = currentPageIndex.value + 1;
    pageController.jumpToPage(page);
  }
}
/// Update Current Index & Jump to the last Page
void skipPage() {
  currentPageIndex.value = 2;
  pageController.jumpToPage(2);
}
}