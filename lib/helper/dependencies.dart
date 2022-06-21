import 'package:food_delivery_3/controllers/cart_controller.dart';
import 'package:food_delivery_3/data/repository/cart_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/controllers/popular_product_controller.dart';
import '/controllers/recommended_product_controller.dart';
import '/data/api/api_clien.dart';
import '/data/repository/popular_product_repo.dart';
import '/utils/app_constants.dart';
import 'package:get/get.dart';

import '../data/repository/recommende_product_repo.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
Get.lazyPut(() => sharedPreferences);

  Get.lazyPut(() => ApiClient(baseUrl: AppConstants.baseUrl));

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyReplace(() => CartController(cartRepo: Get.find()));
}









// Future<void> init() async {
//   //api client
//   Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));

//   //repos

//   Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

//   //controllers
//   Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
// }
