import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screen/sign_up.dart';

class AuthScreenController extends GetxController {
  static AuthScreenController get instance => Get.find();

  final pageController = PageController();
  RxBool isChecked = false.obs;
  RxBool showPassword = false.obs;

  void togglePasswordVisibility() {
    showPassword.value = !showPassword.value;
    update();
  }

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
    update();
  }

  void ForgetPasswordPage() {
    // Get.to(() => ForgetPasswordPage());
  }

  void GoSignUpPage() {
    Get.to(() => SignUpScreen());
  }
}


// import 'package:flutter/material.dart';
// import 'package:e_commerce_app/src/authentication/presentation/widgets/checkbox_theme.dart';
//
// class CheckboxExample extends StatefulWidget {
//   const CheckboxExample({super.key});
//
//   @override
//   State<CheckboxExample> createState() => _CheckboxExampleState();
// }
//
// class _CheckboxExampleState extends State<CheckboxExample> {
//   bool isChecked = false;
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Checkbox(
//       checkColor: Colors.white,
//       fillColor: EcomCheckboxTheme.lightCheckboxTheme.fillColor,
//       shape: EcomCheckboxTheme.lightCheckboxTheme.shape,
//
//       value: isChecked,
//       onChanged: (bool? boolRememberMe) {
//         setState(() {
//           isChecked = boolRememberMe!;
//           // print(boolRememberMe);
//         });
//       },
//     );
//   }
// }