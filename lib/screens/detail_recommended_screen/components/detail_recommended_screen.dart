import 'package:flutter/material.dart';
import 'package:food_delivery_3/models/products_model.dart';
import 'package:get/get.dart';
import '../../../routes/route_helper.dart';
import '/utils/utils.dart';
import '/widgets/widgets.dart';

class DetailRecommendedBody extends StatelessWidget {
  DetailRecommendedBody({Key? key, this.recommendedProduct}) : super(key: key);

  ProductModel? recommendedProduct;

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
                    onTap: () => Get.toNamed(RouteHelper.initialRoute),
                    child: AppIcon(
                      icon: Icons.close,
                    )),
                AppIcon(icon: Icons.shopping_cart)
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
          )),
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
