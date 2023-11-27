import 'package:flutter/material.dart';
import 'package:minicustomerapp/const/app_colors.dart';
import 'package:minicustomerapp/ui/home/HomePage.dart';
import 'package:minicustomerapp/ui/signup/singup_page.dart';

void main() {
  runApp(const MiniCustomerApp());
}

class MiniCustomerApp extends StatelessWidget {
  const MiniCustomerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary, primary: AppColors.primary),
        textTheme: TextTheme(
          titleMedium: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),titleSmall: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        )
        ),
      ),
    );
  }
}
