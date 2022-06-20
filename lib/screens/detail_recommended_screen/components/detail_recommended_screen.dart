import 'package:flutter/material.dart';
import 'package:food_delivery_3/models/products_model.dart';
import 'package:get/get.dart';
import '../../../controllers/popular_product_controller.dart';
import '../../../routes/route_helper.dart';
import '/utils/utils.dart';
import '/widgets/widgets.dart';

class DetailRecommendedBody extends StatelessWidget {
  DetailRecommendedBody({Key? key, this.recommendedProduct, this.page})
      : super(key: key);

  ProductModel? recommendedProduct;
  String? page;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: Dimensions.height70,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      if (page == 'cart-screen') {
                        Get.toNamed(RouteHelper.getCartScreen());
                      } else {
                        Get.toNamed(RouteHelper.getInitial());
                      }
                    },
                    child: AppIcon(
                      icon: Icons.close,
                    )),
                // AppIcon(icon: Icons.shopping_cart)
                GetBuilder<PopularProductController>(
                  builder: (product) {
                    return GestureDetector(
                      onTap: () {
                        product.totalItems <= 0
                            ? null
                            : Get.toNamed(RouteHelper.cartScreen);
                      },
                      child: Stack(
                        children: [
                          AppIcon(
                            icon: Icons.shopping_cart,
                          ),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? Positioned(
                                  top: 2,
                                  right: 2,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: Dimensions.height20,
                                    width: Dimensions.width20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.mainColor),
                                    child: FittedBox(
                                      child: AppSmallText(
                                        text: product.totalItems.toString(),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height25 + 5),
              child: Container(
                height: Dimensions.height45,
                alignment: Alignment.center,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      Dimensions.radius20,
                    ),
                    topRight: Radius.circular(
                      Dimensions.radius20,
                    ),
                  ),
                ),
                child: AppSmallText(
                  differSize: true,
                  text: '${recommendedProduct?.name!}',
                  size: Dimensions.font26,
                  color: Colors.black,
                ),
              )),
          pinned: true,
          backgroundColor: AppColors.yelowColor,
          expandedHeight: Dimensions.height80 * 4,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              '${AppConstants.baseUrl}/uploads/${(recommendedProduct?.img)!}',
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: Dimensions.width15),
            child: ExpandableText(text: (recommendedProduct?.description)!),
          ),
        )
      ],
    );
  }
}
