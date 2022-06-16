import 'package:flutter/material.dart';
import 'package:food_delivery_3/controllers/recommended_product_controller.dart';
import 'package:get/get.dart';
import '../../models/products_model.dart';
import '/utils/utils.dart';
import '/widgets/bottom_card_with_buttns.dart';
import '/widgets/widgets.dart';
import 'components/detail_recommended_screen.dart';

class DetailRecommendedScreen extends StatelessWidget {
  DetailRecommendedScreen({Key? key, this.pageId}) : super(key: key);

  int? pageId;

  @override
  Widget build(BuildContext context) {
    ProductModel recommendedProduct = Get.find<RecommendedProductController>()
        .recommendedProductList[pageId!];
    return Scaffold(
      body: DetailRecommendedBody(recommendedProduct: recommendedProduct),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: Dimensions.height70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  iconColor: Colors.white,
                  backgorundColor: AppColors.mainColor,
                ),
                AppBigText(
                  isBigger: true,
                  text: '\$${recommendedProduct.price}  X  ${0}',
                  size: Dimensions.font22,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                AppIcon(
                  icon: Icons.add,
                  iconColor: Colors.white,
                  backgorundColor: AppColors.mainColor,
                ),
              ],
            ),
          ),
          BottomCardWithButns(isCounter: false, recommendedProduct: recommendedProduct,)
        ],
      ),
    );
  }
}
