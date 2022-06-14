import 'package:flutter/material.dart';
import 'package:food_delivery_3/screens/detail_popular_screen/detail_popular_screen.dart';
import 'package:food_delivery_3/utils/configurations.dart';
import 'package:get/get.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food delivery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.mainColor,
          secondary: AppColors.yelowColor,
        ),
      ),
      home: const DetailPopularScreen(),
    );
  }
}
