import 'package:food_delivery_3/screens/cart_screen.dart/cart_screen.dart';
import 'package:food_delivery_3/screens/home_screen/home_screen.dart';
import 'package:food_delivery_3/screens/splash_screen/splash_screen.dart';

import '/screens/detail_popular_screen/detail_popular_screen.dart';
import '/screens/detail_recommended_screen/detail_recommended_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initialRoute = '/';

  static const String recommendedFood = '/recommended-food';
  static const String popularFood = '/popular-food';
  static const String cartScreen = '/cart-screen';
  static const String splashScreen = '/splash-screen';

  static String getInitial() => initialRoute;
  static String getSplashScreen() => '$splashScreen';
  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartScreen() => cartScreen;

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
          var page = Get.parameters['page'];
          return DetailRecommendedScreen(
            pageId: int.parse(pageId!),
            page: page
          );
        }),
    GetPage(
        name: popularFood,
        transition: Transition.fadeIn,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return DetailPopularScreen(
            pageId: int.parse(
              pageId!,
            ),
            page: page!
          );
        }),
    GetPage(
      name: cartScreen,
      page: () {
        return const CartScreen();
      },
    ),
    GetPage(
      name: splashScreen,
      transition: Transition.fade,
      page: () {
        return const SplashScreen();
      },
    )
    
  ];
}
