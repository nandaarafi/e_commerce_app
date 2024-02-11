import 'package:e_commerce_app/core/utils/constants/colors.dart';
import 'package:e_commerce_app/core/utils/constants/sizes.dart';
import 'package:e_commerce_app/src/authentication/presentation/screen/confirm_email.dart';
import 'package:e_commerce_app/src/authentication/presentation/widgets/checkbox_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../authentication/presentation/widgets/footer_form.dart';

import '../../../../core/utils/constants/text_strings.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../controller/sign_in_controller.dart';
import '../widgets/divider_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EcomHelperFunctions.isDarkMode(context);
    final controller = Get.put(AuthScreenController());

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EcomSizes.defaultSpace),
          child: Column(
            children: [
              ///Title
              Text(EcomTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: EcomSizes.spaceBtwSections),
              ///Form
              FormFieldSignUp(controller: controller, dark: dark),
              const SizedBox(height: EcomSizes.defaultSpace),
              /// DividerForm
              DividerForm(dark : dark),
              const SizedBox(height: EcomSizes.defaultSpace),
              ///Footer
              const FooterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class FormFieldSignUp extends StatelessWidget {
  const FormFieldSignUp({
    super.key,
    required this.controller,
    required this.dark,
  });

  final AuthScreenController controller;
  final bool dark;

  @override
  Widget build(BuildContext context) {

    return Form(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                // expands: false,
                decoration: InputDecoration(
                    labelText: EcomTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            const SizedBox(width: EcomSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: InputDecoration(
                    labelText: EcomTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
          ],
        ),
        const SizedBox(height: EcomSizes.spaceBtwInputFields),
        TextFormField(
          decoration: InputDecoration(
              labelText: EcomTexts.username,
              prefixIcon: Icon(Iconsax.user_add),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        ),
        const SizedBox(height: EcomSizes.spaceBtwInputFields),
        TextFormField(
          decoration: InputDecoration(
              labelText: EcomTexts.email,
              prefixIcon: Icon(Iconsax.direct_right),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        ),
        const SizedBox(height: EcomSizes.spaceBtwInputFields),
        TextFormField(
          decoration: InputDecoration(
              labelText: EcomTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        ),
        const SizedBox(height: EcomSizes.spaceBtwInputFields),

        GetBuilder<AuthScreenController>(
            builder: (controller) {
              return TextFormField(
                obscureText: /*false*/!controller.showPassword.value,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.password_check),
                    labelText: EcomTexts.password,
                    suffixIcon: IconButton(
                      onPressed: () {
                        print(controller.showPassword.value);
                        controller.togglePasswordVisibility();
                      },
                      icon: Icon(
                        controller.showPassword.value
                            ? Iconsax.eye
                            : Iconsax.eye_slash,),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              );
            }
        ),
        const SizedBox(height: EcomSizes.spaceBtwItems),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 24, height: 24,
              child: Obx(
                    () => Checkbox(
                  checkColor: Colors.white,
                  fillColor:
                  EcomCheckboxTheme.lightCheckboxTheme.fillColor,
                  shape: EcomCheckboxTheme.lightCheckboxTheme.shape,
                  value: controller.isChecked.value,
                  onChanged: (bool? stateAgreePolicy) {
                    // print(StateRememberMe);
                    controller.toggleCheckbox();
                  },
                ),
              ), ),

            const SizedBox(width: EcomSizes.spaceBtwCheckboxText),
            Text.rich(TextSpan(children: [
              TextSpan(text: '${EcomTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: '${EcomTexts.privacyPolicy} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                decoration: TextDecoration.underline,
                color: dark ? EcomColors.white : EcomColors.primary,
                decorationColor: dark ? EcomColors.white : EcomColors.primary)),

              TextSpan(text: '${EcomTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: '${EcomTexts.termsOfUse} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? EcomColors.white : EcomColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? EcomColors.white : EcomColors.primary)),
            ]))
          ],
        ),
        const SizedBox(height: EcomSizes.spaceBtwItems),

        SizedBox(
          width: double.infinity,
          height: EcomHelperFunctions.screenHeight() / 16,
          child: ElevatedButton(
              onPressed: () {
                Get.off(() => ConfirmEmailScreen());
                // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWithPassScreen()));
                // print("Sign In Clicked");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: EcomColors.buttonPrimary,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                EcomTexts.createAccount,
                style: TextStyle(color: EcomColors.white),

              )),
        ),
      ],
    ),
    );
  }
}
