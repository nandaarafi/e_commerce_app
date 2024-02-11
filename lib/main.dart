import 'package:e_commerce_app/core/utils/theme/theme.dart';
import 'package:e_commerce_app/src/authentication/presentation/screen/confirm_email_succes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: EcomTheme.lightTheme,
      darkTheme: EcomTheme.darkTheme,
      home: const ConfirmEmailSucces(),
    );
  }
}
