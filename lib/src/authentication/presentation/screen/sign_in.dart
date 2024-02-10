import 'package:e_commerce_app/core/common/styles/spacing_styles.dart';
import 'package:e_commerce_app/core/utils/constants/colors.dart';
import 'package:e_commerce_app/core/utils/constants/image_strings.dart';
import 'package:e_commerce_app/core/utils/constants/sizes.dart';
import 'package:e_commerce_app/src/authentication/presentation/widgets/checkbox_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/constants/text_strings.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../controller/sign_in_controller.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EcomHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EcomSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              HeaderSignIn(dark: dark),
              FormFieldSignIn(),
              DividerSignIn(dark: dark),
              const SizedBox(height: 24),
              FooterSignIn(),
            ],
          ),
        ),
      ),
    );
  }
}

class FooterSignIn extends StatelessWidget {
  const FooterSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: EcomColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
                width: 24,
                height: 24,
                image: AssetImage(EcomImages.google)),
          ),
        ),
        const SizedBox(width: EcomSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(border: Border.all(color: EcomColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
                width: 24,
                height: 24,
                image: AssetImage(EcomImages.facebook)),
          ),
        ),
      ],
    );
  }
}

class DividerSignIn extends StatelessWidget {
  const DividerSignIn({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark ? EcomColors.darkerGrey : EcomColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
        Text(EcomTexts.orSignInWith.capitalize!, style: Theme.of(context).textTheme.labelMedium),
        Flexible(child: Divider(color: dark ? EcomColors.darkerGrey : EcomColors.grey, thickness: 0.5, indent: 5, endIndent: 60)),
      ],
    );
  }
}

class FormFieldSignIn extends StatelessWidget {
  final SignInController checkboxController = Get.put(SignInController());

  // const FormFieldSignIn({
  //   super.key,
  // });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: EcomSizes.spaceBtwSections),
        child: Column(
          children: [

            // Email
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: EcomTexts.email,
                  border: InputBorder.none),
            ),
            const SizedBox(height: EcomSizes.spaceBtwInputSignIn),

            //Password
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: EcomTexts.password,
                  suffixIcon: Icon(Iconsax.eye_slash),
                  border: InputBorder.none),
            ),
            const SizedBox(height: EcomSizes.spaceBtwInputSignIn),

            //Remember me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // RememberMe
                CheckboxTheme(
                    data: EcomCheckboxTheme.lightCheckboxTheme, child:
                Row(
                  children: [
                    Checkbox(
                      value: checkboxController.isChecked.value,
                        onChanged: (value) {
                        print('test');
                          checkboxController.toggleCheckbox();
                        },
                    activeColor: EcomColors.primary,),
                    const Text(EcomTexts.rememberMe),
                  ],
                ),
                ),
                //Forget Password
                TextButton(
                  onPressed: () {/*ForgotPasswordScreen()*/},
                  child: const Text(
                    EcomTexts.forgetPassword,
                    textAlign: TextAlign.right,
                    style: TextStyle(color: EcomColors.primary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: EcomSizes.spaceBtwSections),

            //SignIn Button
            SizedBox(
              width: double.infinity,
              height: EcomHelperFunctions.screenHeight() / 16,
              child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWithPassScreen()));
                    print("Sign In Clicked");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: EcomColors.buttonPrimary,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    EcomTexts.signIn,
                    style: TextStyle(color: EcomColors.white),
                  )),
            ),
            const SizedBox(height: EcomSizes.spaceBtwItems),

            //CreatedAccountLink
            Text(
              EcomTexts.createAccountSub,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                print("Create Account : clicked");
              },
              child: const Text(
                EcomTexts.createAccount,
                textAlign: TextAlign.center,
                style: TextStyle(color: EcomColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderSignIn extends StatelessWidget {
  const HeaderSignIn({super.key,
  required this.dark
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    // final dark = EcomHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(
              dark ? EcomImages.lightAppLogo : EcomImages.darkAppLogo),
        ),
        Text(
          EcomTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.left,
        ),
        Text(
          EcomTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}
