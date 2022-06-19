import 'package:flutter/material.dart';
import 'package:food_delivery_3/widgets/bottom_card_with_buttns.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../controllers/popular_product_controller.dart';
import '../../models/products_model.dart';
import 'components/detail_popular_body.dart';

class DetailPopularScreen extends StatelessWidget {
   DetailPopularScreen({Key? key, this.pageId}) : super(key: key);

  int? pageId;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        Get.find<PopularProductController>().popularProductList[pageId!];
        Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      body:  DetailPopularBody(product: product),
      bottomNavigationBar: BottomCardWithButns(isCounter: true, popularProduct: product ),
    );
  }
}
