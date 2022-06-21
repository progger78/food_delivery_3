import 'package:flutter/material.dart';
import 'package:food_delivery_3/controllers/popular_product_controller.dart';
import 'package:food_delivery_3/controllers/recommended_product_controller.dart';
import 'package:food_delivery_3/routes/route_helper.dart';

import '/utils/configurations.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(
      builder: (_) => GetBuilder<RecommendedProductController>(
        builder: (controller) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food delivery',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: AppColors.mainColor,
              secondary: AppColors.yelowColor,
            ),
          ),
          // home: const SplashScreen(),
          initialRoute: RouteHelper.getSplashScreen(),
          getPages: RouteHelper.routes,
        ),
      ),
    );
  }
}
