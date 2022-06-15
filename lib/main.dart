import 'package:flutter/material.dart';
import '/controllers/popular_product_controller.dart';
import '/controllers/recommended_product_controller.dart';
import '/utils/configurations.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;
import 'screens/home_screen/home_screen.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food delivery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.mainColor,
          secondary: AppColors.yelowColor,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
