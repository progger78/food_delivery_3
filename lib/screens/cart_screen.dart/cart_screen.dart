import 'package:flutter/material.dart';
import 'package:food_delivery_3/controllers/cart_controller.dart';
import 'package:food_delivery_3/routes/route_helper.dart';
import 'package:food_delivery_3/screens/detail_popular_screen/detail_popular_screen.dart';
import 'package:food_delivery_3/utils/utils.dart';
import 'package:food_delivery_3/widgets/widgets.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  onTap: () => Get.to(() => DetailPopularScreen()),
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
                    return ListView.builder(
                      itemCount: cartController.getItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 100,
                          width: double.maxFinite,
                          color: Colors.white,
                          margin: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Container(
                                height: Dimensions.height20 * 5,
                                width: Dimensions.width20 * 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius25),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        '${AppConstants.baseUrl}${ AppConstants.uploadUrl}${cartController.getItems[index].img!}',
                                      ),
                                      fit: BoxFit.cover),
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
                                        text: cartController.getItems[index].name!,
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
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.remove,
                                                    size: Dimensions.height20,
                                                  )),
                                              AppBigText(
                                                text: '0',
                                                size: Dimensions.font26,
                                                color: Colors.black,
                                              ),
                                              IconButton(
                                                onPressed: () {},
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
          )
        ],
      ),
    );
  }
}
