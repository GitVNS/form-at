import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:former/interface/home.dart';

import 'interface/utils/app_colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: AppColors.primary,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.secondary.shade900,
        appBarTheme: AppBarTheme(
            centerTitle: true,
            elevation: 0,
            titleTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            backgroundColor: AppColors.secondary.shade700),
        textTheme: TextTheme(
          displaySmall: TextStyle(color: AppColors.primary.shade700),
          displayMedium: TextStyle(color: AppColors.primary.shade700),
          displayLarge: TextStyle(color: AppColors.primary.shade700),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: OpenUpwardsPageTransitionsBuilder()
          },
        ),
        useMaterial3: false,
      ),
      home: const Home(),
    );
  }
}
