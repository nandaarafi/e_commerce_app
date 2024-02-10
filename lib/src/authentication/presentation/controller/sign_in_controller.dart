
import 'package:get/get.dart';

class SignInController extends GetxController {
  // static SignInController get instance => Get.find();

  /// Variables
  // final pageController = PageController();
  RxBool isChecked = true.obs;
  /// Update Current Index when Page Scroll
  void toggleCheckbox() {
    isChecked.toggle();
  }
}