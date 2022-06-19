import 'package:food_delivery_3/screens/cart_screen.dart/cart_screen.dart';

import '/screens/detail_popular_screen/detail_popular_screen.dart';
import '/screens/detail_recommended_screen/detail_recommended_screen.dart';
import '/screens/home_screen/home_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initialRoute = '/';

  static const String recommendedFood = '/recommended-food';
  static const String popularFood = '/popular-food';
  static const String cartScreen = '/cart-screen';

  static String getInitial() => '$initialRoute';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) =>
      '$recommendedFood?pageId=$pageId';
  static String getCartScreen() => '$cartScreen';

  static List<GetPage> routes = [
    GetPage(
      transition: Transition.fadeIn,
      name: initialRoute,
      page: () => const HomeScreen(),
    ),
    GetPage(
        name: recommendedFood,
        transition: Transition.fadeIn,
        page: () {
          var pageId = Get.parameters['pageId'];
          return DetailRecommendedScreen(
            pageId: int.parse(pageId!),
          );
        }),
    GetPage(
        name: popularFood,
        transition: Transition.fadeIn,
        page: () {
          var pageId = Get.parameters['pageId'];
          return DetailPopularScreen(
            pageId: int.parse(
              pageId!,
            ),
          );
        }),
    GetPage(
      name: cartScreen,
      page: () {
        return CartScreen();
      },
    )
  ];
}
