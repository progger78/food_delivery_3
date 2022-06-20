import 'package:flutter/material.dart';
import 'package:food_delivery_3/controllers/cart_controller.dart';
import 'package:food_delivery_3/controllers/popular_product_controller.dart';
import 'package:food_delivery_3/controllers/recommended_product_controller.dart';
import 'package:food_delivery_3/routes/route_helper.dart';
import 'package:food_delivery_3/screens/detail_popular_screen/detail_popular_screen.dart';
import 'package:food_delivery_3/utils/utils.dart';
import 'package:food_delivery_3/widgets/widgets.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height20 * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.to(() => DetailPopularScreen(page: 'home')),
                  child: AppIcon(
                    icon: Icons.arrow_back,
                    iconColor: Colors.white,
                    backgorundColor: AppColors.mainColor,
                  ),
                ),
                SizedBox(
                  width: Dimensions.width45 * 4,
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(RouteHelper.initialRoute),
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgorundColor: AppColors.mainColor,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgorundColor: AppColors.mainColor,
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.height20 * 6,
            right: Dimensions.width20,
            left: Dimensions.width20,
            bottom: 0,
            child: Container(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(
                  builder: (cartController) {
                    var cartItem = cartController.getItems;
                    return ListView.builder(
                      itemCount: cartItem.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 100,
                          width: double.maxFinite,
                          color: Colors.white,
                          margin: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  var popularIndex =
                                      Get.find<PopularProductController>()
                                          .popularProductList
                                          .indexOf(cartItem[index].product);
                                  if (popularIndex >= 0) {
                                    Get.toNamed(RouteHelper.getPopularFood(
                                        popularIndex, 'cart-screen'));
                                  } else {
                                    var recommendedIndex =
                                        Get.find<RecommendedProductController>()
                                            .recommendedProductList
                                            .indexOf(cartItem[index].product);
                                    if (recommendedIndex >= 0) {
                                      Get.toNamed(
                                          RouteHelper.getRecommendedFood(
                                              recommendedIndex, 'cart-screen'));
                                      
                                      
                                    }
                                  }
                                },
                                child: Container(
                                  height: Dimensions.height20 * 5,
                                  width: Dimensions.width20 * 5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius25),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          '${AppConstants.baseUrl}${AppConstants.uploadUrl}${cartController.getItems[index].img!}',
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppBigText(
                                        text: cartController
                                            .getItems[index].name!,
                                        color: Colors.black54,
                                        overflow: TextOverflow.clip,
                                      ),
                                      const AppSmallText(text: 'Spicy'),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppBigText(
                                            text:
                                                '\$${cartController.getItems[index].price}',
                                            color: Colors.red,
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    cartController.addItem(
                                                        cartItem[index]
                                                            .product!,
                                                        -1);
                                                  },
                                                  icon: Icon(
                                                    Icons.remove,
                                                    size: Dimensions.height20,
                                                  )),
                                              AppBigText(
                                                text: cartItem[index]
                                                    .quantity
                                                    .toString(),
                                                size: Dimensions.font26,
                                                color: Colors.black,
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  cartController.addItem(
                                                      cartItem[index].product!,
                                                      1);
                                                },
                                                icon: Icon(
                                                  Icons.add,
                                                  size: Dimensions.height20,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          
        ],
        
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              
              Container(
                width: size.width,
                height: size.height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius40),
                    topRight: Radius.circular(Dimensions.radius40),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          left: Dimensions.width25, right: Dimensions.width15),
                      width: Dimensions.height70,
                      height: Dimensions.height70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius20,
                        ),
                      ),
                      child: AppBigText(text: '\$${cartController.totalAmount}', color: Colors.black,)
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){},
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          margin: EdgeInsets.only(
                              left: Dimensions.width15,
                              right: Dimensions.width15),
                          height: Dimensions.height70,
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius20,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              VerticalDivider(
                                thickness: 2,
                                endIndent: Dimensions.height20,
                                indent: Dimensions.height25,
                                color: Colors.white,
                              ),
                              AppSmallText(
                                  differSize: true,
                                  text: 'Add To Cart',
                                  color: Colors.white,
                                  size: Dimensions.font26 - 2)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
