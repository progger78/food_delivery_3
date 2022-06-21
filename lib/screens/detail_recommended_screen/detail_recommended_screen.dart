import 'package:flutter/material.dart';
import '../../controllers/cart_controller.dart';
import '/controllers/popular_product_controller.dart';
import '/controllers/recommended_product_controller.dart';
import 'package:get/get.dart';
import '../../models/products_model.dart';
import '/utils/utils.dart';

import '/widgets/widgets.dart';
import 'components/detail_recommended_screen.dart';

class DetailRecommendedScreen extends StatelessWidget {
  DetailRecommendedScreen({Key? key, this.pageId, required this.page})
      : super(key: key);

  int? pageId;
  String? page;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ProductModel recommendedProduct = Get.find<RecommendedProductController>()
        .recommendedProductList[pageId!];
    Get.find<PopularProductController>()
        .initProduct(recommendedProduct, Get.find<CartController>());
    return Scaffold(
      body: DetailRecommendedBody(
          recommendedProduct: recommendedProduct, page: page),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: Dimensions.height70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => controller.setQuantity(false),
                      child: AppIcon(
                        icon: Icons.remove,
                        iconColor: Colors.white,
                        backgorundColor: AppColors.mainColor,
                      ),
                    ),
                    AppBigText(
                    
                      text:
                          '\$${recommendedProduct.price}  X  ${controller.inCartItems}',
                      size: Dimensions.font22,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: () => controller.setQuantity(true),
                      child: AppIcon(
                        icon: Icons.add,
                        iconColor: Colors.white,
                        backgorundColor: AppColors.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
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
                      margin: EdgeInsets.only(
                          left: Dimensions.width15, right: Dimensions.width15),
                      width: Dimensions.height70,
                      height: Dimensions.height70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius20,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => controller.addItem(recommendedProduct),
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
                              AppSmallText(
                                differSize: true,
                                text: '\$${recommendedProduct.price}',
                                color: Colors.white,
                                size: Dimensions.font26 - 2,
                              ),
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
