import 'package:e_commerce_app/core/utils/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: EcomTheme.lightTheme,
      darkTheme: EcomTheme.darkTheme,
    );
  }
}
